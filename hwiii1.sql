--此為表格檔案--
-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 
-- 伺服器版本： 10.3.16-MariaDB
-- PHP 版本： 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `iii`
--

-- --------------------------------------------------------

--
-- 資料表結構 `供應商`
--

CREATE TABLE `供應商` (
  `id` int(11) NOT NULL,
  `名稱` varchar(10) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `電話` varchar(11) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `地址` varchar(100) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_mysql561_ci;

--
-- 傾印資料表的資料 `供應商`
--

INSERT INTO `供應商` (`id`, `名稱`, `電話`, `地址`) VALUES
(1, 'GOGO', '22613', 'TW');

-- --------------------------------------------------------

--
-- 資料表結構 `商品`
--

CREATE TABLE `商品` (
  `id` int(11) NOT NULL,
  `編號` varchar(10) COLLATE utf8_croatian_mysql561_ci NOT NULL,
  `名稱` varchar(10) COLLATE utf8_croatian_mysql561_ci NOT NULL,
  `建議售價` int(100) NOT NULL,
  `供應商電話` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_mysql561_ci;

--
-- 傾印資料表的資料 `商品`
--

INSERT INTO `商品` (`id`, `編號`, `名稱`, `建議售價`, `供應商電話`) VALUES
(2, '', 'BIGONE', 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `客戶資料表`
--

CREATE TABLE `客戶資料表` (
  `id` int(11) NOT NULL,
  `姓名` varchar(10) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `電話` int(11) DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_croatian_mysql561_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_mysql561_ci;

--
-- 傾印資料表的資料 `客戶資料表`
--

INSERT INTO `客戶資料表` (`id`, `姓名`, `電話`, `email`, `address`) VALUES
(4, 'WSP', 123456, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `訂單`
--

CREATE TABLE `訂單` (
  `id` int(100) NOT NULL,
  `編號` varchar(100) COLLATE utf8_croatian_mysql561_ci NOT NULL,
  `客戶` varchar(10) COLLATE utf8_croatian_mysql561_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_mysql561_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `訂單細項`
--

CREATE TABLE `訂單細項` (
  `id` int(100) NOT NULL,
  `訂單編號` varchar(100) COLLATE utf8_croatian_mysql561_ci NOT NULL,
  `商品編號` varchar(20) COLLATE utf8_croatian_mysql561_ci NOT NULL,
  `實際售價` int(100) NOT NULL,
  `數量` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_croatian_mysql561_ci;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `供應商`
--
ALTER TABLE `供應商`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `電話` (`電話`);

--
-- 資料表索引 `商品`
--
ALTER TABLE `商品`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `編號` (`編號`),
  ADD KEY `供應商` (`供應商電話`);

--
-- 資料表索引 `客戶資料表`
--
ALTER TABLE `客戶資料表`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `電話` (`電話`);

--
-- 資料表索引 `訂單`
--
ALTER TABLE `訂單`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `編號` (`編號`);

--
-- 資料表索引 `訂單細項`
--
ALTER TABLE `訂單細項`
  ADD PRIMARY KEY (`id`),
  ADD KEY `編號` (`訂單編號`),
  ADD KEY `商品` (`商品編號`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `供應商`
--
ALTER TABLE `供應商`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `商品`
--
ALTER TABLE `商品`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `客戶資料表`
--
ALTER TABLE `客戶資料表`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `訂單`
--
ALTER TABLE `訂單`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `訂單細項`
--
ALTER TABLE `訂單細項`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `訂單細項`
--
ALTER TABLE `訂單細項`
  ADD CONSTRAINT `訂單細項_ibfk_1` FOREIGN KEY (`訂單編號`) REFERENCES `訂單` (`編號`),
  ADD CONSTRAINT `訂單細項_ibfk_2` FOREIGN KEY (`商品編號`) REFERENCES `商品` (`編號`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
