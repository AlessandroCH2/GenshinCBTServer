using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer.Player
{
    public class GameItem
    {
      
        public uint id;
        public uint guid;
        public uint entityId;
        public int amount;

        //Weapon
        public uint level;
        public uint xp;
        public uint promoteLevel;
        public Excel.ItemData GetExcel()
        {
            return Server.getResources().itemData.Find(item=>item.id==id);
        }
        public GameItem(Client client,uint id)
        {
            this.id = id;
            this.amount = 1;
            guid = (uint)client.random.Next();
            if (GetExcel().type==ItemType.ITEM_WEAPON)
            {
                entityId = ((uint)ProtEntityType.ProtEntityWeapon << 24) + (uint)client.random.Next();
                level = 1;
                xp = 0;
                promoteLevel = 0;
            }
           
          
           


        }
        public SceneWeaponInfo weaponSceneInfo()
        {
            return new SceneWeaponInfo
            {
                EntityId = entityId,
                GadgetId = 50000000 + id,
                ItemId = id,
                Guid = guid,
                Level = level,
                PromoteLevel = promoteLevel,
                AbilityInfo = new() { IsInited = true }
            };
        }
        public Item toProtoItem()
        {
            GameItem gameItem = this;
            ItemType itemType = GetExcel().type;
            if (itemType == ItemType.ITEM_VIRTUAL)
            {
                return new Item()
                {

                    Material = new Material()
                    {
                        Count = (uint)gameItem.amount,

                    },

                    Guid = gameItem.guid,
                    ItemId = gameItem.id

                };
            }
            else if (itemType == ItemType.ITEM_MATERIAL)
            {
                return new Item()
                {
                    Material = new Material()
                    {
                        Count = (uint)gameItem.amount
                    },
                    Guid = gameItem.guid,
                    ItemId = gameItem.id

                };
            }
            else if (itemType == ItemType.ITEM_WEAPON)
            {
                return new Item()
                {
                    Equip = new Equip()
                    {
                        Weapon = new Weapon()
                        {
                            Exp = gameItem.xp,
                            Level = gameItem.level,
                            PromoteLevel = gameItem.promoteLevel,

                        },
                      
                    },
                    Guid = gameItem.guid,
                    ItemId = gameItem.id

                };
            }
           
            return null;
        }
    }
}
