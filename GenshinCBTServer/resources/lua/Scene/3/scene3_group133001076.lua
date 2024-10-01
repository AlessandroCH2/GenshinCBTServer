--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 281, monster_id = 28030101, pos = { x = 2053.6, y = 229.2, z = -1213.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 282, monster_id = 28030101, pos = { x = 2035.6, y = 198.9, z = -1210.6 }, rot = { x = 0.0, y = 64.2, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 283, monster_id = 28030101, pos = { x = 1915.3, y = 195.4, z = -1207.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 284, monster_id = 28030101, pos = { x = 1913.6, y = 195.3, z = -1201.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 285, monster_id = 28030101, pos = { x = 1931.0, y = 220.5, z = -1363.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 291, monster_id = 28030101, pos = { x = 1975.6, y = 195.7, z = -1269.8 }, rot = { x = 0.0, y = 320.5, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 292, monster_id = 28030101, pos = { x = 1971.5, y = 195.4, z = -1270.5 }, rot = { x = 0.0, y = 52.8, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 293, monster_id = 28030101, pos = { x = 1977.1, y = 196.3, z = -1272.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 296, monster_id = 28030101, pos = { x = 1937.4, y = 218.7, z = -1346.7 }, rot = { x = 0.0, y = 51.4, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 325, monster_id = 28030401, pos = { x = 2109.7, y = 210.6, z = -1236.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 326, monster_id = 28050101, pos = { x = 1877.8, y = 201.9, z = -1272.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 327, monster_id = 28050101, pos = { x = 1913.7, y = 201.9, z = -1254.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 328, monster_id = 28050101, pos = { x = 1953.8, y = 196.5, z = -1217.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 329, monster_id = 28050101, pos = { x = 1887.2, y = 204.7, z = -1251.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 330, monster_id = 28050101, pos = { x = 1898.8, y = 203.8, z = -1276.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 331, monster_id = 28050101, pos = { x = 1883.7, y = 211.5, z = -1274.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 334, monster_id = 28020301, pos = { x = 1770.5, y = 205.4, z = -1296.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 336, monster_id = 28050101, pos = { x = 1983.0, y = 203.3, z = -1357.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 338, monster_id = 28050101, pos = { x = 1868.3, y = 199.2, z = -1156.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 340, monster_id = 28050101, pos = { x = 1796.6, y = 202.3, z = -1296.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 343, monster_id = 28030101, pos = { x = 1886.5, y = 223.2, z = -1096.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 344, monster_id = 28030101, pos = { x = 1881.7, y = 223.6, z = -1100.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 345, monster_id = 28030101, pos = { x = 1825.9, y = 205.6, z = -1221.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 346, monster_id = 28030101, pos = { x = 1827.0, y = 204.9, z = -1216.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 347, monster_id = 28030101, pos = { x = 1728.3, y = 214.3, z = -1340.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 348, monster_id = 28030101, pos = { x = 1742.6, y = 214.1, z = -1409.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 358, monster_id = 28030101, pos = { x = 1732.0, y = 214.1, z = -1340.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 376, monster_id = 28030401, pos = { x = 1799.1, y = 196.3, z = -1335.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 403, monster_id = 28020102, pos = { x = 1869.9, y = 196.6, z = -1392.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 404, monster_id = 28020102, pos = { x = 1908.6, y = 197.9, z = -1431.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 405, monster_id = 28020102, pos = { x = 1907.6, y = 197.9, z = -1439.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 408, monster_id = 28030101, pos = { x = 1814.2, y = 195.0, z = -1413.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 409, monster_id = 28030101, pos = { x = 1811.0, y = 195.0, z = -1413.6 }, rot = { x = 0.0, y = 278.4, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 412, monster_id = 28030101, pos = { x = 1994.1, y = 216.6, z = -1100.7 }, rot = { x = 0.0, y = 278.4, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 413, monster_id = 28030101, pos = { x = 1991.4, y = 216.7, z = -1101.8 }, rot = { x = 0.0, y = 278.4, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 414, monster_id = 28020102, pos = { x = 1966.7, y = 195.5, z = -1277.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 455, monster_id = 28030401, pos = { x = 1992.3, y = 193.8, z = -1184.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 456, monster_id = 28020102, pos = { x = 1994.3, y = 194.2, z = -1184.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 469, monster_id = 28030401, pos = { x = 1993.5, y = 194.0, z = -1183.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 472, monster_id = 28030401, pos = { x = 1794.5, y = 197.2, z = -1335.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 491, monster_id = 28010103, pos = { x = 1693.5, y = 194.6, z = -1577.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 492, monster_id = 28010103, pos = { x = 1699.3, y = 194.6, z = -1577.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 493, monster_id = 28010103, pos = { x = 1699.0, y = 194.6, z = -1581.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 494, monster_id = 28010103, pos = { x = 1695.7, y = 194.6, z = -1583.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 495, monster_id = 28010103, pos = { x = 1861.7, y = 194.6, z = -1589.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 496, monster_id = 28010103, pos = { x = 1864.2, y = 194.6, z = -1593.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 497, monster_id = 28010103, pos = { x = 1861.9, y = 194.6, z = -1593.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 498, monster_id = 28010103, pos = { x = 1779.8, y = 194.6, z = -1604.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 499, monster_id = 28010103, pos = { x = 1781.5, y = 194.6, z = -1602.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 565, monster_id = 28020102, pos = { x = 2136.7, y = 203.7, z = -1110.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 566, monster_id = 28020102, pos = { x = 2161.2, y = 223.7, z = -1181.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 567, monster_id = 28020102, pos = { x = 2093.1, y = 212.3, z = -1087.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 568, monster_id = 28030401, pos = { x = 2105.0, y = 205.4, z = -1117.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 569, monster_id = 28030401, pos = { x = 2106.9, y = 205.8, z = -1118.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 570, monster_id = 28030401, pos = { x = 2105.3, y = 205.1, z = -1118.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 571, monster_id = 28030401, pos = { x = 2164.1, y = 208.6, z = -1104.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 572, monster_id = 28030401, pos = { x = 2164.8, y = 208.8, z = -1105.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 573, monster_id = 28030401, pos = { x = 2162.4, y = 208.4, z = -1105.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 574, monster_id = 28030101, pos = { x = 2112.5, y = 235.8, z = -1169.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 575, monster_id = 28020102, pos = { x = 2051.3, y = 197.6, z = -1144.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 687, monster_id = 28030101, pos = { x = 1725.2, y = 197.8, z = -1596.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 688, monster_id = 28030101, pos = { x = 1725.8, y = 197.9, z = -1599.8 }, rot = { x = 0.0, y = 87.2, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 689, monster_id = 28030101, pos = { x = 1729.0, y = 196.1, z = -1589.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 710, monster_id = 28030101, pos = { x = 2008.0, y = 240.5, z = -1425.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 711, monster_id = 28030101, pos = { x = 2011.5, y = 241.3, z = -1424.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 712, monster_id = 28030101, pos = { x = 2003.5, y = 239.9, z = -1438.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 740, monster_id = 28030101, pos = { x = 1687.1, y = 254.7, z = -1434.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 741, monster_id = 28030101, pos = { x = 1687.3, y = 255.0, z = -1437.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 742, monster_id = 28030101, pos = { x = 1685.0, y = 255.1, z = -1435.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 747, monster_id = 28030101, pos = { x = 1663.2, y = 256.5, z = -1362.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 748, monster_id = 28030101, pos = { x = 1684.5, y = 265.0, z = -1336.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 749, monster_id = 28030101, pos = { x = 1682.6, y = 264.9, z = -1332.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 750, monster_id = 28030101, pos = { x = 1653.2, y = 274.0, z = -1440.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 751, monster_id = 28030101, pos = { x = 1647.4, y = 274.0, z = -1442.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 4, pose_id = 2 },
	{ config_id = 752, monster_id = 20011201, pos = { x = 1652.3, y = 254.6, z = -1370.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 4, drop_id = 303041 },
	{ config_id = 761, monster_id = 28030101, pos = { x = 1907.0, y = 195.1, z = -1574.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 803, monster_id = 28030101, pos = { x = 2037.1, y = 199.0, z = -1212.6 }, rot = { x = 0.0, y = 64.2, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 810, monster_id = 28020102, pos = { x = 2143.4, y = 204.7, z = -1138.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, disableWander = true },
	{ config_id = 811, monster_id = 28030101, pos = { x = 2056.9, y = 229.4, z = -1212.5 }, rot = { x = 0.0, y = 32.7, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 817, monster_id = 28030101, pos = { x = 1739.3, y = 214.2, z = -1408.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 821, monster_id = 28030101, pos = { x = 1934.3, y = 246.5, z = -1588.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 822, monster_id = 28030101, pos = { x = 1936.1, y = 246.5, z = -1594.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 901 },
	{ config_id = 828, monster_id = 20010501, pos = { x = 2137.6, y = 199.4, z = -1681.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 4, drop_id = 303041 },
	{ config_id = 829, monster_id = 20010501, pos = { x = 2138.2, y = 199.2, z = -1682.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 4, drop_id = 303041 },
	{ config_id = 830, monster_id = 28030101, pos = { x = 1970.5, y = 231.2, z = -1574.6 }, rot = { x = 0.0, y = 334.2, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 842, monster_id = 28030101, pos = { x = 2094.1, y = 206.8, z = -1220.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 846, monster_id = 28010103, pos = { x = 1676.8, y = 195.5, z = -1556.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 847, monster_id = 28010103, pos = { x = 1678.3, y = 195.7, z = -1553.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1035, monster_id = 28020102, pos = { x = 1982.0, y = 221.6, z = -1081.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1036, monster_id = 28020102, pos = { x = 1948.9, y = 220.3, z = -1098.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1037, monster_id = 28020102, pos = { x = 1843.0, y = 225.0, z = -1122.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1038, monster_id = 28020102, pos = { x = 1824.4, y = 227.8, z = -1091.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1067, monster_id = 20011201, pos = { x = 1650.6, y = 254.5, z = -1370.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 4, drop_id = 303041 },
	{ config_id = 1068, monster_id = 20011001, pos = { x = 1596.6, y = 250.1, z = -1411.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 4, drop_id = 303041 },
	{ config_id = 1069, monster_id = 20011001, pos = { x = 1594.7, y = 249.5, z = -1409.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 4, drop_id = 303041 },
	{ config_id = 1138, monster_id = 28010103, pos = { x = 1969.5, y = 196.4, z = -1612.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1139, monster_id = 28010102, pos = { x = 1984.8, y = 199.0, z = -1612.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1140, monster_id = 28010103, pos = { x = 2004.9, y = 198.4, z = -1624.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1141, monster_id = 28010102, pos = { x = 2001.5, y = 194.1, z = -1642.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1142, monster_id = 28010103, pos = { x = 1960.7, y = 195.1, z = -1620.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1143, monster_id = 28010103, pos = { x = 1975.9, y = 196.1, z = -1619.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1144, monster_id = 28010102, pos = { x = 1996.0, y = 195.9, z = -1631.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1145, monster_id = 28010103, pos = { x = 1992.6, y = 193.6, z = -1649.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 1230, monster_id = 28030101, pos = { x = 1675.5, y = 244.4, z = -1359.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 1231, monster_id = 28030101, pos = { x = 1674.3, y = 244.4, z = -1361.7 }, rot = { x = 0.0, y = 109.8, z = 0.0 }, level = 0, pose_id = 2 },
	{ config_id = 1232, monster_id = 28020301, pos = { x = 1940.4, y = 202.4, z = -1479.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1675, gadget_id = 70500000, pos = { x = 1887.6, y = 222.2, z = -1257.8 }, rot = { x = 0.0, y = 183.0, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 1676, gadget_id = 70500000, pos = { x = 1902.0, y = 228.3, z = -1084.5 }, rot = { x = 0.0, y = 213.4, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 1677, gadget_id = 70500000, pos = { x = 1881.8, y = 241.8, z = -1056.7 }, rot = { x = 0.0, y = 19.1, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 1678, gadget_id = 70500000, pos = { x = 1971.9, y = 241.3, z = -1039.5 }, rot = { x = 0.0, y = 17.7, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 1723, gadget_id = 70210021, pos = { x = 1927.0, y = 216.6, z = -1130.5 }, rot = { x = 0.0, y = 335.2, z = 0.0 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true },
	{ config_id = 1730, gadget_id = 70500000, pos = { x = 2010.8, y = 210.3, z = -1401.1 }, rot = { x = 0.0, y = 183.0, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 1731, gadget_id = 70210021, pos = { x = 1964.5, y = 222.1, z = -1491.0 }, rot = { x = 0.0, y = 191.2, z = 0.0 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true },
	{ config_id = 1754, gadget_id = 70680001, pos = { x = 1651.8, y = 197.1, z = -1659.1 }, rot = { x = 0.0, y = 187.5, z = 0.0 }, level = 1, arguments = { 5, 10, 5 } },
	{ config_id = 1807, gadget_id = 70500000, pos = { x = 1816.2, y = 207.3, z = -1199.1 }, rot = { x = 0.0, y = 17.7, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 1808, gadget_id = 70500000, pos = { x = 1820.4, y = 207.9, z = -1171.0 }, rot = { x = 0.0, y = 17.7, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 1930, gadget_id = 70500000, pos = { x = 2071.9, y = 208.9, z = -1264.2 }, rot = { x = 0.0, y = 183.0, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 1954, gadget_id = 70500000, pos = { x = 2024.5, y = 216.6, z = -1434.4 }, rot = { x = 0.0, y = 213.4, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 2033, gadget_id = 70500000, pos = { x = 1686.2, y = 230.7, z = -1374.4 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2001 },
	{ config_id = 2034, gadget_id = 70210021, pos = { x = 1699.1, y = 233.2, z = -1345.8 }, rot = { x = 0.0, y = 182.0, z = 0.0 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true },
	{ config_id = 2035, gadget_id = 70500000, pos = { x = 1679.0, y = 234.9, z = -1380.7 }, rot = { x = 0.0, y = 213.4, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 2038, gadget_id = 70500000, pos = { x = 1668.3, y = 244.7, z = -1363.4 }, rot = { x = 0.0, y = 213.4, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 2041, gadget_id = 70210021, pos = { x = 1680.8, y = 244.3, z = -1327.4 }, rot = { x = 0.3, y = 218.1, z = 10.7 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true },
	{ config_id = 2049, gadget_id = 70500000, pos = { x = 1588.2, y = 258.1, z = -1294.3 }, rot = { x = 0.0, y = 213.4, z = 0.0 }, level = 1, point_type = 1002 },
	{ config_id = 2050, gadget_id = 70500000, pos = { x = 1661.0, y = 254.0, z = -1308.4 }, rot = { x = 0.0, y = 213.4, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 2061, gadget_id = 70210021, pos = { x = 1612.2, y = 262.8, z = -1279.4 }, rot = { x = 357.5, y = 195.9, z = 8.9 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true },
	{ config_id = 2062, gadget_id = 70500000, pos = { x = 1668.1, y = 258.1, z = -1427.8 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2001 },
	{ config_id = 2063, gadget_id = 70500000, pos = { x = 1664.0, y = 259.0, z = -1437.2 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2001 },
	{ config_id = 2073, gadget_id = 70500000, pos = { x = 1764.9, y = 208.5, z = -1357.4 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2001 },
	{ config_id = 2075, gadget_id = 70500000, pos = { x = 1753.5, y = 209.9, z = -1330.5 }, rot = { x = 0.0, y = 291.4, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 2079, gadget_id = 70500000, pos = { x = 1920.0, y = 198.0, z = -1565.5 }, rot = { x = 0.0, y = 291.4, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 2080, gadget_id = 70500000, pos = { x = 1916.2, y = 199.3, z = -1558.5 }, rot = { x = 0.0, y = 291.4, z = 13.8 }, level = 1, point_type = 1001 },
	{ config_id = 2081, gadget_id = 70500000, pos = { x = 1905.0, y = 197.9, z = -1497.6 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2001 },
	{ config_id = 2085, gadget_id = 70500000, pos = { x = 1925.1, y = 199.7, z = -1505.1 }, rot = { x = 0.0, y = 291.4, z = 13.8 }, level = 1, point_type = 1001 },
	{ config_id = 2092, gadget_id = 70210011, pos = { x = 1807.3, y = 194.9, z = -1507.6 }, rot = { x = 0.0, y = 225.1, z = 0.0 }, level = 1, chest_drop_id = 403301, isOneoff = true, persistent = true },
	{ config_id = 2236, gadget_id = 70500000, pos = { x = 1862.6, y = 202.9, z = -1348.7 }, rot = { x = 0.0, y = 183.0, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 2269, gadget_id = 70290001, pos = { x = 1991.9, y = 194.2, z = -1194.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2270, gadget_id = 70500000, pos = { x = 1991.9, y = 194.8, z = -1194.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2269 },
	{ config_id = 2271, gadget_id = 70500000, pos = { x = 1991.8, y = 195.1, z = -1195.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2269 },
	{ config_id = 2272, gadget_id = 70500000, pos = { x = 1992.1, y = 195.5, z = -1195.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2269 },
	{ config_id = 2275, gadget_id = 70500000, pos = { x = 1974.5, y = 221.4, z = -1568.2 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2001 },
	{ config_id = 2277, gadget_id = 70500000, pos = { x = 2029.3, y = 218.5, z = -1611.2 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2001 },
	{ config_id = 2278, gadget_id = 70500000, pos = { x = 2028.7, y = 218.5, z = -1609.6 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2001 },
	{ config_id = 2280, gadget_id = 70290001, pos = { x = 2004.6, y = 221.3, z = -1581.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2281, gadget_id = 70500000, pos = { x = 2004.6, y = 221.9, z = -1580.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2280 },
	{ config_id = 2282, gadget_id = 70500000, pos = { x = 2004.5, y = 222.1, z = -1581.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2280 },
	{ config_id = 2283, gadget_id = 70500000, pos = { x = 2004.9, y = 222.6, z = -1581.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2280 },
	{ config_id = 2367, gadget_id = 70210101, pos = { x = 1745.6, y = 194.6, z = -1536.5 }, rot = { x = 0.0, y = 292.8, z = 0.0 }, level = 1, chest_drop_id = 400101 },
	{ config_id = 2368, gadget_id = 70210101, pos = { x = 1722.8, y = 194.7, z = -1551.0 }, rot = { x = 0.0, y = 190.3, z = 0.0 }, level = 1, chest_drop_id = 400101 },
	{ config_id = 2375, gadget_id = 70500000, pos = { x = 2142.0, y = 198.7, z = -1684.1 }, rot = { x = 0.0, y = 268.4, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 2376, gadget_id = 70500000, pos = { x = 2141.3, y = 198.6, z = -1685.4 }, rot = { x = 0.0, y = 268.4, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 2391, gadget_id = 70290003, pos = { x = 1890.2, y = 217.6, z = -1273.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2392, gadget_id = 70500000, pos = { x = 1890.2, y = 217.7, z = -1273.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 2391 },
	{ config_id = 2393, gadget_id = 70500000, pos = { x = 1890.2, y = 217.7, z = -1273.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 2391 },
	{ config_id = 2404, gadget_id = 70500000, pos = { x = 1765.2, y = 202.7, z = -1308.2 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 2405, gadget_id = 70500000, pos = { x = 1785.6, y = 204.7, z = -1289.8 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 2406, gadget_id = 70500000, pos = { x = 1744.1, y = 215.5, z = -1275.2 }, rot = { x = 0.0, y = 268.4, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 2407, gadget_id = 70500000, pos = { x = 1737.5, y = 218.2, z = -1279.8 }, rot = { x = 0.0, y = 268.4, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 2408, gadget_id = 70290002, pos = { x = 1757.6, y = 212.1, z = -1286.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2409, gadget_id = 70500000, pos = { x = 1756.6, y = 213.8, z = -1285.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2408 },
	{ config_id = 2410, gadget_id = 70500000, pos = { x = 1758.5, y = 214.8, z = -1287.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2408 },
	{ config_id = 2411, gadget_id = 70500000, pos = { x = 1757.7, y = 215.1, z = -1284.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2408 },
	{ config_id = 2502, gadget_id = 70290002, pos = { x = 1907.4, y = 227.2, z = -1091.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2503, gadget_id = 70500000, pos = { x = 1906.3, y = 228.9, z = -1090.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2502 },
	{ config_id = 2504, gadget_id = 70500000, pos = { x = 1908.3, y = 229.9, z = -1092.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2502 },
	{ config_id = 2505, gadget_id = 70500000, pos = { x = 1907.4, y = 230.1, z = -1089.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2502 },
	{ config_id = 2506, gadget_id = 70500000, pos = { x = 1835.6, y = 225.8, z = -1131.2 }, rot = { x = 337.7, y = 268.4, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 2507, gadget_id = 70210101, pos = { x = 1796.9, y = 232.7, z = -1093.4 }, rot = { x = 0.0, y = 292.8, z = 0.0 }, level = 1, chest_drop_id = 400101 },
	{ config_id = 2508, gadget_id = 70500000, pos = { x = 1823.2, y = 235.8, z = -1069.1 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 2509, gadget_id = 70500000, pos = { x = 1798.9, y = 241.0, z = -1065.1 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 2510, gadget_id = 70500000, pos = { x = 1811.0, y = 240.9, z = -1053.2 }, rot = { x = 337.7, y = 268.4, z = 0.0 }, level = 1, point_type = 1001 },
	{ config_id = 2511, gadget_id = 70290002, pos = { x = 1783.3, y = 234.8, z = -1118.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2512, gadget_id = 70500000, pos = { x = 1782.3, y = 236.4, z = -1118.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2511 },
	{ config_id = 2513, gadget_id = 70500000, pos = { x = 1784.2, y = 237.5, z = -1119.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2511 },
	{ config_id = 2514, gadget_id = 70500000, pos = { x = 1783.4, y = 237.7, z = -1117.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2511 },
	{ config_id = 2515, gadget_id = 70500000, pos = { x = 1813.0, y = 231.6, z = -1119.4 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 2516, gadget_id = 70500000, pos = { x = 1822.0, y = 234.3, z = -1131.2 }, rot = { x = 337.7, y = 268.4, z = 341.6 }, level = 1, point_type = 1001 },
	{ config_id = 2517, gadget_id = 70500000, pos = { x = 1823.3, y = 234.0, z = -1131.8 }, rot = { x = 337.7, y = 268.4, z = 343.8 }, level = 1, point_type = 1001 },
	{ config_id = 2518, gadget_id = 70500000, pos = { x = 1833.1, y = 232.1, z = -1141.4 }, rot = { x = 337.7, y = 268.4, z = 341.6 }, level = 1, point_type = 2001 },
	{ config_id = 2519, gadget_id = 70210011, pos = { x = 1803.9, y = 241.0, z = -1196.4 }, rot = { x = 15.3, y = 101.8, z = 0.4 }, level = 1, chest_drop_id = 403301, isOneoff = true, persistent = true },
	{ config_id = 2520, gadget_id = 70500000, pos = { x = 1786.0, y = 246.5, z = -1151.8 }, rot = { x = 0.0, y = 17.7, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2521, gadget_id = 70500000, pos = { x = 1785.9, y = 246.1, z = -1182.2 }, rot = { x = 0.0, y = 17.7, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2522, gadget_id = 70500000, pos = { x = 1770.9, y = 249.0, z = -1170.2 }, rot = { x = 0.0, y = 17.7, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2523, gadget_id = 70500000, pos = { x = 1755.4, y = 253.4, z = -1192.1 }, rot = { x = 0.0, y = 17.7, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2524, gadget_id = 70500000, pos = { x = 1743.0, y = 253.2, z = -1183.6 }, rot = { x = 0.0, y = 17.7, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2525, gadget_id = 70500000, pos = { x = 1705.5, y = 260.4, z = -1238.2 }, rot = { x = 0.0, y = 17.7, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2526, gadget_id = 70500000, pos = { x = 1725.9, y = 258.7, z = -1224.8 }, rot = { x = 0.0, y = 17.7, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2527, gadget_id = 70500000, pos = { x = 1711.3, y = 261.3, z = -1266.0 }, rot = { x = 0.0, y = 17.7, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2533, gadget_id = 70500000, pos = { x = 1703.3, y = 260.5, z = -1194.6 }, rot = { x = 337.7, y = 268.4, z = 343.8 }, level = 1, point_type = 1001 },
	{ config_id = 2534, gadget_id = 70500000, pos = { x = 1704.2, y = 260.8, z = -1192.1 }, rot = { x = 337.7, y = 268.4, z = 343.8 }, level = 1, point_type = 1001 },
	{ config_id = 2535, gadget_id = 70210011, pos = { x = 1679.4, y = 267.7, z = -1187.9 }, rot = { x = 345.8, y = 302.9, z = 354.2 }, level = 1, chest_drop_id = 403301, isOneoff = true, persistent = true },
	{ config_id = 2538, gadget_id = 70500000, pos = { x = 1769.7, y = 264.4, z = -1097.8 }, rot = { x = 0.0, y = 183.0, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 2539, gadget_id = 70500000, pos = { x = 1739.7, y = 255.7, z = -1142.7 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2001 },
	{ config_id = 2580, gadget_id = 70500000, pos = { x = 1561.6, y = 303.7, z = -1176.4 }, rot = { x = 0.0, y = 183.0, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 2589, gadget_id = 70210021, pos = { x = 1710.5, y = 262.3, z = -1274.1 }, rot = { x = 12.2, y = 100.8, z = 0.1 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true },
	{ config_id = 2590, gadget_id = 70210021, pos = { x = 1554.2, y = 294.7, z = -1190.2 }, rot = { x = 0.0, y = 324.2, z = 0.0 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true },
	{ config_id = 2685, gadget_id = 70500000, pos = { x = 1992.7, y = 204.7, z = -1125.7 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2004 },
	{ config_id = 2689, gadget_id = 70500000, pos = { x = 1683.2, y = 242.0, z = -1336.2 }, rot = { x = 346.8, y = 41.4, z = 337.3 }, level = 1, point_type = 1001 },
	{ config_id = 2690, gadget_id = 70500000, pos = { x = 1706.2, y = 232.6, z = -1343.0 }, rot = { x = 337.7, y = 268.4, z = 7.0 }, level = 1, point_type = 1001 },
	{ config_id = 2754, gadget_id = 70290001, pos = { x = 1666.5, y = 245.1, z = -1334.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2755, gadget_id = 70500000, pos = { x = 1666.5, y = 245.7, z = -1333.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2754 },
	{ config_id = 2756, gadget_id = 70500000, pos = { x = 1666.4, y = 245.9, z = -1334.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2754 },
	{ config_id = 2757, gadget_id = 70500000, pos = { x = 1666.7, y = 246.4, z = -1334.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 2754 },
	{ config_id = 2915, gadget_id = 70500000, pos = { x = 1644.7, y = 273.4, z = -1279.4 }, rot = { x = 0.0, y = 183.0, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 2916, gadget_id = 70500000, pos = { x = 1667.5, y = 267.4, z = -1176.5 }, rot = { x = 0.0, y = 183.0, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true },
	{ config_id = 2953, gadget_id = 70500000, pos = { x = 2024.7, y = 201.3, z = -1622.9 }, rot = { x = 338.6, y = 17.7, z = 5.2 }, level = 1, point_type = 1001 },
	{ config_id = 2954, gadget_id = 70500000, pos = { x = 2026.4, y = 200.0, z = -1628.0 }, rot = { x = 338.6, y = 17.7, z = 5.2 }, level = 1, point_type = 1001 },
	{ config_id = 2979, gadget_id = 70210021, pos = { x = 1974.3, y = 236.9, z = -1534.2 }, rot = { x = 0.8, y = 50.7, z = 358.4 }, level = 1, chest_drop_id = 403321, isOneoff = true, persistent = true },
	{ config_id = 2993, gadget_id = 70500000, pos = { x = 1662.4, y = 262.3, z = -1214.0 }, rot = { x = 0.0, y = 217.9, z = 0.0 }, level = 1, point_type = 1003 },
	{ config_id = 2994, gadget_id = 70500000, pos = { x = 1660.2, y = 255.4, z = -1219.4 }, rot = { x = 0.0, y = 17.7, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2995, gadget_id = 70500000, pos = { x = 1659.7, y = 255.2, z = -1220.6 }, rot = { x = 0.0, y = 17.7, z = 0.0 }, level = 1, point_type = 3007 },
	{ config_id = 2996, gadget_id = 70210021, pos = { x = 1662.5, y = 248.6, z = -1203.9 }, rot = { x = 0.6, y = 182.1, z = 1.7 }, level = 1, chest_drop_id = 403322, isOneoff = true, persistent = true },
	{ config_id = 3039, gadget_id = 70500000, pos = { x = 2193.4, y = 209.5, z = -1045.3 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 3040, gadget_id = 70500000, pos = { x = 2212.0, y = 208.1, z = -1112.9 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 3042, gadget_id = 70500000, pos = { x = 2169.0, y = 210.4, z = -1111.0 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 3044, gadget_id = 70500000, pos = { x = 2119.2, y = 209.8, z = -1064.0 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 3045, gadget_id = 70500000, pos = { x = 2117.6, y = 209.9, z = -1066.8 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 3046, gadget_id = 70500000, pos = { x = 2110.7, y = 207.6, z = -1055.4 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 3047, gadget_id = 70500000, pos = { x = 2162.4, y = 209.1, z = -1030.2 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 3048, gadget_id = 70500000, pos = { x = 2161.3, y = 209.0, z = -1027.7 }, rot = { x = 0.0, y = 183.8, z = 0.0 }, level = 1, point_type = 2002 },
	{ config_id = 3067, gadget_id = 70500000, pos = { x = 1945.6, y = 198.5, z = -1255.6 }, rot = { x = 0.0, y = 183.0, z = 0.0 }, level = 1, point_type = 4001001, isOneoff = true }
}

-- 区域
regions = {
	{ config_id = 227, shape = RegionShape.SPHERE, radius = 4.3, pos = { x = 1649.4, y = 276.0, z = -1282.3 } },
	{ config_id = 276, shape = RegionShape.SPHERE, radius = 5, pos = { x = 2035.5, y = 198.9, z = -1211.5 } }
}

-- 触发器
triggers = {
	{ name = "ENTER_REGION_227", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_227", action = "action_EVENT_ENTER_REGION_227" },
	{ name = "CLIENT_EXECUTE_276", event = EventType.EVENT_CLIENT_EXECUTE, source = "ChestStateChange", condition = "", action = "action_EVENT_CLIENT_EXECUTE_276", trigger_count = 0 }
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
		-- description = ,
		monsters = { 281, 282, 283, 284, 285, 291, 292, 293, 296, 326, 327, 328, 329, 330, 331, 334, 336, 338, 340, 343, 344, 345, 346, 347, 348, 358, 376, 403, 404, 405, 408, 409, 412, 413, 414, 455, 456, 472, 491, 492, 493, 494, 495, 496, 497, 498, 499, 565, 566, 567, 569, 571, 572, 574, 575, 687, 688, 689, 710, 711, 712, 740, 741, 742, 747, 748, 749, 750, 751, 752, 761, 803, 810, 811, 817, 821, 822, 830, 842, 846, 847, 1035, 1036, 1037, 1038, 1067, 1068, 1069, 1138, 1139, 1140, 1141, 1142, 1143, 1144, 1145, 1230, 1231, 1232 },
		gadgets = { 1675, 1676, 1677, 1678, 1723, 1730, 1731, 1754, 1807, 1808, 1930, 1954, 2033, 2034, 2035, 2038, 2041, 2049, 2050, 2061, 2062, 2063, 2073, 2075, 2079, 2080, 2081, 2085, 2092, 2236, 2269, 2270, 2271, 2272, 2275, 2277, 2278, 2280, 2281, 2282, 2283, 2367, 2368, 2375, 2376, 2391, 2392, 2393, 2404, 2405, 2406, 2407, 2408, 2409, 2410, 2411, 2502, 2503, 2504, 2505, 2506, 2507, 2508, 2509, 2510, 2511, 2512, 2513, 2514, 2515, 2516, 2517, 2518, 2519, 2520, 2521, 2522, 2523, 2524, 2525, 2526, 2527, 2533, 2534, 2535, 2538, 2539, 2580, 2589, 2590, 2685, 2689, 2690, 2754, 2755, 2756, 2757, 2915, 2916, 2953, 2954, 2979, 2993, 2994, 2995, 2996, 3039, 3040, 3042, 3044, 3045, 3046, 3047, 3048, 3067 },
		regions = { 227, 276 },
		triggers = { "ENTER_REGION_227", "CLIENT_EXECUTE_276" },
		rand_weight = 100
	}
}

--================================================================
-- 
-- 触发器
-- 
--================================================================

-- 触发条件
function condition_EVENT_ENTER_REGION_227(context, evt)
	if evt.param1 ~= 227 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_227(context, evt)
	-- 创建id为2537的gadget
	if 0 ~= ScriptLib.CreateGadget(context, { config_id = 2537 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件

-- 触发操作
function action_EVENT_CLIENT_EXECUTE_276(context, evt)
	if evt.param1 == 0 then
		local this_chest = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		local this_group = ScriptLib.GetContextGroupId(context)
		ScriptLib.SetGroupGadgetStateByConfigId(context, this_group, this_chest, GadgetState.Default)
		return 0
	end
end
