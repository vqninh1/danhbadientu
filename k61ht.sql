-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 06, 2021 lúc 05:19 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `k61ht`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_donvi`
--

CREATE TABLE `db_donvi` (
  `madv` int(10) UNSIGNED NOT NULL,
  `tendv` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diachi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dienthoai` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `madv_cha` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_donvi`
--

INSERT INTO `db_donvi` (`madv`, `tendv`, `diachi`, `email`, `website`, `dienthoai`, `madv_cha`) VALUES
(7, 'Khoa CNTT', 'Nhà C1, Trường ĐHTL', 'vpkcntt@tlu.edu.vn', 'cse.tlu.edu.vn', '02433555599', NULL),
(8, 'Khoa Kinh Tế', 'Nhà B1, Trường ĐHTL', 'vpkkt@tlu.edu.vn', 'kt.tlu.edu.vn', '02433555599', NULL),
(9, 'Khoa Cơ khí', 'Nhà B2, Trường ĐHTL', 'vpkck@tlu.edu.vn', 'cke.tlu.edu.vn', '02433555599', NULL),
(10, 'Bộ môn HTT', 'Nhà C1, Trường ĐHTL', 'vpkcntt@tlu.edu.vn', 'cse.tlu.edu.vn', '02433555599', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_nguoidung`
--

CREATE TABLE `db_nguoidung` (
  `mand` int(3) UNSIGNED NOT NULL,
  `tendangnhap` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matkhau` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `db_nhanvien`
--

CREATE TABLE `db_nhanvien` (
  `manv` int(10) UNSIGNED NOT NULL,
  `tennv` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chucvu` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mayban` varchar(13) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sodidong` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `madv` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `db_nhanvien`
--

INSERT INTO `db_nhanvien` (`manv`, `tennv`, `chucvu`, `mayban`, `email`, `sodidong`, `madv`) VALUES
(1, 'Kiều Tuấn Dũng', 'Giảng viên', NULL, 'dungkt@tlu.edu.vn', '0868600513', 10),
(2, 'Nguyễn Thanh Tùng', 'Trưởng khoa', NULL, 'tungnt@tlu.edu.vn', '0913008694', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `userid` mediumint(6) UNSIGNED NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(40) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` char(60) NOT NULL,
  `registration_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_level` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`userid`, `first_name`, `last_name`, `email`, `password`, `registration_date`, `user_level`, `status`) VALUES
(20, 'Mike', 'Rosoft', 'miker@myisp.com', '$2y$10$VWtLxXTE1ohO1pQJ87tnGeBB1MNfkQ3V87/HIGdanmKhqflRIQEH2', '2018-05-17 17:33:49', 0, 0),
(21, 'Olive', 'Branch', 'obranch@myisp.com.uk', '$2y$10$aAdvrMiVcEFqRn9ISLoy6uEwS.FesiTQZ.IdsHGc/xSi2x.wkuaZ2', '2018-05-17 17:35:21', 0, 0),
(22, 'Frank', 'Insence', 'finsence@myisp.net', '$2y$10$0WbSaI3w.9KjkE28L7ZeN.jEPKvsPLIwRg01M6XkRtWvZkOWaT3R6', '2018-05-17 17:36:46', 0, 0),
(23, 'Annie', 'Versary', 'aversary@myisp.com', '$2y$10$HpUHsg0yoIy08d4./p/tM.ZLOnZ3RLGTb7YjqMEuzwb2yBpEguB9O', '2018-05-17 17:37:47', 0, 0),
(24, 'Terry', 'Fide', 'tfide@myisp.de', '$2y$10$Gh0nTJPXxUkZAKCkOeVC8O8jv3rJ6ZLXrEJ8szvgqDgBxb1F8uVSa', '2018-05-17 17:54:39', 0, 0),
(25, 'Rose', 'Bush', 'rbush@myisp.co.uk', '$2y$10$cASUiiV3w3cKWoaxH0tfmeV7IwXy2fUNJT6lQIdBbUZePmtPY/Wo2', '2018-05-17 17:55:38', 0, 0),
(26, 'James', 'Smith', 'jsmith@myisp.co.uk', '$2y$10$pp/Gv2tvaTUlfPKVRb/tSu/25N7mhvj7h2ybRANEvS.I2xg/99wM6', '2018-05-17 17:57:11', 0, 0),
(27, 'Jack', 'Smith', 'jsmith@outcook.com', '$2y$10$GXDlk.GkgdWmPRTUDCb.F.kqD.8dwkH93s0p/g1f0fnK27Z849Ry2', '2018-05-17 17:58:14', 1, 0),
(30, 'long', 'hoang', 'ngh1@gmail.com', '$2y$10$BYSwNY1w.bQitazhDnYBoefIx64eddZWNXvQYnfWtegrxV6FJnG7K', '2021-09-30 12:00:52', 0, 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `db_donvi`
--
ALTER TABLE `db_donvi`
  ADD PRIMARY KEY (`madv`),
  ADD KEY `madv_cha` (`madv_cha`);

--
-- Chỉ mục cho bảng `db_nguoidung`
--
ALTER TABLE `db_nguoidung`
  ADD PRIMARY KEY (`mand`);

--
-- Chỉ mục cho bảng `db_nhanvien`
--
ALTER TABLE `db_nhanvien`
  ADD PRIMARY KEY (`manv`),
  ADD KEY `madv` (`madv`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `db_donvi`
--
ALTER TABLE `db_donvi`
  MODIFY `madv` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `db_nguoidung`
--
ALTER TABLE `db_nguoidung`
  MODIFY `mand` int(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `db_nhanvien`
--
ALTER TABLE `db_nhanvien`
  MODIFY `manv` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `userid` mediumint(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `db_donvi`
--
ALTER TABLE `db_donvi`
  ADD CONSTRAINT `db_donvi_ibfk_1` FOREIGN KEY (`madv_cha`) REFERENCES `db_donvi` (`madv`);

--
-- Các ràng buộc cho bảng `db_nhanvien`
--
ALTER TABLE `db_nhanvien`
  ADD CONSTRAINT `db_nhanvien_ibfk_1` FOREIGN KEY (`madv`) REFERENCES `db_donvi` (`madv`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
