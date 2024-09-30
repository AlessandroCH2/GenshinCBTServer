using GenshinCBTServer.Excel;
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
        public ProtEntityType EntityType = ProtEntityType.ProtEntityAvatar;
        public uint entityId;
      
        public uint guid;
        public uint id;
        public int level;
        public int exp;
        public int promoteLevel;
        public uint weaponGuid;
        public MapField<uint, float> fightprops = new MapField<uint, float>();
        public MapField<uint, PropValue> props = new MapField<uint, PropValue>();
        public float curHp;
        public uint weaponId { get { return GetExcel().weaponId; } }
        
        Client client;
        public Excel.AvatarData GetExcel()
        {
            return Server.getResources().GetAvatarDataById(id);
        }
        public GameItem getEquippedWeapon()
        {
            return client.inventory.Find(item => item.guid == weaponGuid);
        }
        public Avatar(Client client,uint id) {
            this.id = id;
            this.client = client;
            this.level = 1;
            entityId = ((uint)EntityType << 24) + (uint)client.random.Next();
            guid = (uint)client.random.Next();
            curHp = GetExcel().baseHp;
            GameItem weaponitem = new GameItem(client, weaponId);
            client.inventory.Add(weaponitem);
            weaponGuid = weaponitem.guid;
            UpdateProps();
           
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
                EntityId = entityId,
                MotionInfo = client.motionInfo,
                LifeState = curHp > 0 ? (uint)LifeState.LIFE_ALIVE : (uint)LifeState.LIFE_DEAD,
                RendererChangedInfo = new(),
                AbilityInfo = new() { IsInited = false}
            };
            info.Avatar = new()
            {
                Uid = client.uid,

                AvatarId = id,
                Guid = guid,
                PeerId = (uint)client.gamePeer,
                EquipIdList = { getEquippedWeapon().id },
                SkillDepotId = Server.getResources().GetAvatarDataById(id).skillDepotId,
                // TalentIdList = { 1000, 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015 },
                Weapon = getEquippedWeapon().weaponSceneInfo()



            };
            info.Avatar.TalentIdList.Add(getTalents());
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
                EquipGuidList = {weaponGuid},
                LifeState=curHp > 0 ? (uint)LifeState.LIFE_ALIVE :(uint) LifeState.LIFE_DEAD,
                SkillDepotId= Server.getResources().GetAvatarDataById(id).skillDepotId,
               
                
                
            };
            info.TalentIdList.Add(getTalents());
            // info.SkillMap.Add(10001, new AvatarSkillInfo() { });
            // info.SkillMap.Add(10002, new AvatarSkillInfo() { });
            // info.SkillMap.Add(10003, new AvatarSkillInfo() { });

            foreach (KeyValuePair<uint, PropValue> prop in props)
            {
                info.PropMap.Add(prop.Key,prop.Value);  

            }
            foreach (KeyValuePair<uint, float> prop in fightprops)
            {
                info.FightPropMap.Add(prop.Key, prop.Value);

            }
            return info;
        }

        private List<uint> getTalents()
        {
            List<uint> ids = new List<uint>();
            AvatarSkillDepotData skillDepotData = Server.getResources().avatarSkillDepotData.Find(d => d.id == GetExcel().skillDepotId);
            if(skillDepotData!= null)
            {
               // Server.Print($"Skill Depot trovato: (id: {skillDepotData.id} )" + skillDepotData.talent_groups.Count);
                foreach(int talent_group in skillDepotData.talent_groups)
                {
                    TalentSkillData talentSkill = Server.getResources().talentSkillData.Find(t=>t.talent_group_id==talent_group);
                    if(talentSkill!= null)
                    {
                      
                        ids.Add((uint)talentSkill.id);
                    }
                   
                }
            }

            return ids;
        }

        public void UpdateProps()
        {
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_HP, Server.getResources().GetAvatarDataById(id).baseHp); 
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_DEFENSE, Server.getResources().GetAvatarDataById(id).baseDef);
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_ATTACK, Server.getResources().GetAvatarDataById(id).baseAtk);
            FightPropUpdate(FightPropType.FIGHT_PROP_ATTACK, Server.getResources().GetAvatarDataById(id).baseAtk);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ATTACK, Server.getResources().GetAvatarDataById(id).baseAtk); //TODO calculate total attack
            FightPropUpdate(FightPropType.FIGHT_PROP_HP, curHp);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_HP, curHp);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_HP, Server.getResources().GetAvatarDataById(id).baseHp); //TODO calculate total hp
            FightPropUpdate(FightPropType.FIGHT_PROP_HP_PERCENT,0);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_DEFENSE, 123456.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_SPEED, 0.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_FIRE_ENERGY, 100.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ELEC_ENERGY, 100.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_WATER_ENERGY, 100.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_GRASS_ENERGY, 100.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_WIND_ENERGY, 100.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ICE_ENERGY, 100.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ROCK_ENERGY, 100.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_FIRE_ENERGY, 100.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_ELEC_ENERGY, 100.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_WATER_ENERGY, 100.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_GRASS_ENERGY, 100.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_WIND_ENERGY, 100.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_ICE_ENERGY, 100.0f );
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_ROCK_ENERGY, 100.0f );
            props[(uint)PropType.PROP_EXP] = new PropValue() { Ival = 1,Val = 1,Type= (uint)PropType.PROP_EXP };
            props[(uint)PropType.PROP_LEVEL] = new PropValue() { Ival=level,Val = (long)level, Type = (uint)PropType.PROP_LEVEL };
            props[(uint)PropType.PROP_BREAK_LEVEL] = new PropValue() { Ival=promoteLevel,Val = (long)promoteLevel, Type = (uint)PropType.PROP_BREAK_LEVEL };
        }
    }
}
