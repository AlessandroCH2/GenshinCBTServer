using GenshinCBTServer.Network;
using GenshinCBTServer.Player;
using GenshinCBTServer.Protocol;
using System;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection.Metadata.Ecma335;

namespace GenshinCBTServer.Controllers
{
    public class CombatController
    {
        // those are hardcoded ids of gadgets that are marked as invincible but they shouldn't be
        public static List<uint> blackList = new() { 70220008, 70220021 }; // don't worry, it's temporary until we implement ability manager
       
        [Server.Handler(CmdType.EvtBeingHitNotify)]
        public static void OnEvtBeingHitNotify(Client session, CmdType cmdId, Network.Packet packet)
        {

            EvtBeingHitNotify req = packet.DecodeBody<EvtBeingHitNotify>();
            GameEntity? entity = session.world.entities.Find(entity=>entity.entityId==req.AttackResult.DefenseId);
            if(entity != null )
            {
                float dmg = req.AttackResult.Damage;
                float curHp = entity.GetFightProp(FightPropType.FIGHT_PROP_CUR_HP)-dmg;
                bool isDamageable = true;
                if(entity is GameEntityGadget)
                {
                    GameEntityGadget gadget = (GameEntityGadget)entity;
                    if((gadget.GetGadgetConfigRow().Combat.property.isInvincible || gadget.GetGadgetConfigRow().Combat.property.isLockHP || gadget.GetGadgetExcel().type >= 10 && gadget.GetGadgetExcel().type != 19) && !blackList.Contains(gadget.GetGadgetExcel().id)){
                        Server.Print($"Gadget {gadget.id} ({gadget.GetGadgetExcel().id} {gadget.GetGadgetExcel().jsonName} is invincible");
                        Server.Print($"isInvincible {gadget.GetGadgetConfigRow().Combat.property.isInvincible}, type {gadget.GetGadgetExcel().type}");
                        isDamageable = false;
                    } else {
                        entity.FightPropUpdate(FightPropType.FIGHT_PROP_CUR_HP, curHp);
                        Server.Print($"not invincible? {gadget.GetGadgetConfigRow().Combat.property.isInvincible}, type {gadget.GetGadgetExcel().type}, {gadget.GetGadgetExcel().id}");
                    }
                    //momentary fix
                    CheckIsController(gadget, req);
                }
                else
                {
                    if (entity is GameEntityMonster)
                    {
                        GameEntityMonster monster = (GameEntityMonster)entity;
                        if(monster.isHpLock)
                        {
                            session.SendPacket((uint)CmdType.EvtBeingHitNotify, req);
                            return;
                        }
                    }
                    entity.FightPropUpdate(FightPropType.FIGHT_PROP_CUR_HP, curHp);
                }
                
                entity.SendUpdatedProps();
                if(curHp < 0 && isDamageable)
                {
                    entity.Die();
                }
            }

            session.SendPacket((uint)CmdType.EvtBeingHitNotify, req);

        }

        private static void CheckIsController(GameEntityGadget gadget, EvtBeingHitNotify req)
        {
            //Anemo
            if(gadget.id== 70900039 && req.AttackResult.ElementType == (int)ElementType.Wind)
            {
                gadget.ChangeState(GadgetState.GearStart);

            }
            //Electro
            if (gadget.id == 70900008 && req.AttackResult.ElementType == (int)ElementType.Electric)
            {
                gadget.ChangeState(GadgetState.GearStart);

            }
            //Cryo
            if (gadget.id == 70900009 && req.AttackResult.ElementType == (int)ElementType.Ice)
            {
                gadget.ChangeState(GadgetState.GearStart);

            }
            //Pyro
            if (gadget.id == 70900007 && req.AttackResult.ElementType == (int)ElementType.Fire)
            {
                gadget.ChangeState(GadgetState.GearStart);

            }
            


        }

        private static float GetDamage(Client session,AttackResult attackResult)
        {
            float dmg=0;
            Avatar avatar = session.avatars.Find(av=>av.entityId==attackResult.AttackerId);
            if(avatar != null )
            {
                //Player is damaging entity
                //Probably all of this isn't correct but for now...
                dmg = avatar.GetFightProp(FightPropType.FIGHT_PROP_CUR_ATTACK) * attackResult.DamagePercentage;
                if(avatar.GetFightProp(FightPropType.FIGHT_PROP_CRITICAL) >= attackResult.CriticalRand)
                {
                    dmg += dmg * avatar.GetFightProp(FightPropType.FIGHT_PROP_CRITICAL_HURT);
                }
                
            }

            attackResult.Damage = dmg;
            return dmg;
        }
    }
}
