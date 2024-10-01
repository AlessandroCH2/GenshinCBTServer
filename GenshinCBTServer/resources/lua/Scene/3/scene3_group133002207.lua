--================================================================
-- 
-- 配置
-- 
--================================================================

-- 怪物
monsters = {
	{ config_id = 609, monster_id = 20011201, pos = { x = 1793.7, y = 246.2, z = -522.9 }, rot = { x = 0.0, y = 128.6, z = 0.0 }, level = 9, drop_id = 100011 },
	{ config_id = 610, monster_id = 20011201, pos = { x = 1799.4, y = 246.8, z = -522.3 }, rot = { x = 0.0, y = 181.1, z = 0.0 }, level = 9, drop_id = 100011 },
	{ config_id = 613, monster_id = 20010801, pos = { x = 1983.0, y = 219.3, z = -541.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303042 },
	{ config_id = 614, monster_id = 20010801, pos = { x = 1984.6, y = 219.3, z = -540.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303042 },
	{ config_id = 615, monster_id = 20010501, pos = { x = 1957.0, y = 231.5, z = -409.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 9, drop_id = 303042 },
	{ config_id = 616, monster_id = 20010501, pos = { x = 1958.4, y = 231.5, z = -411.1 }, rot = { x = 0.0, y = 124.3, z = 0.0 }, level = 9, drop_id = 303042 },
	{ config_id = 679, monster_id = 28040103, pos = { x = 1955.3, y = 210.5, z = -900.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 },
	{ config_id = 680, monster_id = 28040102, pos = { x = 1952.9, y = 210.5, z = -897.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 0 }
}

-- NPC
npcs = {
}

-- 装置
gadgets = {
	{ config_id = 1538, gadget_id = 70290009, pos = { x = 1796.9, y = 246.5, z = -523.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1539, gadget_id = 70500000, pos = { x = 1796.9, y = 246.5, z = -523.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3005, owner = 1538 },
	{ config_id = 1544, gadget_id = 70290008, pos = { x = 1788.8, y = 219.0, z = -462.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1545, gadget_id = 70500000, pos = { x = 1788.8, y = 219.0, z = -462.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3008, owner = 1544 },
	{ config_id = 1564, gadget_id = 70290008, pos = { x = 1991.0, y = 219.3, z = -545.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1565, gadget_id = 70500000, pos = { x = 1991.0, y = 219.3, z = -545.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3008, owner = 1564 },
	{ config_id = 1566, gadget_id = 70290010, pos = { x = 1957.1, y = 231.5, z = -410.8 }, rot = { x = 0.0, y = 39.1, z = 1.0 }, level = 1 },
	{ config_id = 1567, gadget_id = 70500000, pos = { x = 1957.1, y = 231.5, z = -410.8 }, rot = { x = 0.0, y = 39.1, z = 1.0 }, level = 1, point_type = 3006, owner = 1566 },
	{ config_id = 1611, gadget_id = 70290010, pos = { x = 1997.3, y = 216.5, z = -991.7 }, rot = { x = 0.0, y = 0.0, z = 345.0 }, level = 1 },
	{ config_id = 1612, gadget_id = 70500000, pos = { x = 1997.3, y = 216.5, z = -991.7 }, rot = { x = 0.0, y = 0.0, z = 345.0 }, level = 1, point_type = 3006, owner = 1611 },
	{ config_id = 1615, gadget_id = 70290010, pos = { x = 1693.7, y = 256.8, z = -724.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1616, gadget_id = 70500000, pos = { x = 1693.7, y = 256.8, z = -724.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3006, owner = 1615 },
	{ config_id = 1617, gadget_id = 70290009, pos = { x = 1697.9, y = 256.3, z = -675.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1618, gadget_id = 70500000, pos = { x = 1697.9, y = 256.3, z = -675.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3005, owner = 1617 },
	{ config_id = 1651, gadget_id = 70290001, pos = { x = 1812.5, y = 239.4, z = -757.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1652, gadget_id = 70500000, pos = { x = 1812.5, y = 239.9, z = -757.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1651 },
	{ config_id = 1653, gadget_id = 70500000, pos = { x = 1812.4, y = 240.2, z = -758.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1651 },
	{ config_id = 1654, gadget_id = 70500000, pos = { x = 1812.8, y = 240.6, z = -757.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1651 },
	{ config_id = 1655, gadget_id = 70290001, pos = { x = 1738.5, y = 246.3, z = -715.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1656, gadget_id = 70500000, pos = { x = 1738.5, y = 246.9, z = -715.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1655 },
	{ config_id = 1657, gadget_id = 70500000, pos = { x = 1738.4, y = 247.2, z = -715.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1655 },
	{ config_id = 1658, gadget_id = 70500000, pos = { x = 1738.7, y = 247.6, z = -715.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1655 },
	{ config_id = 1673, gadget_id = 70290001, pos = { x = 1676.1, y = 202.8, z = -347.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1674, gadget_id = 70500000, pos = { x = 1676.1, y = 203.4, z = -347.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1673 },
	{ config_id = 1675, gadget_id = 70500000, pos = { x = 1676.0, y = 203.7, z = -348.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1673 },
	{ config_id = 1676, gadget_id = 70500000, pos = { x = 1676.4, y = 204.1, z = -348.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1673 },
	{ config_id = 1677, gadget_id = 70290001, pos = { x = 1605.5, y = 201.8, z = -428.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1678, gadget_id = 70500000, pos = { x = 1605.5, y = 202.4, z = -427.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1677 },
	{ config_id = 1679, gadget_id = 70500000, pos = { x = 1605.4, y = 202.7, z = -428.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1677 },
	{ config_id = 1680, gadget_id = 70500000, pos = { x = 1605.7, y = 203.1, z = -428.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1677 },
	{ config_id = 1694, gadget_id = 70290010, pos = { x = 1582.0, y = 204.3, z = -454.9 }, rot = { x = 13.2, y = 357.3, z = 4.8 }, level = 1 },
	{ config_id = 1695, gadget_id = 70500000, pos = { x = 1582.0, y = 204.3, z = -454.9 }, rot = { x = 13.2, y = 357.3, z = 4.8 }, level = 1, point_type = 3006, owner = 1694 },
	{ config_id = 1698, gadget_id = 70290010, pos = { x = 1581.7, y = 209.6, z = -478.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1699, gadget_id = 70500000, pos = { x = 1581.7, y = 209.6, z = -478.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3006, owner = 1698 },
	{ config_id = 1708, gadget_id = 70290009, pos = { x = 1752.7, y = 240.7, z = -626.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1709, gadget_id = 70500000, pos = { x = 1752.7, y = 240.7, z = -626.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3005, owner = 1708 },
	{ config_id = 1710, gadget_id = 70290008, pos = { x = 1733.6, y = 252.2, z = -694.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1711, gadget_id = 70500000, pos = { x = 1733.6, y = 252.2, z = -694.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3008, owner = 1710 },
	{ config_id = 1712, gadget_id = 70290008, pos = { x = 1809.0, y = 250.2, z = -693.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1713, gadget_id = 70500000, pos = { x = 1809.0, y = 250.2, z = -693.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3008, owner = 1712 },
	{ config_id = 1718, gadget_id = 70290001, pos = { x = 1915.5, y = 246.6, z = -621.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1719, gadget_id = 70500000, pos = { x = 1915.5, y = 247.2, z = -621.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1718 },
	{ config_id = 1720, gadget_id = 70500000, pos = { x = 1915.4, y = 247.4, z = -621.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1718 },
	{ config_id = 1721, gadget_id = 70500000, pos = { x = 1915.8, y = 247.9, z = -621.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1718 },
	{ config_id = 1722, gadget_id = 70290010, pos = { x = 1922.0, y = 219.7, z = -637.0 }, rot = { x = 1.9, y = 2.4, z = 339.1 }, level = 1 },
	{ config_id = 1723, gadget_id = 70500000, pos = { x = 1922.0, y = 219.7, z = -637.0 }, rot = { x = 1.9, y = 2.4, z = 339.1 }, level = 1, point_type = 3006, owner = 1722 },
	{ config_id = 1724, gadget_id = 70290009, pos = { x = 1958.8, y = 246.0, z = -357.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1725, gadget_id = 70500000, pos = { x = 1958.8, y = 246.0, z = -357.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3005, owner = 1724 },
	{ config_id = 1730, gadget_id = 70290008, pos = { x = 1973.6, y = 253.4, z = -473.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1731, gadget_id = 70500000, pos = { x = 1973.6, y = 253.4, z = -473.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3008, owner = 1730 },
	{ config_id = 1877, gadget_id = 70290001, pos = { x = 1977.4, y = 225.7, z = -674.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1878, gadget_id = 70500000, pos = { x = 1977.4, y = 226.2, z = -674.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1877 },
	{ config_id = 1879, gadget_id = 70500000, pos = { x = 1977.4, y = 226.5, z = -674.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1877 },
	{ config_id = 1880, gadget_id = 70500000, pos = { x = 1977.7, y = 226.9, z = -674.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3002, owner = 1877 },
	{ config_id = 1881, gadget_id = 70290009, pos = { x = 2031.8, y = 231.0, z = -675.9 }, rot = { x = 352.2, y = 0.0, z = 7.6 }, level = 1 },
	{ config_id = 1882, gadget_id = 70500000, pos = { x = 2031.8, y = 231.0, z = -675.9 }, rot = { x = 352.2, y = 0.0, z = 7.6 }, level = 1, point_type = 3005, owner = 1881 },
	{ config_id = 1974, gadget_id = 70290004, pos = { x = 2131.6, y = 220.3, z = -616.0 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1975, gadget_id = 70500000, pos = { x = 2130.4, y = 227.3, z = -615.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 1974 },
	{ config_id = 1976, gadget_id = 70500000, pos = { x = 2130.4, y = 227.3, z = -615.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3003, owner = 1974 },
	{ config_id = 1977, gadget_id = 70290002, pos = { x = 2023.5, y = 213.7, z = -765.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1978, gadget_id = 70500000, pos = { x = 2022.4, y = 215.3, z = -764.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 1977 },
	{ config_id = 1979, gadget_id = 70500000, pos = { x = 2024.4, y = 216.4, z = -766.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 1977 },
	{ config_id = 1980, gadget_id = 70500000, pos = { x = 2023.5, y = 216.6, z = -764.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 1977 },
	{ config_id = 1981, gadget_id = 70290002, pos = { x = 2088.1, y = 228.5, z = -632.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 1982, gadget_id = 70500000, pos = { x = 2087.1, y = 230.1, z = -631.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 1981 },
	{ config_id = 1983, gadget_id = 70500000, pos = { x = 2089.0, y = 231.1, z = -633.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 1981 },
	{ config_id = 1984, gadget_id = 70500000, pos = { x = 2088.2, y = 231.4, z = -631.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 1981 },
	{ config_id = 2059, gadget_id = 70290009, pos = { x = 2056.7, y = 243.7, z = -613.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2060, gadget_id = 70500000, pos = { x = 2056.7, y = 243.7, z = -613.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3005, owner = 2059 },
	{ config_id = 2061, gadget_id = 70290002, pos = { x = 2006.3, y = 260.0, z = -361.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2062, gadget_id = 70500000, pos = { x = 2005.2, y = 261.6, z = -361.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2061 },
	{ config_id = 2063, gadget_id = 70500000, pos = { x = 2007.2, y = 262.6, z = -362.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2061 },
	{ config_id = 2064, gadget_id = 70500000, pos = { x = 2006.3, y = 262.9, z = -360.5 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2061 },
	{ config_id = 2065, gadget_id = 70290002, pos = { x = 2050.4, y = 265.8, z = -375.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2066, gadget_id = 70500000, pos = { x = 2049.4, y = 267.5, z = -374.3 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2065 },
	{ config_id = 2067, gadget_id = 70500000, pos = { x = 2051.3, y = 268.5, z = -376.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2065 },
	{ config_id = 2068, gadget_id = 70500000, pos = { x = 2050.5, y = 268.7, z = -373.7 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2065 },
	{ config_id = 2069, gadget_id = 70290002, pos = { x = 2031.3, y = 259.3, z = -391.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2070, gadget_id = 70500000, pos = { x = 2030.2, y = 260.9, z = -390.4 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2069 },
	{ config_id = 2071, gadget_id = 70500000, pos = { x = 2032.2, y = 261.9, z = -392.1 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2069 },
	{ config_id = 2072, gadget_id = 70500000, pos = { x = 2031.4, y = 262.2, z = -389.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3001, owner = 2069 },
	{ config_id = 2096, gadget_id = 70290011, pos = { x = 1928.6, y = 250.7, z = -446.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2097, gadget_id = 70500000, pos = { x = 1928.6, y = 250.7, z = -446.9 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3009, owner = 2096 },
	{ config_id = 2098, gadget_id = 70290011, pos = { x = 1930.0, y = 236.0, z = -959.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2099, gadget_id = 70500000, pos = { x = 1930.0, y = 236.0, z = -959.8 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3009, owner = 2098 },
	{ config_id = 2100, gadget_id = 70290011, pos = { x = 1697.0, y = 231.4, z = -534.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2101, gadget_id = 70500000, pos = { x = 1697.0, y = 231.4, z = -534.2 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3009, owner = 2100 },
	{ config_id = 2102, gadget_id = 70290011, pos = { x = 1695.4, y = 231.7, z = -533.8 }, rot = { x = 0.0, y = 333.2, z = 0.0 }, level = 1 },
	{ config_id = 2103, gadget_id = 70500000, pos = { x = 1695.4, y = 231.7, z = -533.8 }, rot = { x = 0.0, y = 333.2, z = 0.0 }, level = 1, point_type = 3009, owner = 2102 },
	{ config_id = 2122, gadget_id = 70290011, pos = { x = 1933.8, y = 216.1, z = -665.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2123, gadget_id = 70500000, pos = { x = 1933.8, y = 216.1, z = -665.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3009, owner = 2122 },
	{ config_id = 2126, gadget_id = 70290011, pos = { x = 1967.5, y = 237.9, z = -388.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1 },
	{ config_id = 2127, gadget_id = 70500000, pos = { x = 1967.5, y = 237.9, z = -388.6 }, rot = { x = 0.0, y = 0.0, z = 0.0 }, level = 1, point_type = 3009, owner = 2126 }
}

-- 区域
regions = {
	{ config_id = 209, shape = RegionShape.SPHERE, radius = 5, pos = { x = 1843.5, y = 241.3, z = -479.1 } },
	{ config_id = 214, shape = RegionShape.SPHERE, radius = 3.4, pos = { x = 1796.7, y = 246.5, z = -523.7 } },
	{ config_id = 224, shape = RegionShape.SPHERE, radius = 2, pos = { x = 1957.2, y = 231.6, z = -410.4 } }
}

-- 触发器
triggers = {
	{ name = "CLIENT_EXECUTE_209", event = EventType.EVENT_CLIENT_EXECUTE, source = "ElementFlora", condition = "", action = "action_EVENT_CLIENT_EXECUTE_209", trigger_count = 0 },
	{ name = "ENTER_REGION_214", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_214", action = "action_EVENT_ENTER_REGION_214" },
	{ name = "ENTER_REGION_224", event = EventType.EVENT_ENTER_REGION, source = "", condition = "condition_EVENT_ENTER_REGION_224", action = "action_EVENT_ENTER_REGION_224" }
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
		monsters = { 609, 610, 613, 614, 679, 680 },
		gadgets = { 1538, 1539, 1544, 1545, 1564, 1565, 1566, 1567, 1611, 1612, 1615, 1616, 1617, 1618, 1651, 1652, 1653, 1654, 1655, 1656, 1657, 1658, 1673, 1674, 1675, 1676, 1677, 1678, 1679, 1680, 1694, 1695, 1698, 1699, 1708, 1709, 1710, 1711, 1712, 1713, 1718, 1719, 1720, 1721, 1722, 1723, 1724, 1725, 1730, 1731, 1877, 1878, 1879, 1880, 1881, 1882, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 2059, 2060, 2061, 2062, 2063, 2064, 2065, 2066, 2067, 2068, 2069, 2070, 2071, 2072, 2096, 2097, 2098, 2099, 2100, 2101, 2102, 2103, 2122, 2123, 2126, 2127 },
		regions = { 209, 214, 224 },
		triggers = { "CLIENT_EXECUTE_209", "ENTER_REGION_214", "ENTER_REGION_224" },
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
function action_EVENT_CLIENT_EXECUTE_209(context, evt)
	-- 针对groupid为 133002207 中该config对应的物件进行状态改变操作
	local this_gadget = ScriptLib.GetGadgetConfigId(context, { gadget_eid = evt.source_eid })
		--ScriptLib.PrintLog("config_id="..this_gadget)
	
	  ScriptLib.SetGadgetEnableInteract(context, 133002207, this_gadget, true)
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_214(context, evt)
	if evt.param1 ~= 214 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_214(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 609, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 610, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end

-- 触发条件
function condition_EVENT_ENTER_REGION_224(context, evt)
	if evt.param1 ~= 224 then return false end
	
	-- 判断角色数量不少于1
	if ScriptLib.GetRegionEntityCount(context, { region_eid = evt.source_eid, entity_type = EntityType.AVATAR }) < 1 then
		return false
	end
	
	return true
end

-- 触发操作
function action_EVENT_ENTER_REGION_224(context, evt)
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 616, delay_time = 0 }) then
	  return -1
	end
	
	-- 延迟0秒刷怪
	if 0 ~= ScriptLib.CreateMonster(context, { config_id = 615, delay_time = 0 }) then
	  return -1
	end
	
	return 0
end
