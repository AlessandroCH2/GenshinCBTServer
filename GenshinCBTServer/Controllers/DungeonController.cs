using GenshinCBTServer.Excel;
using GenshinCBTServer.Data;
using GenshinCBTServer.Protocol;

namespace GenshinCBTServer.Controllers
{
    public class DungeonController
    {
        [Server.Handler(CmdType.DungeonEntryInfoReq)]
        public static void OnDungeonEntryInfoReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            DungeonEntryInfoReq req = packet.DecodeBody<DungeonEntryInfoReq>();

            DungeonEntryInfoRsp rsp = new DungeonEntryInfoRsp()
            {
                PointId = req.PointId,
                Retcode = 0,
            };
            ScenePointRow scenePoint = Server.getResources().scenePointDict[session.currentSceneId];
            ScenePoint point = scenePoint.points[req.PointId];
            foreach (uint dungeonId in point.dungeonIds)
            {
                DungeonEntryInfo info = new DungeonEntryInfo()
                {
                    DungeonId = dungeonId,
                    IsPassed = true,
                    LeftTimes = 9999, // let people have some fun
                };
                rsp.RecommendDungeonId = dungeonId;
                rsp.DungeonEntryList.Add(info);
            }
            session.SendPacket((uint)CmdType.DungeonEntryInfoRsp, rsp);
        }

        /*
            WE STILL DONT WANT TO IMPLEMENT THIS, SINCE WE WILL NEED TO MAKE A TEMPORARY DUNGEON LINEUP AND SAVE PREVIOUS POS AND SCENE ID  
        */
        [Server.Handler(CmdType.PlayerEnterDungeonReq)]
        public static void OnPlayerEnterDungeonReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            PlayerEnterDungeonReq req = packet.DecodeBody<PlayerEnterDungeonReq>();
            PlayerEnterDungeonRsp rsp = new PlayerEnterDungeonRsp()
            {
                PointId = req.PointId,
                DungeonId = req.DungeonId,
                Retcode = 0,
            };
            session.returnPointId = req.PointId;
            DungeonData dungeonData = Server.getResources().dungeonDataDict[req.DungeonId];
            ResourceLoader resourceLoader = new(Server.getResources());
            SceneExcel scene = resourceLoader.LoadSceneLua(dungeonData.sceneId);

            session.TeleportToScene(scene.sceneId, scene.bornPos, scene.bornRot, EnterType.EnterDungeon);
            //session.currentSceneId = scene.sceneId;
            //session.motionInfo.Pos = scene.bornPos;
            //session.motionInfo.Rot = scene.bornRot;
            // session.SendPacket((uint)CmdType.PlayerEnterSceneNotify, new PlayerEnterSceneNotify() { SceneId = session.currentSceneId,PrevPos = new Vector(), Pos=session.motionInfo.Pos,PrevSceneId= 0, Type=EnterType.EnterDungeon,SceneBeginTime=0 });
            // session.SendPacket((uint)CmdType.ScenePlayerLocationNotify, new ScenePlayerLocationNotify() { PlayerLocList = { new PlayerLocationInfo() { Uid = session.uid, Pos = session.motionInfo.Pos, Rot = session.motionInfo.Rot } } });
            session.SendPacket((uint)CmdType.PlayerEnterDungeonRsp, rsp);
            //session.world.UpdateBlocks();
        }

        [Server.Handler(CmdType.PlayerQuitDungeonReq)]
        public static void OnPlayerQuitDungeonReq(Client session, CmdType cmdId, Network.Packet packet)
        {
            PlayerQuitDungeonReq req = packet.DecodeBody<PlayerQuitDungeonReq>();
            PlayerQuitDungeonRsp rsp = new PlayerQuitDungeonRsp()
            {
                PointId = req.PointId,
                Retcode = 0,
            };
            uint destSceneId = session.prevSceneId; // again, it's 5am and idk what i'm doing
            ScenePointRow scenePoint = Server.getResources().scenePointDict[destSceneId];
            ScenePoint point = req.PointId > 0 ? scenePoint.points[req.PointId] : scenePoint.points[session.returnPointId];
            session.TeleportToScene(destSceneId, point.pos, point.rot, EnterType.EnterJump);
            /*  session.currentSceneId = destSceneId;
              session.motionInfo.Pos = point.pos;
              session.motionInfo.Rot = point.rot;
              session.SendPacket((uint)CmdType.PlayerEnterSceneNotify, new PlayerEnterSceneNotify() { SceneId = session.currentSceneId,PrevPos = new Vector(), Pos=session.motionInfo.Pos,PrevSceneId= 0, Type=EnterType.EnterJump,SceneBeginTime=0 });
              // session.SendPacket((uint)CmdType.ScenePlayerLocationNotify, new ScenePlayerLocationNotify() { PlayerLocList = { new PlayerLocationInfo() { Uid = session.uid, Pos = session.motionInfo.Pos, Rot = session.motionInfo.Rot } } });*/
            session.SendPacket((uint)CmdType.PlayerQuitDungeonRsp, rsp);
            //session.world.UpdateBlocks(); //Not needed, new scene blocks get loaded in scene controller when scene initialize is almost finished
        }
    }
}
