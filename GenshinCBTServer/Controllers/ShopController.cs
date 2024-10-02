using GenshinCBTServer.Network;
using GenshinCBTServer.Player;
using GenshinCBTServer.Protocol;
using System;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GenshinCBTServer.Controllers
{
    public class ShopController
    {
       
        [Server.Handler(CmdType.GetShopReq)]
        public static void OnGetShopReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            GetShopReq req = packet.DecodeBody<GetShopReq>();
            Shop shop = new Shop() { ShopType = req.ShopType };
            foreach (ShopGoodsData gooddata in Server.getResources().shopGoodsDict.Values) {
                ShopGoods good = new ShopGoods()
                {
                    GoodsId = gooddata.goodsId,
                    GoodsItem = new ItemParam()
                    {
                        ItemId = gooddata.itemId,
                        Count = gooddata.itemCount,
                    },
                    Scoin = gooddata.costScoin == 0 ? gooddata.costHcoin : gooddata.costScoin,
                    Hcoin = gooddata.costHcoin == 0 ? gooddata.costScoin : gooddata.costHcoin,
                    BoughtNum = 0,
                    BuyLimit = 9999,
                    BeginTime = 1,
                    EndTime = 1999999999,
                    NextRefreshTime = 1999999999,
                };
                foreach (CostItems param in gooddata.costItems)
                {
                    good.CostItemList.Add(new ItemParam()
                    {
                        ItemId = param.id,
                        Count = param.count,
                    });
                };
                shop.GoodsList.Add(good);
            }
            GetShopRsp rsp = new GetShopRsp()
            {
                Shop = shop,
                Retcode = 0,
            };
            session.SendPacket((uint)CmdType.GetShopRsp, rsp);
        }

        [Server.Handler(CmdType.BuyGoodsReq)]
        public static void OnBuyGoodsReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            BuyGoodsReq req = packet.DecodeBody<BuyGoodsReq>();
            // TODO: Implement paying for goods and adding them to the player's inventory
            BuyGoodsRsp rsp = new BuyGoodsRsp()
            {
                ShopType = req.ShopType,
                BuyCount = req.BuyCount,
                Goods = req.Goods,
                Retcode = 0,
            };
            session.SendPacket((uint)CmdType.BuyGoodsRsp, rsp);
        }
    }
}
