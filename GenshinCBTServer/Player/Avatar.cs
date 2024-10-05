using GenshinCBTServer.Excel;
using GenshinCBTServer.Protocol;
using GenshinCBTServer.Data;
using Google.Protobuf.Collections;

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
        public AvatarData GetExcel()
        {
            return Server.getResources().GetAvatarDataById(id);
        }
        public LevelCurve GetCurveExcel()
        {
            return Server.getResources().avatarCurveDict[(uint)level];
        }
        public GameItem getEquippedWeapon()
        {
            return client.inventory.Find(item => item.guid == weaponGuid)!;
        }
        public Avatar(Client client,uint id) {
            this.id = id;
            this.client = client;
            this.level = 5; // currently 5 for testing
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
            AvatarSkillDepotData skillDepotData = Server.getResources().avatarSkillDepotData.Find(d => d.id == GetExcel().skillDepotId)!;
            if(skillDepotData!= null)
            {
               // Server.Print($"Skill Depot trovato: (id: {skillDepotData.id} )" + skillDepotData.talent_groups.Count);
                foreach(int talent_group in skillDepotData.talent_groups)
                {
                    TalentSkillData talentSkill = Server.getResources().talentSkillData.Find(t=>t.talent_group_id==talent_group)!;
                    if(talentSkill!= null)
                    {
                      
                        ids.Add((uint)talentSkill.id);
                    }
                   
                }
            }

            return ids;
        }
        public float GetFightProp(FightPropType propType)
        {
           return fightprops[(uint)propType];
        }
        public float calculateAttack()
        {
            float attack = GetFightProp(FightPropType.FIGHT_PROP_BASE_ATTACK);
            float perc = 1;
            float flatAtk = 0;
            if (getEquippedWeapon() != null)
            {
                GameItem weapon = getEquippedWeapon();

                perc += weapon.GetWeaponAttack().atkperc;
                flatAtk += weapon.GetWeaponAttack().attack;
            }
           /* if (Player.playerInstance.GetInventoryItem(RELIQ1) != null)
            {
                GameItem reliq = Player.playerInstance.GetInventoryItem(RELIQ1);
                ItemStats stats = reliq.GetReliquaryStats();
                perc += stats.atkperc;
                flatAtk += stats.attack;
            }
            if (Player.playerInstance.GetInventoryItem(RELIQ2) != null)
            {
                GameItem reliq = Player.playerInstance.GetInventoryItem(RELIQ2);
                ItemStats stats = reliq.GetReliquaryStats();
                perc += stats.atkperc;
                flatAtk += stats.attack;
            }
            if (Player.playerInstance.GetInventoryItem(RELIQ3) != null)
            {
                GameItem reliq = Player.playerInstance.GetInventoryItem(RELIQ3);
                ItemStats stats = reliq.GetReliquaryStats();
                perc += stats.atkperc;
                flatAtk += stats.attack;
            }
            if (Player.playerInstance.GetInventoryItem(RELIQ4) != null)
            {
                GameItem reliq = Player.playerInstance.GetInventoryItem(RELIQ4);
                ItemStats stats = reliq.GetReliquaryStats();
                perc += stats.atkperc;
                flatAtk += stats.attack;
            }
            if (Player.playerInstance.GetInventoryItem(RELIQ5) != null)
            {
                GameItem reliq = Player.playerInstance.GetInventoryItem(RELIQ5);
                ItemStats stats = reliq.GetReliquaryStats();
                perc += stats.atkperc;
                flatAtk += stats.attack;
            }*/
            //Need to add reliquary stats
            return (attack * perc) + flatAtk; //need to add reliquary attack
        }

        public float calculateDefence()
        {
            float defense = GetFightProp(FightPropType.FIGHT_PROP_BASE_DEFENSE);
            float perc = 1;
            float flatDef = 0;
            if (getEquippedWeapon() != null)
            {
                GameItem weapon = getEquippedWeapon();

                perc += weapon.GetWeaponAttack().defPerc;
                flatDef += weapon.GetWeaponAttack().defense;
            }
            return (defense * perc) + flatDef; //need to add reliquary defence
        }

        public float calculateCritDmg()
        {
            float critDmg = GetExcel().criticalHurt;
            float flatCrit = 0;
            if (getEquippedWeapon() != null)
            {
                GameItem weapon = getEquippedWeapon();
                flatCrit += weapon.GetWeaponAttack().critdmg;
            }
            return critDmg + flatCrit; //need to add reliquary critdmg
        }
        public float calculateCritRate()
        {
            float critRate = GetExcel().critical;
            float flatcritRate = 0;
            if (getEquippedWeapon() != null)
            {
                GameItem weapon = getEquippedWeapon();
                flatcritRate += weapon.GetWeaponAttack().critrate;
            }
            return critRate + flatcritRate; //need to add reliquary critdmg
        }

        public void SendUpdatedProps()
        {
            UpdateProps();
            client.SendPacket((uint)CmdType.AvatarFightPropUpdateNotify, new AvatarFightPropUpdateNotify()
            {
                AvatarGuid=guid,
                FightPropMap = {fightprops}
            });
            client.SendPacket((uint)CmdType.AvatarFightPropNotify, new AvatarFightPropNotify()
            {
                AvatarGuid = guid,
                FightPropMap = { fightprops }
            });
        }

        public float GetGrowCurveValue(float baseStat, GrowCurveType curveType)
        {
            LevelCurve curveExcel = GetCurveExcel();
            // todo: make work with different ArithTypes
            CurveInfo info = curveExcel.getCurveValue((int)curveType);
            switch (info.arith) {
                case ArithType.ARITH_ADD:
                    return baseStat += info.value;
                case ArithType.ARITH_MULTI:
                    return baseStat *= info.value;
                case ArithType.ARITH_SUB:
                    return baseStat -= info.value;
                case ArithType.ARITH_DIVIDE:
                    return baseStat /= info.value;
                default:
                    break;
            }
            return baseStat;
        }

        // todo: add elemental AddHurt and use curve to calculate base stats
        public void UpdateProps()
        {
            ItemStats weaponStats = getEquippedWeapon().GetWeaponAttack();
            GrowCurveType BaseHpCurveType = GetExcel().propGrowCurves.Find(curve => curve.type == FightPropType.FIGHT_PROP_BASE_HP)!.grow_curve;
            GrowCurveType baseAtkCurveType = GetExcel().propGrowCurves.Find(curve => curve.type == FightPropType.FIGHT_PROP_BASE_ATTACK)!.grow_curve;
            GrowCurveType baseDefCurveType = GetExcel().propGrowCurves.Find(curve => curve.type == FightPropType.FIGHT_PROP_BASE_DEFENSE)!.grow_curve;
            float baseHp = GetGrowCurveValue(GetExcel().baseHp, BaseHpCurveType) + weaponStats.hpFlat;
            float baseAtk = GetGrowCurveValue(GetExcel().baseAtk, baseAtkCurveType);
            float baseDef = GetGrowCurveValue(GetExcel().baseDef, baseDefCurveType);
            AvatarPromoteExcel promoteExcel = Server.getResources().avatarPromoteData.FirstOrDefault(p => p.promoteLevel == promoteLevel)!;
            foreach (PropValConfig prop in promoteExcel.addProps)
            {
                switch (prop.propType)
                {
                    case FightPropType.FIGHT_PROP_BASE_HP:
                        baseHp += prop.value;
                        break;
                    case FightPropType.FIGHT_PROP_BASE_ATTACK:
                        baseAtk += prop.value;
                        break;
                    case FightPropType.FIGHT_PROP_BASE_DEFENSE:
                        baseDef += prop.value;
                        break;
                    default:
                        break;
                }
            }
            curHp = baseHp;
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_HP, baseHp); 
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_DEFENSE, baseDef);
            FightPropUpdate(FightPropType.FIGHT_PROP_BASE_ATTACK, baseAtk + weaponStats.attack);
            FightPropUpdate(FightPropType.FIGHT_PROP_ATTACK, calculateAttack());
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_ATTACK, calculateAttack()); //TODO calculate total attack
            FightPropUpdate(FightPropType.FIGHT_PROP_HP, curHp);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_HP, curHp);
            FightPropUpdate(FightPropType.FIGHT_PROP_MAX_HP, curHp); //TODO calculate total hp
            FightPropUpdate(FightPropType.FIGHT_PROP_HP_PERCENT, weaponStats.hpPerc);
            FightPropUpdate(FightPropType.FIGHT_PROP_CUR_DEFENSE, calculateDefence());
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
            FightPropUpdate(FightPropType.FIGHT_PROP_CRITICAL_HURT, calculateCritDmg());
            FightPropUpdate(FightPropType.FIGHT_PROP_CRITICAL, calculateCritRate());
            props[(uint)PropType.PROP_EXP] = new PropValue() { Ival = 1,Val = 1,Type= (uint)PropType.PROP_EXP };
            props[(uint)PropType.PROP_LEVEL] = new PropValue() { Ival=level,Val = (long)level, Type = (uint)PropType.PROP_LEVEL };
            props[(uint)PropType.PROP_BREAK_LEVEL] = new PropValue() { Ival=promoteLevel,Val = (long)promoteLevel, Type = (uint)PropType.PROP_BREAK_LEVEL };
            Server.Print("Avatar total attack: " + GetFightProp(FightPropType.FIGHT_PROP_ATTACK));
        }
    }
}
