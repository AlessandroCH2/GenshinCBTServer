--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 111, monster_id = 21010101, pos = { x = 1452.5, y = 264.6, z = -421.8 }, rot = { x = 0.0, y = 198.3, z = 0.0 }, level = 8 },
	{ config_id = 113, monster_id = 22010101, pos = { x = 1601.4, y = 274.1, z = -671.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 114, monster_id = 21010701, pos = { x = 1603.3, y = 274.4, z = -670.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 115, monster_id = 21010701, pos = { x = 1603.6, y = 274.4, z = -669.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 11, gadget_id = 70310003, pos = { x = 1547.8, y = 245.3, z = -614.0 }, rot = { x = 0.0, y = 265.4, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 13, gadget_id = 70310003, pos = { x = 1541.1, y = 257.7, z = -681.1 }, rot = { x = 0.0, y = 23.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 16, gadget_id = 70310003, pos = { x = 1601.8, y = 272.3, z = -642.6 }, rot = { x = 1.6, y = 87.2, z = 357.7 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 20, gadget_id = 70310003, pos = { x = 1629.3, y = 280.1, z = -717.4 }, rot = { x = 0.0, y = 162.4, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 22, gadget_id = 70310003, pos = { x = 1600.2, y = 287.1, z = -747.2 }, rot = { x = 0.0, y = 48.1, z = 0.0 }, level = 1 },
	{ config_id = 23, gadget_id = 70310003, pos = { x = 1587.8, y = 290.3, z = -826.5 }, rot = { x = 0.0, y = 3.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 25, gadget_id = 70310003, pos = { x = 1502.0, y = 274.3, z = -730.6 }, rot = { x = 0.0, y = 49.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 26, gadget_id = 70310003, pos = { x = 1618.7, y = 289.4, z = -869.6 }, rot = { x = 0.0, y = 58.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 30, gadget_id = 70310003, pos = { x = 1472.3, y = 290.9, z = -853.6 }, rot = { x = 0.0, y = 221.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 31, gadget_id = 70310003, pos = { x = 1485.2, y = 289.8, z = -768.4 }, rot = { x = 0.0, y = 27.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 33, gadget_id = 70310003, pos = { x = 1496.4, y = 288.5, z = -818.4 }, rot = { x = 0.0, y = 212.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 34, gadget_id = 70310003, pos = { x = 1472.8, y = 292.7, z = -825.2 }, rot = { x = 0.0, y = 19.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 35, gadget_id = 70310003, pos = { x = 1483.6, y = 289.3, z = -842.3 }, rot = { x = 0.0, y = 317.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 36, gadget_id = 70310003, pos = { x = 1491.1, y = 288.7, z = -860.6 }, rot = { x = 0.0, y = 304.2, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 37, gadget_id = 70310003, pos = { x = 1488.5, y = 288.7, z = -880.5 }, rot = { x = 0.0, y = 310.1, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 40, gadget_id = 70310003, pos = { x = 1627.5, y = 276.5, z = -670.2 }, rot = { x = 0.0, y = 129.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 53, gadget_id = 70310003, pos = { x = 1655.6, y = 286.8, z = -970.2 }, rot = { x = 0.0, y = 349.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 54, gadget_id = 70310003, pos = { x = 1350.9, y = 300.8, z = -919.9 }, rot = { x = 0.0, y = 258.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 55, gadget_id = 70310003, pos = { x = 1377.9, y = 297.8, z = -889.1 }, rot = { x = 0.0, y = 251.1, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 56, gadget_id = 70310003, pos = { x = 1416.0, y = 299.5, z = -871.0 }, rot = { x = 0.0, y = 171.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 57, gadget_id = 70310003, pos = { x = 1395.8, y = 303.6, z = -826.7 }, rot = { x = 0.0, y = 297.3, z = 0.0 }, level = 1 },
	{ config_id = 59, gadget_id = 70310003, pos = { x = 1429.9, y = 287.7, z = -692.9 }, rot = { x = 0.0, y = 76.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 60, gadget_id = 70310003, pos = { x = 1450.9, y = 286.0, z = -660.9 }, rot = { x = 0.0, y = 189.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 62, gadget_id = 70310003, pos = { x = 1424.8, y = 262.0, z = -565.2 }, rot = { x = 0.0, y = 246.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 63, gadget_id = 70310003, pos = { x = 1425.4, y = 261.5, z = -514.6 }, rot = { x = 0.0, y = 319.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 64, gadget_id = 70310003, pos = { x = 1457.6, y = 259.1, z = -584.4 }, rot = { x = 0.0, y = 156.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 65, gadget_id = 70310003, pos = { x = 1398.8, y = 277.7, z = -524.4 }, rot = { x = 0.0, y = 328.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 66, gadget_id = 70310003, pos = { x = 1394.6, y = 268.0, z = -476.3 }, rot = { x = 0.0, y = 305.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 67, gadget_id = 70310003, pos = { x = 1460.6, y = 258.5, z = -432.4 }, rot = { x = 0.0, y = 151.3, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 68, gadget_id = 70310003, pos = { x = 1405.6, y = 254.1, z = -409.4 }, rot = { x = 0.0, y = 102.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 69, gadget_id = 70310003, pos = { x = 1422.2, y = 245.4, z = -344.4 }, rot = { x = 0.0, y = 206.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 70, gadget_id = 70310003, pos = { x = 1450.7, y = 247.7, z = -375.1 }, rot = { x = 0.0, y = 209.4, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 71, gadget_id = 70310003, pos = { x = 1340.6, y = 231.6, z = -345.5 }, rot = { x = 0.0, y = 237.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 72, gadget_id = 70310003, pos = { x = 1389.4, y = 237.8, z = -359.7 }, rot = { x = 0.0, y = 149.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 73, gadget_id = 70310003, pos = { x = 1310.8, y = 230.5, z = -307.7 }, rot = { x = 0.0, y = 11.3, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 74, gadget_id = 70310003, pos = { x = 1231.4, y = 234.3, z = -296.7 }, rot = { x = 0.0, y = 322.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 75, gadget_id = 70310003, pos = { x = 1346.6, y = 345.3, z = -730.4 }, rot = { x = 0.0, y = 132.4, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 76, gadget_id = 70310003, pos = { x = 1362.5, y = 323.0, z = -767.2 }, rot = { x = 0.0, y = 52.1, z = 0.0 }, level = 1 },
	{ config_id = 77, gadget_id = 70310003, pos = { x = 1335.2, y = 326.4, z = -853.9 }, rot = { x = 0.0, y = 158.4, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 78, gadget_id = 70310003, pos = { x = 1335.0, y = 315.2, z = -872.6 }, rot = { x = 0.0, y = 17.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 79, gadget_id = 70310003, pos = { x = 1297.6, y = 360.2, z = -862.4 }, rot = { x = 0.0, y = 270.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 80, gadget_id = 70310003, pos = { x = 1290.9, y = 385.1, z = -815.7 }, rot = { x = 0.0, y = 321.3, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 81, gadget_id = 70310003, pos = { x = 1280.3, y = 434.3, z = -748.6 }, rot = { x = 0.0, y = 257.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 82, gadget_id = 70310003, pos = { x = 1278.6, y = 419.7, z = -705.9 }, rot = { x = 0.0, y = 67.1, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 83, gadget_id = 70310003, pos = { x = 1306.3, y = 384.3, z = -649.7 }, rot = { x = 0.0, y = 107.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 84, gadget_id = 70310003, pos = { x = 1352.7, y = 356.6, z = -556.5 }, rot = { x = 0.0, y = 127.8, z = 0.0 }, level = 1 },
	{ config_id = 85, gadget_id = 70310003, pos = { x = 1296.9, y = 360.5, z = -595.4 }, rot = { x = 0.0, y = 300.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 86, gadget_id = 70310003, pos = { x = 1252.0, y = 472.5, z = -779.9 }, rot = { x = 0.0, y = 46.3, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 87, gadget_id = 70310003, pos = { x = 1187.9, y = 394.7, z = -868.2 }, rot = { x = 0.0, y = 120.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 88, gadget_id = 70310003, pos = { x = 1158.7, y = 402.2, z = -840.2 }, rot = { x = 0.0, y = 4.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 89, gadget_id = 70310003, pos = { x = 1158.4, y = 401.4, z = -873.2 }, rot = { x = 0.0, y = 134.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 90, gadget_id = 70310003, pos = { x = 1204.8, y = 315.1, z = -940.1 }, rot = { x = 0.0, y = 240.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 91, gadget_id = 70310003, pos = { x = 1264.1, y = 374.0, z = -873.0 }, rot = { x = 0.0, y = 323.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 92, gadget_id = 70310003, pos = { x = 1153.4, y = 328.0, z = -967.0 }, rot = { x = 0.0, y = 265.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 93, gadget_id = 70310003, pos = { x = 1163.5, y = 324.4, z = -1012.1 }, rot = { x = 0.0, y = 80.4, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 94, gadget_id = 70310003, pos = { x = 1114.2, y = 323.8, z = -1014.8 }, rot = { x = 0.0, y = 185.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 95, gadget_id = 70310003, pos = { x = 1087.1, y = 319.5, z = -1043.0 }, rot = { x = 0.0, y = 1.3, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 96, gadget_id = 70310003, pos = { x = 1035.1, y = 320.0, z = -1017.3 }, rot = { x = 0.0, y = 272.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 97, gadget_id = 70310003, pos = { x = 1069.6, y = 329.1, z = -976.8 }, rot = { x = 0.0, y = 229.1, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 98, gadget_id = 70310003, pos = { x = 1035.3, y = 284.1, z = -1016.1 }, rot = { x = 0.0, y = 113.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 99, gadget_id = 70310003, pos = { x = 1121.5, y = 287.8, z = -1040.7 }, rot = { x = 0.0, y = 95.3, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 100, gadget_id = 70310003, pos = { x = 1081.1, y = 281.0, z = -1042.1 }, rot = { x = 0.0, y = 323.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 101, gadget_id = 70310003, pos = { x = 1145.9, y = 408.5, z = -904.3 }, rot = { x = 0.0, y = 287.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 102, gadget_id = 70310003, pos = { x = 1097.9, y = 377.3, z = -930.2 }, rot = { x = 0.0, y = 132.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 103, gadget_id = 70310003, pos = { x = 1123.3, y = 329.6, z = -787.7 }, rot = { x = 0.0, y = 236.5, z = 0.0 }, level = 1 },
	{ config_id = 104, gadget_id = 70310003, pos = { x = 1117.6, y = 371.5, z = -855.2 }, rot = { x = 0.0, y = 55.2, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 105, gadget_id = 70310003, pos = { x = 1196.2, y = 314.8, z = -674.1 }, rot = { x = 0.0, y = 139.9, z = 0.0 }, level = 1 },
	{ config_id = 109, gadget_id = 70310003, pos = { x = 1356.0, y = 259.4, z = -443.2 }, rot = { x = 0.0, y = 272.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 110, gadget_id = 70310003, pos = { x = 1220.3, y = 267.1, z = -340.2 }, rot = { x = 0.0, y = 130.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 111, gadget_id = 70310003, pos = { x = 1260.2, y = 293.4, z = -354.1 }, rot = { x = 0.0, y = 196.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 112, gadget_id = 70310003, pos = { x = 1285.4, y = 299.0, z = -397.7 }, rot = { x = 0.0, y = 188.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 113, gadget_id = 70310003, pos = { x = 1237.8, y = 311.1, z = -404.4 }, rot = { x = 0.0, y = 318.4, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 115, gadget_id = 70310003, pos = { x = 1213.9, y = 325.4, z = -449.4 }, rot = { x = 0.0, y = 329.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 116, gadget_id = 70310003, pos = { x = 1179.5, y = 317.0, z = -415.2 }, rot = { x = 0.0, y = 303.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 118, gadget_id = 70310003, pos = { x = 1113.9, y = 332.0, z = -469.7 }, rot = { x = 0.0, y = 142.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 120, gadget_id = 70310003, pos = { x = 1142.9, y = 368.1, z = -506.3 }, rot = { x = 0.0, y = 219.4, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 122, gadget_id = 70310003, pos = { x = 1061.1, y = 331.1, z = -526.7 }, rot = { x = 0.0, y = 111.7, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 123, gadget_id = 70310003, pos = { x = 1082.6, y = 358.7, z = -549.9 }, rot = { x = 0.0, y = 17.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 124, gadget_id = 70310003, pos = { x = 1096.8, y = 363.7, z = -574.9 }, rot = { x = 0.0, y = 333.2, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 125, gadget_id = 70310003, pos = { x = 1067.6, y = 353.3, z = -619.7 }, rot = { x = 0.0, y = 339.6, z = 0.0 }, level = 1 },
	{ config_id = 126, gadget_id = 70310003, pos = { x = 1066.1, y = 343.7, z = -655.7 }, rot = { x = 0.0, y = 215.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 127, gadget_id = 70310003, pos = { x = 1070.4, y = 315.2, z = -698.8 }, rot = { x = 0.0, y = 223.8, z = 0.0 }, level = 1 },
	{ config_id = 128, gadget_id = 70310003, pos = { x = 1525.5, y = 269.9, z = -704.6 }, rot = { x = 0.0, y = 329.3, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 129, gadget_id = 70310003, pos = { x = 1515.6, y = 261.3, z = -660.6 }, rot = { x = 0.0, y = 197.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 130, gadget_id = 70310003, pos = { x = 1527.0, y = 262.7, z = -622.1 }, rot = { x = 0.0, y = 133.4, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 131, gadget_id = 70310003, pos = { x = 1493.3, y = 258.1, z = -599.3 }, rot = { x = 0.0, y = 274.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 132, gadget_id = 70310003, pos = { x = 1491.8, y = 260.7, z = -536.6 }, rot = { x = 0.0, y = 180.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 133, gadget_id = 70310003, pos = { x = 1334.1, y = 268.9, z = -455.0 }, rot = { x = 0.0, y = 153.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 135, gadget_id = 70310003, pos = { x = 1272.7, y = 232.5, z = -298.7 }, rot = { x = 0.0, y = 322.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 136, gadget_id = 70310003, pos = { x = 1214.5, y = 245.9, z = -314.5 }, rot = { x = 0.0, y = 223.8, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 139, gadget_id = 70310003, pos = { x = 1280.7, y = 288.1, z = -521.3 }, rot = { x = 0.0, y = 95.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 140, gadget_id = 70310003, pos = { x = 1270.7, y = 290.2, z = -511.7 }, rot = { x = 0.0, y = 95.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 144, gadget_id = 70310003, pos = { x = 1245.3, y = 390.2, z = -693.7 }, rot = { x = 0.0, y = 185.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 145, gadget_id = 70310003, pos = { x = 1249.1, y = 392.8, z = -679.7 }, rot = { x = 0.0, y = 185.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 169, gadget_id = 70310003, pos = { x = 1576.3, y = 274.1, z = -710.0 }, rot = { x = 0.0, y = 95.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 179, gadget_id = 70310003, pos = { x = 1499.0, y = 286.3, z = -882.5 }, rot = { x = 0.0, y = 310.1, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 198, gadget_id = 70310003, pos = { x = 1654.7, y = 286.7, z = -960.0 }, rot = { x = 0.0, y = 349.5, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 202, gadget_id = 70510008, pos = { x = 1559.7, y = 255.5, z = -628.5 }, rot = { x = 0.0, y = 109.1, z = 0.0 }, level = 1 },
	{ config_id = 203, gadget_id = 70510008, pos = { x = 1558.9, y = 256.4, z = -664.8 }, rot = { x = 0.0, y = 109.1, z = 0.0 }, level = 1 },
	{ config_id = 206, gadget_id = 70310003, pos = { x = 1546.4, y = 263.6, z = -704.4 }, rot = { x = 0.0, y = 23.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 213, gadget_id = 70310003, pos = { x = 1643.1, y = 279.1, z = -696.0 }, rot = { x = 0.0, y = 162.4, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 233, gadget_id = 70310003, pos = { x = 1607.2, y = 272.5, z = -645.3 }, rot = { x = 1.6, y = 87.2, z = 357.7 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 247, gadget_id = 70310003, pos = { x = 1517.3, y = 289.2, z = -1009.7 }, rot = { x = 0.0, y = 185.5, z = 13.6 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 261, gadget_id = 70310003, pos = { x = 1319.5, y = 344.0, z = -844.9 }, rot = { x = 0.0, y = 17.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 263, gadget_id = 70210031, pos = { x = 1350.9, y = 300.8, z = -917.7 }, rot = { x = 0.0, y = 79.5, z = 0.0 }, level = 1, chest_drop_id = 201000, type = GadgetType.GADGET_DUNGEON_SECRET_CHEST },
	{ config_id = 264, gadget_id = 70310003, pos = { x = 1350.2, y = 287.7, z = -972.0 }, rot = { x = 0.0, y = 258.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 265, gadget_id = 70310003, pos = { x = 1323.8, y = 316.4, z = -939.4 }, rot = { x = 0.0, y = 258.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 266, gadget_id = 70310003, pos = { x = 1256.5, y = 288.2, z = -987.6 }, rot = { x = 0.0, y = 258.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 267, gadget_id = 70310003, pos = { x = 1230.0, y = 324.9, z = -937.3 }, rot = { x = 0.0, y = 258.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 268, gadget_id = 70310003, pos = { x = 1223.3, y = 336.7, z = -908.3 }, rot = { x = 0.0, y = 258.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 269, gadget_id = 70310003, pos = { x = 1180.3, y = 291.3, z = -990.6 }, rot = { x = 0.0, y = 258.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 270, gadget_id = 70310003, pos = { x = 1164.5, y = 315.6, z = -964.8 }, rot = { x = 0.0, y = 258.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 271, gadget_id = 70310003, pos = { x = 1371.7, y = 318.5, z = -813.9 }, rot = { x = 0.0, y = 132.0, z = 0.0 }, level = 1 },
	{ config_id = 272, gadget_id = 70310003, pos = { x = 1324.0, y = 355.0, z = -764.3 }, rot = { x = 0.0, y = 132.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 273, gadget_id = 70310003, pos = { x = 1306.6, y = 381.3, z = -811.7 }, rot = { x = 0.0, y = 132.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 274, gadget_id = 70310003, pos = { x = 1255.1, y = 405.2, z = -851.3 }, rot = { x = 0.0, y = 132.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 275, gadget_id = 70310003, pos = { x = 1251.0, y = 440.3, z = -822.6 }, rot = { x = 0.0, y = 132.0, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 299, gadget_id = 70220005, pos = { x = 1233.4, y = 297.2, z = -534.1 }, rot = { x = 0.0, y = 63.0, z = 0.0 }, level = 1 },
	{ config_id = 300, gadget_id = 70310003, pos = { x = 1139.3, y = 297.0, z = -718.2 }, rot = { x = 0.0, y = 132.0, z = 0.0 }, level = 1 },
	{ config_id = 308, gadget_id = 70900019, pos = { x = 1256.4, y = 293.2, z = -361.4 }, rot = { x = 0.0, y = 122.1, z = 0.0 }, level = 1 },
	{ config_id = 309, gadget_id = 70900019, pos = { x = 1339.0, y = 264.9, z = -385.3 }, rot = { x = 0.0, y = 107.2, z = 0.0 }, level = 1 },
	{ config_id = 312, gadget_id = 70900019, pos = { x = 1322.1, y = 294.6, z = -508.1 }, rot = { x = 0.0, y = 351.0, z = 0.0 }, level = 1 },
	{ config_id = 313, gadget_id = 70900019, pos = { x = 1310.7, y = 360.2, z = -592.2 }, rot = { x = 0.0, y = 176.3, z = 0.0 }, level = 1 },
	{ config_id = 314, gadget_id = 70900019, pos = { x = 1193.1, y = 283.8, z = -367.0 }, rot = { x = 0.0, y = 100.4, z = 0.0 }, level = 1 },
	{ config_id = 315, gadget_id = 70900019, pos = { x = 1150.7, y = 325.5, z = -432.4 }, rot = { x = 0.0, y = 209.0, z = 0.0 }, level = 1 },
	{ config_id = 318, gadget_id = 70900016, pos = { x = 1452.6, y = 255.6, z = -421.1 }, rot = { x = 0.0, y = 299.4, z = 0.0 }, level = 1 },
	{ config_id = 319, gadget_id = 70900016, pos = { x = 1310.8, y = 230.2, z = -310.1 }, rot = { x = 0.0, y = 5.4, z = 0.0 }, level = 1 },
	{ config_id = 320, gadget_id = 70900016, pos = { x = 1482.0, y = 258.0, z = -558.1 }, rot = { x = 0.0, y = 251.8, z = 0.0 }, level = 1 },
	{ config_id = 321, gadget_id = 70900016, pos = { x = 1395.7, y = 301.7, z = -782.8 }, rot = { x = 4.9, y = 13.9, z = 0.0 }, level = 1 },
	{ config_id = 322, gadget_id = 70900016, pos = { x = 1354.7, y = 334.8, z = -707.3 }, rot = { x = 0.0, y = 236.5, z = 0.0 }, level = 1 },
	{ config_id = 325, gadget_id = 70900015, pos = { x = 1352.4, y = 299.8, z = -896.4 }, rot = { x = 0.0, y = 151.7, z = 0.0 }, level = 1 },
	{ config_id = 328, gadget_id = 70900015, pos = { x = 1178.6, y = 393.1, z = -870.0 }, rot = { x = 0.0, y = 285.5, z = 0.0 }, level = 1 },
	{ config_id = 330, gadget_id = 70900015, pos = { x = 1135.1, y = 396.2, z = -897.4 }, rot = { x = 0.0, y = 71.2, z = 0.0 }, level = 1 },
	{ config_id = 331, gadget_id = 70900015, pos = { x = 1068.0, y = 344.7, z = -594.8 }, rot = { x = 0.0, y = 143.3, z = 0.0 }, level = 1 },
	{ config_id = 332, gadget_id = 70900015, pos = { x = 1129.5, y = 369.9, z = -516.5 }, rot = { x = 0.0, y = 85.2, z = 0.0 }, level = 1 },
	{ config_id = 333, gadget_id = 70520013, pos = { x = 1553.2, y = 254.7, z = -643.4 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 334, gadget_id = 70520013, pos = { x = 1542.8, y = 256.5, z = -680.2 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 335, gadget_id = 70520013, pos = { x = 1605.5, y = 276.2, z = -693.7 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 336, gadget_id = 70520013, pos = { x = 1605.6, y = 275.7, z = -692.4 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 337, gadget_id = 70520013, pos = { x = 1628.8, y = 279.9, z = -709.6 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 338, gadget_id = 70520013, pos = { x = 1616.9, y = 287.9, z = -738.7 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 339, gadget_id = 70520013, pos = { x = 1627.5, y = 283.1, z = -711.0 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 340, gadget_id = 70520013, pos = { x = 1593.2, y = 288.1, z = -807.3 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 341, gadget_id = 70520013, pos = { x = 1584.4, y = 289.4, z = -842.1 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 342, gadget_id = 70520013, pos = { x = 1574.4, y = 284.8, z = -890.0 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 343, gadget_id = 70520013, pos = { x = 1561.1, y = 285.0, z = -885.1 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 344, gadget_id = 70520013, pos = { x = 1592.0, y = 290.3, z = -999.0 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 345, gadget_id = 70520013, pos = { x = 1564.7, y = 288.3, z = -1002.2 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 346, gadget_id = 70520013, pos = { x = 1349.8, y = 300.1, z = -896.9 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 347, gadget_id = 70520013, pos = { x = 1396.6, y = 299.8, z = -866.6 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 348, gadget_id = 70520013, pos = { x = 1421.0, y = 304.3, z = -775.8 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 349, gadget_id = 70520013, pos = { x = 1348.7, y = 328.8, z = -845.6 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 350, gadget_id = 70520013, pos = { x = 1315.6, y = 353.8, z = -878.2 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 351, gadget_id = 70520013, pos = { x = 1332.9, y = 349.5, z = -792.7 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 352, gadget_id = 70520013, pos = { x = 1339.1, y = 347.9, z = -765.3 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 353, gadget_id = 70520013, pos = { x = 1370.7, y = 318.5, z = -799.4 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 354, gadget_id = 70520013, pos = { x = 1363.6, y = 341.8, z = -724.1 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 355, gadget_id = 70520013, pos = { x = 1394.7, y = 305.7, z = -706.6 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 356, gadget_id = 70520013, pos = { x = 1351.9, y = 335.0, z = -672.9 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 357, gadget_id = 70520013, pos = { x = 1402.3, y = 298.4, z = -648.4 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 358, gadget_id = 70520013, pos = { x = 1352.6, y = 350.9, z = -580.6 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 359, gadget_id = 70520013, pos = { x = 1328.8, y = 301.8, z = -518.6 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 360, gadget_id = 70520013, pos = { x = 1208.6, y = 301.1, z = -568.4 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 361, gadget_id = 70520013, pos = { x = 1322.2, y = 274.5, z = -466.1 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 362, gadget_id = 70520013, pos = { x = 1290.5, y = 291.2, z = -383.8 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 363, gadget_id = 70520013, pos = { x = 1254.8, y = 321.1, z = -435.8 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 364, gadget_id = 70520013, pos = { x = 1247.1, y = 291.0, z = -361.2 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 365, gadget_id = 70520013, pos = { x = 1157.6, y = 326.8, z = -439.9 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 366, gadget_id = 70520013, pos = { x = 1115.8, y = 347.5, z = -497.0 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 367, gadget_id = 70520013, pos = { x = 1066.8, y = 346.3, z = -586.4 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 368, gadget_id = 70520013, pos = { x = 1057.5, y = 316.8, z = -696.7 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 369, gadget_id = 70520013, pos = { x = 1124.8, y = 308.9, z = -725.4 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 370, gadget_id = 70520013, pos = { x = 1108.2, y = 304.7, z = -722.7 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 371, gadget_id = 70520013, pos = { x = 1094.4, y = 313.0, z = -814.0 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 372, gadget_id = 70520013, pos = { x = 1059.1, y = 343.6, z = -891.3 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 373, gadget_id = 70520013, pos = { x = 1070.6, y = 349.5, z = -917.9 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 374, gadget_id = 70520013, pos = { x = 1056.9, y = 333.0, z = -955.6 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 375, gadget_id = 70520013, pos = { x = 1178.4, y = 352.3, z = -910.9 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 376, gadget_id = 70520013, pos = { x = 1236.6, y = 323.5, z = -940.1 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 377, gadget_id = 70520013, pos = { x = 1452.7, y = 268.6, z = -1012.7 }, rot = { x = 0.0, y = 132.2, z = 0.0 }, level = 1 },
	{ config_id = 378, gadget_id = 70520013, pos = { x = 1395.3, y = 281.3, z = -995.9 }, rot = { x = 0.0, y = 194.0, z = 0.0 }, level = 1 },
	{ config_id = 379, gadget_id = 70520013, pos = { x = 1346.4, y = 288.9, z = -966.1 }, rot = { x = 0.0, y = 18.9, z = 0.0 }, level = 1 },
	{ config_id = 405, gadget_id = 70900003, pos = { x = 1124.4, y = 288.8, z = -1033.9 }, rot = { x = 0.0, y = 239.8, z = 0.0 }, level = 1 },
	{ config_id = 406, gadget_id = 70520013, pos = { x = 1364.2, y = 269.9, z = -478.8 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 407, gadget_id = 70520013, pos = { x = 1363.5, y = 269.8, z = -477.9 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 408, gadget_id = 70520013, pos = { x = 1402.0, y = 260.1, z = -454.1 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 409, gadget_id = 70520013, pos = { x = 1403.9, y = 259.0, z = -450.9 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 410, gadget_id = 70520013, pos = { x = 1402.5, y = 257.7, z = -429.5 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 411, gadget_id = 70520013, pos = { x = 1399.6, y = 256.8, z = -425.2 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 412, gadget_id = 70520013, pos = { x = 1415.4, y = 249.5, z = -378.0 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 413, gadget_id = 70520013, pos = { x = 1411.8, y = 249.5, z = -373.5 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 415, gadget_id = 70520013, pos = { x = 1308.8, y = 230.7, z = -308.6 }, rot = { x = 0.0, y = 156.8, z = 0.0 }, level = 1 },
	{ config_id = 416, gadget_id = 70520013, pos = { x = 1308.5, y = 230.7, z = -310.6 }, rot = { x = 0.0, y = 225.1, z = 0.0 }, level = 1 },
	{ config_id = 417, gadget_id = 40210006, pos = { x = 1536.9, y = 284.1, z = -806.3 }, rot = { x = 0.0, y = 151.4, z = 0.0 }, level = 1 },
	{ config_id = 418, gadget_id = 40210006, pos = { x = 1424.1, y = 301.3, z = -749.6 }, rot = { x = 0.0, y = 216.3, z = 0.0 }, level = 1 },
	{ config_id = 419, gadget_id = 40210006, pos = { x = 1396.7, y = 299.9, z = -884.4 }, rot = { x = 0.0, y = 21.4, z = 0.0 }, level = 1 },
	{ config_id = 420, gadget_id = 40210006, pos = { x = 1313.5, y = 277.6, z = -482.5 }, rot = { x = 0.0, y = 240.8, z = 0.0 }, level = 1 },
	{ config_id = 421, gadget_id = 40210006, pos = { x = 1369.5, y = 234.6, z = -338.7 }, rot = { x = 0.0, y = 291.8, z = 0.0 }, level = 1 },
	{ config_id = 422, gadget_id = 40210006, pos = { x = 1421.5, y = 265.0, z = -470.9 }, rot = { x = 0.0, y = 352.6, z = 0.0 }, level = 1 },
	{ config_id = 442, gadget_id = 70310003, pos = { x = 1248.2, y = 471.7, z = -785.6 }, rot = { x = 0.0, y = 46.3, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 443, gadget_id = 70310003, pos = { x = 1248.5, y = 473.5, z = -779.3 }, rot = { x = 0.0, y = 46.3, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 448, gadget_id = 70310003, pos = { x = 1179.7, y = 364.4, z = -496.2 }, rot = { x = 0.0, y = 258.6, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 452, gadget_id = 70310003, pos = { x = 1090.9, y = 358.9, z = -551.6 }, rot = { x = 0.0, y = 17.9, z = 0.0 }, level = 1, state = GadgetState.GearStart },
	{ config_id = 453, gadget_id = 70310003, pos = { x = 1086.3, y = 359.2, z = -559.3 }, rot = { x = 0.0, y = 17.9, z = 0.0 }, level = 1, state = GadgetState.GearStart }
}

-- 区域
regions = {
	{ config_id = 1, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1520.2, y = 286.9, z = -936.7 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_1", event = EventType.EVENT_ENTER_REGION, source = "", condition = "", action = "" }
}

-- 变量
variables = {
}

--================================================================
-- 
-- 初始化配置
-- 
--================================================================

-- 初始化时创建
init_config = {
	suite = 1,
	rand_suite = true,
	npcs = { }
}

--================================================================
-- 
-- 小组配置
-- 
--================================================================

suites = {
	{
		-- suite_id = 0,
		-- description = HuoBa,
		monsters = { 111 },
		gadgets = { 11, 13, 16, 20, 22, 23, 25, 26, 30, 31, 33, 34, 35, 36, 37, 40, 53, 54, 55, 56, 57, 59, 60, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 109, 110, 111, 112, 113, 115, 116, 118, 120, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 135, 136, 139, 140, 144, 145, 169, 179, 198, 202, 203, 206, 213, 233, 247, 261, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 299, 300, 308, 309, 312, 313, 314, 315, 318, 319, 320, 321, 322, 325, 328, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 405, 406, 407, 408, 409, 410, 411, 412, 413, 415, 416, 417, 418, 419, 420, 421, 422, 442, 443, 448, 452, 453 },
		regions = { 1 },
		triggers = { "ENTER_REGION_1" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件

-- 触发操作
