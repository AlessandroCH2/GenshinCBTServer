--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 3, monster_id = 21010201, pos = { x = 1238.2, y = 51.7, z = 342.5 }, rot = { x = 0.0, y = 43.7, z = 0.0 }, level = 10, drop_id = 200010 },
	{ config_id = 423, monster_id = 20105211, pos = { x = 1450.2, y = 63.9, z = 342.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10 },
	{ config_id = 424, monster_id = 20105211, pos = { x = 1453.6, y = 63.9, z = 342.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10 },
	{ config_id = 425, monster_id = 20105211, pos = { x = 1456.7, y = 64.1, z = 342.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10 },
	{ config_id = 426, monster_id = 20105211, pos = { x = 1456.5, y = 64.5, z = 345.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10 },
	{ config_id = 427, monster_id = 20105211, pos = { x = 1456.4, y = 64.9, z = 347.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10 },
	{ config_id = 318, monster_id = 20105213, pos = { x = 1382.0, y = 72.1, z = 187.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 375, monster_id = 21010401, pos = { x = 1336.7, y = 75.6, z = 145.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 376, monster_id = 21010401, pos = { x = 1334.9, y = 76.5, z = 142.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 378, monster_id = 20103027, pos = { x = 1338.0, y = 75.5, z = 143.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 379, monster_id = 21010801, pos = { x = 1336.7, y = 76.2, z = 140.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 324, monster_id = 20105211, pos = { x = 1474.0, y = 80.2, z = 202.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 325, monster_id = 20105211, pos = { x = 1476.5, y = 79.8, z = 204.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 326, monster_id = 20105211, pos = { x = 1480.8, y = 79.5, z = 205.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 327, monster_id = 20105211, pos = { x = 1483.9, y = 79.5, z = 203.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 328, monster_id = 20105211, pos = { x = 1480.8, y = 79.9, z = 201.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 329, monster_id = 20105211, pos = { x = 1478.1, y = 80.0, z = 202.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 330, monster_id = 20105211, pos = { x = 1474.8, y = 80.4, z = 199.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 331, monster_id = 20105211, pos = { x = 1478.1, y = 80.3, z = 198.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 332, monster_id = 20105211, pos = { x = 1481.7, y = 80.1, z = 199.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 333, monster_id = 20105211, pos = { x = 1475.6, y = 80.5, z = 197.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 382, monster_id = 21010601, pos = { x = 1237.1, y = 51.8, z = 347.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 200010 },
	{ config_id = 383, monster_id = 21010401, pos = { x = 1242.2, y = 51.8, z = 348.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 200010 },
	{ config_id = 384, monster_id = 21010801, pos = { x = 1240.3, y = 51.8, z = 350.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 200010 },
	{ config_id = 385, monster_id = 21010301, pos = { x = 1241.2, y = 51.7, z = 343.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 200010 },
	{ config_id = 393, monster_id = 20011301, pos = { x = 1484.7, y = 84.3, z = 248.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 200005 },
	{ config_id = 394, monster_id = 20105101, pos = { x = 1486.8, y = 84.5, z = 250.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 200005 },
	{ config_id = 395, monster_id = 20105101, pos = { x = 1483.8, y = 84.4, z = 250.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 200005 },
	{ config_id = 396, monster_id = 20105101, pos = { x = 1486.4, y = 84.4, z = 246.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 200005 },
	{ config_id = 397, monster_id = 20105101, pos = { x = 1482.8, y = 84.2, z = 246.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 200005 },
	{ config_id = 398, monster_id = 20011201, pos = { x = 1439.9, y = 63.0, z = 258.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 200010 },
	{ config_id = 176, monster_id = 28020101, pos = { x = 1383.2, y = 54.7, z = 417.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 399, monster_id = 20011201, pos = { x = 1441.1, y = 61.9, z = 260.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 200010 },
	{ config_id = 400, monster_id = 20011201, pos = { x = 1441.8, y = 63.0, z = 258.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 200010 },
	{ config_id = 401, monster_id = 20011201, pos = { x = 1443.2, y = 62.9, z = 260.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 200010 },
	{ config_id = 402, monster_id = 20105213, pos = { x = 1352.5, y = 69.3, z = 176.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 200005 },
	{ config_id = 403, monster_id = 20105211, pos = { x = 1281.2, y = 64.4, z = 208.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5 },
	{ config_id = 187, monster_id = 28020101, pos = { x = 1371.3, y = 56.1, z = 404.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 404, monster_id = 20105211, pos = { x = 1284.0, y = 64.4, z = 208.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5 },
	{ config_id = 209, monster_id = 28020101, pos = { x = 1402.4, y = 55.6, z = 408.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 405, monster_id = 20105211, pos = { x = 1287.1, y = 64.3, z = 209.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5 },
	{ config_id = 406, monster_id = 20105211, pos = { x = 1282.6, y = 65.2, z = 204.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 200005 },
	{ config_id = 234, monster_id = 28020101, pos = { x = 1226.9, y = 53.9, z = 358.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 407, monster_id = 20105211, pos = { x = 1285.3, y = 65.0, z = 205.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5, drop_id = 200005 },
	{ config_id = 408, monster_id = 20105211, pos = { x = 1288.4, y = 64.8, z = 205.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5 },
	{ config_id = 409, monster_id = 20105211, pos = { x = 1283.9, y = 65.9, z = 200.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5 },
	{ config_id = 410, monster_id = 20105211, pos = { x = 1286.8, y = 65.5, z = 201.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 5 },
	{ config_id = 411, monster_id = 20105211, pos = { x = 1289.5, y = 65.3, z = 202.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 418, monster_id = 20105211, pos = { x = 1450.3, y = 64.3, z = 348.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 200010 },
	{ config_id = 419, monster_id = 20105211, pos = { x = 1453.6, y = 64.2, z = 345.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 200010 },
	{ config_id = 420, monster_id = 20105211, pos = { x = 1453.4, y = 64.5, z = 348.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 200010 },
	{ config_id = 421, monster_id = 20105211, pos = { x = 1450.4, y = 64.2, z = 345.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 10, drop_id = 200010 }
}

-- NPC
npcs = {
	{ config_id = 41, npc_id = 1001, pos = { x = 1424.9, y = 66.0, z = 102.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 } },
	{ config_id = 42, npc_id = 1002, pos = { x = 1422.8, y = 65.6, z = 103.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 } },
	{ config_id = 43, npc_id = 1003, pos = { x = 1421.2, y = 65.3, z = 104.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 } },
	{ config_id = 44, npc_id = 1004, pos = { x = 1419.4, y = 65.2, z = 105.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 } },
	{ config_id = 45, npc_id = 1101, pos = { x = 1417.2, y = 65.0, z = 107.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 } },
	{ config_id = 46, npc_id = 1102, pos = { x = 1415.6, y = 64.8, z = 108.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 } },
	{ config_id = 47, npc_id = 1103, pos = { x = 1414.0, y = 64.6, z = 109.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 } },
	{ config_id = 48, npc_id = 1104, pos = { x = 1412.4, y = 64.4, z = 110.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 } }
}

-- 装置
gadgets = {
	{ config_id = 4, gadget_id = 70220005, pos = { x = 1242.4, y = 51.7, z = 344.1 }, rot = { x = 0.0, y = 41.8, z = 0.0 }, level = 1 },
	{ config_id = 631, gadget_id = 70290002, pos = { x = 1459.2, y = 63.6, z = 153.3 }, rot = { x = 0.0, y = 82.6, z = 0.0 }, level = 1 },
	{ config_id = 632, gadget_id = 70500000, pos = { x = 1460.2, y = 67.8, z = 153.0 }, rot = { x = 0.0, y = 82.6, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 633, gadget_id = 70500000, pos = { x = 1458.4, y = 67.6, z = 152.7 }, rot = { x = 0.0, y = 82.6, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 634, gadget_id = 70500000, pos = { x = 1461.4, y = 67.6, z = 152.2 }, rot = { x = 0.0, y = 82.6, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 635, gadget_id = 70290002, pos = { x = 1427.8, y = 60.1, z = 148.6 }, rot = { x = 0.0, y = 352.8, z = 0.0 }, level = 1 },
	{ config_id = 636, gadget_id = 70500000, pos = { x = 1428.1, y = 64.3, z = 149.7 }, rot = { x = 0.0, y = 352.8, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 637, gadget_id = 70500000, pos = { x = 1428.4, y = 64.0, z = 147.8 }, rot = { x = 0.0, y = 352.8, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 638, gadget_id = 70500000, pos = { x = 1428.9, y = 64.1, z = 150.8 }, rot = { x = 0.0, y = 352.8, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 639, gadget_id = 70290002, pos = { x = 1440.8, y = 60.1, z = 172.7 }, rot = { x = 0.0, y = 278.3, z = 0.0 }, level = 1 },
	{ config_id = 640, gadget_id = 70500000, pos = { x = 1439.9, y = 64.3, z = 173.3 }, rot = { x = 0.0, y = 278.3, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 641, gadget_id = 70500000, pos = { x = 1441.7, y = 64.1, z = 173.1 }, rot = { x = 0.0, y = 278.3, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 642, gadget_id = 70500000, pos = { x = 1439.0, y = 64.1, z = 174.4 }, rot = { x = 0.0, y = 278.3, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 643, gadget_id = 70290002, pos = { x = 1407.4, y = 58.1, z = 184.9 }, rot = { x = 0.0, y = 88.8, z = 0.0 }, level = 1 },
	{ config_id = 644, gadget_id = 70500000, pos = { x = 1408.4, y = 62.3, z = 184.5 }, rot = { x = 0.0, y = 88.8, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 645, gadget_id = 70500000, pos = { x = 1406.5, y = 62.1, z = 184.4 }, rot = { x = 0.0, y = 88.8, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 646, gadget_id = 70500000, pos = { x = 1409.4, y = 62.1, z = 183.6 }, rot = { x = 0.0, y = 88.8, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 647, gadget_id = 70290002, pos = { x = 1426.2, y = 57.5, z = 199.7 }, rot = { x = 0.0, y = 261.0, z = 0.0 }, level = 1 },
	{ config_id = 648, gadget_id = 70500000, pos = { x = 1425.2, y = 61.7, z = 200.0 }, rot = { x = 0.0, y = 261.0, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 649, gadget_id = 70500000, pos = { x = 1427.0, y = 61.4, z = 200.2 }, rot = { x = 0.0, y = 261.0, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 650, gadget_id = 70500000, pos = { x = 1424.0, y = 61.5, z = 200.7 }, rot = { x = 0.0, y = 261.0, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 651, gadget_id = 70290002, pos = { x = 1402.5, y = 58.5, z = 222.3 }, rot = { x = 0.0, y = 359.9, z = 0.0 }, level = 1 },
	{ config_id = 652, gadget_id = 70500000, pos = { x = 1403.0, y = 62.7, z = 223.3 }, rot = { x = 0.0, y = 359.9, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 653, gadget_id = 70500000, pos = { x = 1403.0, y = 62.5, z = 221.4 }, rot = { x = 0.0, y = 359.9, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 654, gadget_id = 70500000, pos = { x = 1403.9, y = 62.5, z = 224.3 }, rot = { x = 0.0, y = 359.9, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 655, gadget_id = 70290002, pos = { x = 1421.1, y = 57.5, z = 237.4 }, rot = { x = 0.0, y = 331.0, z = 0.0 }, level = 1 },
	{ config_id = 656, gadget_id = 70500000, pos = { x = 1421.0, y = 61.7, z = 238.5 }, rot = { x = 0.0, y = 331.0, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 657, gadget_id = 70500000, pos = { x = 1421.9, y = 61.5, z = 236.9 }, rot = { x = 0.0, y = 331.0, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 658, gadget_id = 70500000, pos = { x = 1421.3, y = 61.5, z = 239.8 }, rot = { x = 0.0, y = 331.0, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 659, gadget_id = 70290002, pos = { x = 1394.5, y = 63.3, z = 246.1 }, rot = { x = 0.0, y = 62.8, z = 0.0 }, level = 1 },
	{ config_id = 660, gadget_id = 70500000, pos = { x = 1395.6, y = 67.5, z = 246.1 }, rot = { x = 0.0, y = 62.8, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 661, gadget_id = 70500000, pos = { x = 1393.9, y = 67.2, z = 245.3 }, rot = { x = 0.0, y = 62.8, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 662, gadget_id = 70500000, pos = { x = 1396.9, y = 67.3, z = 245.7 }, rot = { x = 0.0, y = 62.8, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 663, gadget_id = 70290002, pos = { x = 1381.6, y = 57.3, z = 231.2 }, rot = { x = 0.0, y = 215.9, z = 0.0 }, level = 1 },
	{ config_id = 664, gadget_id = 70500000, pos = { x = 1380.7, y = 61.5, z = 230.6 }, rot = { x = 0.0, y = 215.9, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 665, gadget_id = 70500000, pos = { x = 1381.7, y = 61.2, z = 232.1 }, rot = { x = 0.0, y = 215.9, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 666, gadget_id = 70500000, pos = { x = 1379.3, y = 61.3, z = 230.4 }, rot = { x = 0.0, y = 215.9, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 667, gadget_id = 70290002, pos = { x = 1403.2, y = 55.9, z = 283.3 }, rot = { x = 0.0, y = 285.2, z = 0.0 }, level = 1 },
	{ config_id = 668, gadget_id = 70500000, pos = { x = 1402.4, y = 60.1, z = 284.0 }, rot = { x = 0.0, y = 285.2, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 669, gadget_id = 70500000, pos = { x = 1404.1, y = 59.8, z = 283.5 }, rot = { x = 0.0, y = 285.2, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 670, gadget_id = 70500000, pos = { x = 1401.6, y = 59.9, z = 285.2 }, rot = { x = 0.0, y = 285.2, z = 0.0 }, level = 1, point_type = 2 },
	{ config_id = 597, gadget_id = 70500000, pos = { x = 1453.6, y = 62.4, z = 158.5 }, rot = { x = 340.2, y = 350.7, z = 205.9 }, level = 1, point_type = 1 },
	{ config_id = 598, gadget_id = 70500000, pos = { x = 1427.9, y = 59.1, z = 153.0 }, rot = { x = 14.3, y = 358.8, z = 175.2 }, level = 1, point_type = 1 },
	{ config_id = 599, gadget_id = 70500000, pos = { x = 1426.0, y = 60.6, z = 141.5 }, rot = { x = 357.5, y = 0.2, z = 174.3 }, level = 1, point_type = 1 },
	{ config_id = 600, gadget_id = 70500000, pos = { x = 1428.9, y = 60.1, z = 136.0 }, rot = { x = 2.5, y = 359.9, z = 178.6 }, level = 1, point_type = 1 },
	{ config_id = 601, gadget_id = 70500000, pos = { x = 1462.6, y = 63.8, z = 144.8 }, rot = { x = 0.9, y = 0.4, z = 200.6 }, level = 1, point_type = 1 },
	{ config_id = 602, gadget_id = 70500000, pos = { x = 1463.2, y = 63.9, z = 141.3 }, rot = { x = 1.4, y = 0.3, z = 192.3 }, level = 1, point_type = 1 },
	{ config_id = 603, gadget_id = 70500000, pos = { x = 1464.1, y = 64.7, z = 148.2 }, rot = { x = 350.1, y = 356.2, z = 200.9 }, level = 1, point_type = 1 },
	{ config_id = 604, gadget_id = 70500000, pos = { x = 1436.6, y = 60.9, z = 131.2 }, rot = { x = 8.2, y = 0.1, z = 180.4 }, level = 1, point_type = 1 },
	{ config_id = 605, gadget_id = 70500000, pos = { x = 1435.7, y = 59.5, z = 143.4 }, rot = { x = 7.5, y = 0.4, z = 182.9 }, level = 1, point_type = 1 },
	{ config_id = 606, gadget_id = 70500000, pos = { x = 1438.0, y = 58.4, z = 151.8 }, rot = { x = 10.3, y = 0.0, z = 180.0 }, level = 1, point_type = 1 },
	{ config_id = 607, gadget_id = 70500000, pos = { x = 1424.9, y = 58.4, z = 166.9 }, rot = { x = 20.6, y = 355.4, z = 167.2 }, level = 1, point_type = 1 },
	{ config_id = 608, gadget_id = 70500000, pos = { x = 1434.3, y = 58.4, z = 181.7 }, rot = { x = 346.0, y = 352.3, z = 209.2 }, level = 1, point_type = 1 },
	{ config_id = 609, gadget_id = 70500000, pos = { x = 1411.7, y = 56.5, z = 182.3 }, rot = { x = 6.0, y = 359.3, z = 173.5 }, level = 1, point_type = 1 },
	{ config_id = 610, gadget_id = 70500000, pos = { x = 1407.3, y = 56.9, z = 203.1 }, rot = { x = 352.7, y = 1.2, z = 170.3 }, level = 1, point_type = 1 },
	{ config_id = 611, gadget_id = 70500000, pos = { x = 1425.4, y = 57.2, z = 204.0 }, rot = { x = 358.9, y = 359.4, z = 208.3 }, level = 1, point_type = 1 },
	{ config_id = 612, gadget_id = 70500000, pos = { x = 1408.1, y = 57.0, z = 206.5 }, rot = { x = 359.7, y = 0.1, z = 168.7 }, level = 1, point_type = 1 },
	{ config_id = 613, gadget_id = 70500000, pos = { x = 1406.2, y = 56.2, z = 223.5 }, rot = { x = 7.6, y = 354.9, z = 145.9 }, level = 1, point_type = 1 },
	{ config_id = 614, gadget_id = 70500000, pos = { x = 1401.7, y = 55.6, z = 229.6 }, rot = { x = 3.2, y = 359.8, z = 175.7 }, level = 1, point_type = 1 },
	{ config_id = 615, gadget_id = 70500000, pos = { x = 1423.2, y = 58.4, z = 234.1 }, rot = { x = 351.0, y = 354.2, z = 213.2 }, level = 1, point_type = 1 },
	{ config_id = 616, gadget_id = 70500000, pos = { x = 1396.4, y = 56.2, z = 232.5 }, rot = { x = 8.0, y = 357.3, z = 161.5 }, level = 1, point_type = 1 },
	{ config_id = 617, gadget_id = 70500000, pos = { x = 1418.8, y = 56.5, z = 254.7 }, rot = { x = 351.4, y = 356.6, z = 201.4 }, level = 1, point_type = 1 },
	{ config_id = 618, gadget_id = 70500000, pos = { x = 1400.0, y = 56.3, z = 240.2 }, rot = { x = 341.7, y = 2.5, z = 172.1 }, level = 1, point_type = 1 },
	{ config_id = 619, gadget_id = 70500000, pos = { x = 1389.3, y = 56.1, z = 236.7 }, rot = { x = 359.7, y = 359.9, z = 197.7 }, level = 1, point_type = 1 },
	{ config_id = 620, gadget_id = 70500000, pos = { x = 1373.0, y = 56.0, z = 245.7 }, rot = { x = 12.0, y = 356.5, z = 163.6 }, level = 1, point_type = 1 },
	{ config_id = 621, gadget_id = 70500000, pos = { x = 1372.5, y = 54.9, z = 270.8 }, rot = { x = 358.0, y = 1.0, z = 152.6 }, level = 1, point_type = 1 },
	{ config_id = 622, gadget_id = 70500000, pos = { x = 1408.6, y = 55.8, z = 281.2 }, rot = { x = 344.5, y = 358.3, z = 186.3 }, level = 1, point_type = 1 },
	{ config_id = 623, gadget_id = 70500000, pos = { x = 1393.2, y = 55.1, z = 294.2 }, rot = { x = 355.4, y = 358.2, z = 201.6 }, level = 1, point_type = 1 },
	{ config_id = 624, gadget_id = 70500000, pos = { x = 1427.9, y = 58.5, z = 213.4 }, rot = { x = 354.5, y = 357.7, z = 202.8 }, level = 1, point_type = 1 },
	{ config_id = 625, gadget_id = 70500000, pos = { x = 1418.2, y = 56.8, z = 178.6 }, rot = { x = 21.0, y = 356.7, z = 170.9 }, level = 1, point_type = 1 },
	{ config_id = 626, gadget_id = 70500000, pos = { x = 1426.7, y = 57.7, z = 195.9 }, rot = { x = 353.6, y = 356.9, z = 205.6 }, level = 1, point_type = 1 },
	{ config_id = 627, gadget_id = 70500000, pos = { x = 1406.0, y = 56.8, z = 197.6 }, rot = { x = 2.4, y = 359.0, z = 156.6 }, level = 1, point_type = 1 },
	{ config_id = 628, gadget_id = 70500000, pos = { x = 1371.7, y = 54.4, z = 257.4 }, rot = { x = 9.8, y = 357.7, z = 166.8 }, level = 1, point_type = 1 },
	{ config_id = 629, gadget_id = 70500000, pos = { x = 1384.1, y = 53.0, z = 298.6 }, rot = { x = 352.7, y = 358.1, z = 194.5 }, level = 1, point_type = 1 },
	{ config_id = 630, gadget_id = 70500000, pos = { x = 1370.9, y = 54.1, z = 279.5 }, rot = { x = 12.5, y = 356.6, z = 164.6 }, level = 1, point_type = 1 },
	{ config_id = 416, gadget_id = 70220005, pos = { x = 1242.2, y = 51.7, z = 345.7 }, rot = { x = 0.0, y = 356.7, z = 0.0 }, level = 1 },
	{ config_id = 441, gadget_id = 70220005, pos = { x = 1236.1, y = 51.6, z = 341.3 }, rot = { x = 0.0, y = 131.7, z = 0.0 }, level = 1 }
}

-- 区域
regions = {
}

-- 触发器
triggers = {
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
	monsters = { 3, 176, 187, 209, 234, 318, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 375, 376, 378, 379, 382, 383, 384, 385, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 418, 419, 420, 421, 423, 424, 425, 426, 427 },
	npcs = { 41, 42, 43, 44, 45, 46, 47, 48 },
	gadgets = { 4, 416, 441, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619, 620, 621, 622, 623, 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661, 662, 663, 664, 665, 666, 667, 668, 669, 670 },
	regions = { },
	triggers = { }
}

--================================================================
-- 
-- 触发器
-- 
--================================================================
