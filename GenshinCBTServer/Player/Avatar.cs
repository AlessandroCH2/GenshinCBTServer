using GenshinCBTServer.Protocol;
using Google.Protobuf.Collections;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer.Player
{
    public class Avatar
    {
        public uint guid;
        public uint id;
        public int level;
        public int exp;
        public int promoteLevel;
        public uint weaponGuid;
        public MapField<uint, float> fightprops = new MapField<uint, float>();
        public MapField<uint, PropValue> props = new MapField<uint, PropValue>();
        public float curHp;
        public uint weaponId { get { return 0; } }
        public MotionInfo motionInfo;
        Client client;
        public Avatar(Client client,uint id) {
            this.id = id;
            this.client = client;
            guid = (uint)client.random.Next();
            curHp = Server.getResources().GetAvatarDataById(id).baseHp;
            motionInfo = new() { Pos = new(), Rot = new(), Speed = new() };
        }
        public void FightPropUpdate(FightPropType key,float value)
        {
            fightprops[(uint)key] = value;
        }
        public SceneEntityInfo asInfo()
        {
            SceneEntityInfo info = new SceneEntityInfo()
            {
                EntityType = ProtEntityType.ProtEntityAvatar,
                EntityId = guid,
                MotionInfo = motionInfo,
                LifeState = 1,
                RendererChangedInfo = new(),

            };
            info.Avatar = new()
            {
                Uid = client.uid,
                AvatarId = id,
                Guid = guid,
                PeerId = (uint)client.peer,
                EquipIdList = { 0 },
                SkillDepotId = Server.getResources().GetAvatarDataById(id).skillDepotId,

                Weapon = new SceneWeaponInfo
                {
                    EntityId = weaponGuid + weaponId,
                    GadgetId = 50000000 + weaponId,
                    ItemId = weaponId,
                    Guid = weaponGuid,
                    Level = 1,
                    PromoteLevel = 0,
                    AbilityInfo = new()
                },
                
            };
            foreach (KeyValuePair<uint, PropValue> prop in props)
            {
                info.PropMap.Add(prop.Key, prop.Value);

            }
            foreach (KeyValuePair<uint, float> prop in fightprops)
            {
                info.FightPropMap.Add(prop.Key, prop.Value);

            }
            return info;
        }
        public AvatarInfo toProto()
        {
            AvatarInfo info = new AvatarInfo()
            {
                Guid = guid,
                AvatarId = id,
                EquipGuidList = {0,0,0,0,0,0},
                LifeState=curHp > 0 ? (uint)LifeState.LIFE_ALIVE :(uint) LifeState.LIFE_DEAD,
                SkillDepotId= Server.getResources().GetAvatarDataById(id).skillDepotId,
                
            };
            foreach(KeyValuePair<uint, PropValue> prop in props)
            {
                info.PropMap.Add(prop.Key,prop.Value);  

            }
            foreach (KeyValuePair<uint, float> prop in fightprops)
            {
                info.FightPropMap.Add(prop.Key, prop.Value);

            }
            return info;
        }
        public void UpdateProps()
        {
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_HP, Server.getResources().GetAvatarDataById(id).baseHp); 
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_DEFENSE, Server.getResources().GetAvatarDataById(id).baseDef);
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_ATTACK, Server.getResources().GetAvatarDataById(id).baseAtk);
            FightPropUpdate(FightPropType.FIGHT_PROP_ATTACK, Server.getResources().GetAvatarDataById(id).baseAtk); //TODO calculate total attack
            FightPropUpdate(FightPropType.FIGHT_PROP_HP, curHp); 
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_HP, Server.getResources().GetAvatarDataById(id).baseHp); //TODO calculate total hp

            props[(uint)PropType.PROP_LEVEL] = new PropValue() { Val = (long)level };
            props[(uint)PropType.PROP_BREAK_LEVEL] = new PropValue() { Val = (long)promoteLevel };
        }
    }
}
