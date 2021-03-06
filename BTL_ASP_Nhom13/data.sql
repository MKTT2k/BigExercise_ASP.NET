USE [master]
GO
/****** Object:  Database [HaiSanDB]    Script Date: 1/7/2022 9:25:41 AM ******/
CREATE DATABASE [HaiSanDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HaiSanDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HaiSanDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HaiSanDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HaiSanDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HaiSanDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HaiSanDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HaiSanDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HaiSanDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HaiSanDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HaiSanDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HaiSanDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HaiSanDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HaiSanDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HaiSanDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HaiSanDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HaiSanDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HaiSanDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HaiSanDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HaiSanDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HaiSanDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HaiSanDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HaiSanDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HaiSanDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HaiSanDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HaiSanDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HaiSanDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HaiSanDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HaiSanDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HaiSanDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HaiSanDB] SET  MULTI_USER 
GO
ALTER DATABASE [HaiSanDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HaiSanDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HaiSanDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HaiSanDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HaiSanDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HaiSanDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HaiSanDB] SET QUERY_STORE = OFF
GO
USE [HaiSanDB]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 1/7/2022 9:25:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[ID_DonHang] [int] NOT NULL,
	[ID_SanPham] [int] NOT NULL,
	[SoLuongMua] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[ID_DonHang] ASC,
	[ID_SanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 1/7/2022 9:25:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[ID_DanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[ID_DanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 1/7/2022 9:25:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[ID_DonHang] [int] IDENTITY(1,1) NOT NULL,
	[ID_TaiKhoan] [int] NOT NULL,
	[NguoiNhan] [nvarchar](200) NOT NULL,
	[SDTNhan] [char](10) NOT NULL,
	[EmailNhan] [varchar](200) NOT NULL,
	[DiaChiNhan] [nvarchar](500) NOT NULL,
	[GhiChu] [ntext] NULL,
	[PTThanhToan] [bit] NOT NULL,
	[NgayDat] [datetime] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[ID_DonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 1/7/2022 9:25:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[ID_SanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](100) NOT NULL,
	[HinhAnh] [text] NULL,
	[GiaGoc] [money] NOT NULL,
	[GiaBan] [money] NOT NULL,
	[MoTa] [ntext] NULL,
	[SoLuong] [int] NOT NULL,
	[ID_DanhMuc] [int] NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[ID_SanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 1/7/2022 9:25:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[ID_TaiKhoan] [int] IDENTITY(1,1) NOT NULL,
	[Email] [char](50) NOT NULL,
	[MatKhau] [char](50) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[SDT] [char](10) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[ID_TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinTuc_VaoBep]    Script Date: 1/7/2022 9:25:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc_VaoBep](
	[ID_TinTuc] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](100) NOT NULL,
	[HinhAnh] [text] NULL,
	[NgayTao] [datetime] NOT NULL,
	[NoiDung] [ntext] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_TinTuc_VaoBep] PRIMARY KEY CLUSTERED 
(
	[ID_TinTuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (5, 5, 10)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (5, 17, 5)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (5, 19, 2)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (6, 19, 3)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (6, 31, 1)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (6, 108, 3)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (6, 115, 6)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (6, 120, 1)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (7, 26, 2)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (7, 27, 3)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (7, 31, 1)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (7, 139, 3)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (8, 48, 2)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (8, 54, 1)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (8, 55, 1)
INSERT [dbo].[ChiTietDonHang] ([ID_DonHang], [ID_SanPham], [SoLuongMua]) VALUES (8, 59, 1)
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([ID_DanhMuc], [TenDanhMuc]) VALUES (2, N'Tôm')
INSERT [dbo].[DanhMuc] ([ID_DanhMuc], [TenDanhMuc]) VALUES (3, N'Cá tươi sống')
INSERT [dbo].[DanhMuc] ([ID_DanhMuc], [TenDanhMuc]) VALUES (4, N'Cua - Ghẹ')
INSERT [dbo].[DanhMuc] ([ID_DanhMuc], [TenDanhMuc]) VALUES (5, N'Ngao - Sò - Ốc')
INSERT [dbo].[DanhMuc] ([ID_DanhMuc], [TenDanhMuc]) VALUES (6, N'Mực')
INSERT [dbo].[DanhMuc] ([ID_DanhMuc], [TenDanhMuc]) VALUES (7, N'Hải sản nhập khẩu')
INSERT [dbo].[DanhMuc] ([ID_DanhMuc], [TenDanhMuc]) VALUES (8, N'Hải sản tiện lợi')
INSERT [dbo].[DanhMuc] ([ID_DanhMuc], [TenDanhMuc]) VALUES (9, N'Hải sản khô một nắng')
INSERT [dbo].[DanhMuc] ([ID_DanhMuc], [TenDanhMuc]) VALUES (10, N'Sản phẩm cao cấp')
INSERT [dbo].[DanhMuc] ([ID_DanhMuc], [TenDanhMuc]) VALUES (11, N'Hải sản trong ngày')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([ID_DonHang], [ID_TaiKhoan], [NguoiNhan], [SDTNhan], [EmailNhan], [DiaChiNhan], [GhiChu], [PTThanhToan], [NgayDat], [TrangThai]) VALUES (5, 7, N'Hoàng', N'0291546183', N'hoang@gmail.com', N'Thái Bình', N'Giao gấp ', 1, CAST(N'2022-01-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[DonHang] ([ID_DonHang], [ID_TaiKhoan], [NguoiNhan], [SDTNhan], [EmailNhan], [DiaChiNhan], [GhiChu], [PTThanhToan], [NgayDat], [TrangThai]) VALUES (6, 7, N'Huyền', N'0158602837', N'huyen@yahoo.com', N'Hà Nội', N'Nội Dung', 1, CAST(N'2022-01-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[DonHang] ([ID_DonHang], [ID_TaiKhoan], [NguoiNhan], [SDTNhan], [EmailNhan], [DiaChiNhan], [GhiChu], [PTThanhToan], [NgayDat], [TrangThai]) VALUES (7, 10, N'Cẩm Ly', N'0183502831', N'lieu@gmail.com', N'Hà Nội', N'Giao hàng trong ngày', 1, CAST(N'2022-01-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[DonHang] ([ID_DonHang], [ID_TaiKhoan], [NguoiNhan], [SDTNhan], [EmailNhan], [DiaChiNhan], [GhiChu], [PTThanhToan], [NgayDat], [TrangThai]) VALUES (8, 10, N'Hòa', N'0572837582', N'mktt@gmail.com', N'Bắc Ninh', N'gshgeh', 0, CAST(N'2022-01-07T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (5, N'Tôm Càng Xanh', N'tom-cang-xanh-hcm.jpg', 450000.0000, 450000.0000, N'Cung cấp tôm càng xanh sống đánh bắt tự nhiên hương vị đặc trưng không như tôm nuôi đầm. Hiếu Hải Sản bán trực tiếp tại HCM-Hà Nội. Áp dụng Freeship hải sản cho các khu vực nội thành. Tôm Càng Xanh sống còn bơi, thịt dai và ngọt. Chế biến dễ dàng với món lẩu tôm càng, tôm sống sốt thái, gỏi tôm càng...Bảng giá sizeSize: 13-15 con/Kg - 450 nghìn/Kg.Size: 8-10 con/Kg - 550 nghìn/Kg.Size: 5-7 con/Kg - 780 nghìn/Kg.', 143, 2)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (6, N'Tôm Tích', N'tom-tich-tom-tit-song.jpg', 950000.0000, 950000.0000, N'Tôm tích thiên nhiên sống, thịt ngon, ngọt, dai chắc, vừa đậm đà hương biển, khác xa với mùi vị của tôm sú, tôm hùm hay tôm đất. Hiếu Hải Sản có bán tôm tích trắng, tôm tít vàng và thịt tôm tích hấp chín. Hiếu Hải Sản bán trực tiếp tại HCM-Hà Nội. Áp dụng Freeship hải sản cho các khu vực nội thành.Quy cách: bảo quản sống băng máy oxy trước khia giao đến khách hàng.Bảng giá:Tôm tích trắng (Vũng Tàu - Phú Quốc)- 950.000đ/kg. Size từ 8 - 10 con/kg.- 1.600.000đ/kg. Size từ 4 - 6 con/kg.', 64, 2)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (17, N'Tôm Hùm Alaska Sống', N'tom-hum-alaska-tom-hum-canada.jpg', 1390000.0000, 1390000.0000, N'Tôm hùm Alaska, Canada hải sản nhập khẩu cao cấp. Hiếu Hải Sản bán trực tiếp tại HCM-Hà Nội. Áp dụng Freeship hải sản cho các khu vực nội thành.Xuất xứ: Công ty Clearwater Seafoods Limited, Canada.Quy cách: tôm hùm sống, giao hàng tận nơi, trọng lượng từ 1 - 4kg/con.Bảng GiáTôm hùm Alaska sống: 1.390.000 đ/kg.Tôm hùm Alaska tươi: 240.000đ/con trọng lượng 400gr ~ 450gr.Tôm hùm Alaska hấp chín: 260.000đ/con trọng lượng 400gr ~ 450gr.Chế biến: Ăn sống Sashimi, hấp, nướng, rang tỏi, rang muối,..', 173, 2)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (18, N'Tôm Hùm Bông Tươi', N'tom-hum-bong-hieu-hai-san.jpg', 700000.0000, 700000.0000, N'Quy cách: Tôm hùm bông ngộp oxy khi vận chuyển hoặc yếu trong hồ.Xuất xứ: Phú Yên - Nha Trang - Phan Thiết - Vũng Tàu.Giá bán:Tôm hùm bông tươi - đông lạnh - Size 1 con từ 500g-700g: 700.000 đ/kg - Size 1 con từ 700g-1kg: 750.000 đ/kg - Size 1 con từ 1 - 1,5kg: 800.000 đ/kg - Size 1 con 1,5kg-2kg: 900.000 đ/kg- Size 1 con trên 2kg: 1.000.000 đ/kgTôm hùm bông sống - Size 400g -500g: 1.150.000 VNĐ/kg- Size 500g -700g: 1.350.000 VNĐ/kg - Size 700g - 900g: 1.600.000 VNĐ/kg - Size 1-1,2kg: 1.850.000 VNĐ/kg - Size 2-4kg: 3.000.000 VNĐ/kgTôm hùm xanh - Baby sống-  Size 2 con/kg: 1.050.000 VNĐ/kg-  Size 3 con/kg: 950.000 VNĐ/kg-  Size 4 con/kg: 850.000 VNĐ/kgTôm hùm Canada sống- Size 1 con nặng từ 1-4kg: 950.000 VNĐ/kg', 24, 2)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (19, N'Tôm Hùm Xanh', N'tom-hum-xanh-song-tuoi.png', 1250000.0000, 1250000.0000, N'Tôm hùm xanh sống thịt chắc, dai, ngọt không chê vào đâu được. Mỗi con tôm trọng lượng từ 3-5 lạng.Xuất xứ: Nha Trang - Phan Thiết.Bảng giá size:size 3 con/kg - 1.350.000/kgsize 4-5 con/kg - 1.250.000/kg', 17, 2)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (24, N'Cá Bớp', N'ca-bop-bien.jpg', 310000.0000, 310000.0000, N'Xuất xứ: Phan Rang – Phan ThiếtQuy cách: cá bớp sống nguyên conTrọng lượng: 3-4kg/con', 32, 3)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (26, N'Cá Mặt Quỷ', N'ca-mat-quy-hieu-hai-san.jpg', 850000.0000, 850000.0000, N'Size 1–3kg/con - Giao sống tận nơi✓ Xuất xứ: Đảo Phú Quý - Côn Đảo✓ Chế biến: nướng muối ớt, hấp Hồng Kông, lẩu, nấu cháo…', 10, 3)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (27, N'Cá Bò Giáp', N'ca-bo-giap.jpg', 450000.0000, 450000.0000, N'Size 1–5 kg/con – Giao sống tận nơi✓ Xuất xứ: Nha Trang - Phú Quốc - Côn Đảo.✓ Món ngon: nướng muối ớt, om tiêu xanh, lẩu chua cay,..', 15, 3)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (28, N'Cá Mú Nghệ', N'ca-mu-nghe-hieu-hai-san.jpg', 400000.0000, 400000.0000, N'Size 10–30kg/con – Giao sống tận nơi✓ Xuất xứ: Côn Đảo✓ Món ngon: hấp Hồng Kông, um chua ngọt, fille nướng, rang muối, nấu lẩu,…', 9, 3)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (31, N'Cá Mú Đỏ', N'ca-mu-do-hai-san-tuoi-song.jpg', 1700000.0000, 1700000.0000, N'Size 1–5kg/con – Giao sống tận nơi✓ Xuất xứ: Côn Đảo - Đảo Phú Quý Phan Thiết.✓ Món ngon: hấp Hồng Kông, um chua ngọt, um bắp chuối, ăn sống, nấu lẩu,…', 3, 3)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (32, N'Cá Chim', N'ca-chim.jpg', 290000.0000, 290000.0000, N'Quy cách: Cá chim biển sống, trọng lượng từ 700g-1kg mỗi con.Xuất xứ: Vũng Tàu.Chế biến: nướng muối ớt hoặc chiên giòn sốt cà chua.', 15, 3)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (33, N'Cá Mú Cọp', N'ca-mu-cop-song-hhs.jpg', 480000.0000, 480000.0000, N'Cá mú cọp nặng từ 1–3kg/con – Giao sống tận nơi✓ Xuất xứ: Nha Trang - Côn Đảo✓ Món ngon: hấp Hồng Kông, um chua ngọt, fille nướng, rang muối, nấu lẩu,…', 24, 3)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (34, N'Cá Chình Biển', N'ca-chinh-bien-song-hieu-hai-san.jpg', 240000.0000, 240000.0000, N'Cá Chình bông - nhập từ Côn Đảo, Nha Trang nhận giao sống tận nơi TPHCMQuy cách: cá Chình sống trọng lượng 1,5-10kg/con.Chế biến: Nướng muối ớt, nướng lá chanh, Kho nghệ, Sốt cà ri, rượu vang, Lẩu chua.', 9, 3)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (35, N'Cá Mao Ếch', N'ca-mao-ech-size-1kg.jpg', 1000000.0000, 1000000.0000, N'Cá Mao Ếch sống có bán Hiếu Hải Sản - Giao cá tươi sống tại TPHCM. Cá mao ếch hay cá mang ếch là loại cá nước mặn sống ở các vùng biển Vũng Tàu, Cần Giờ.Mùa cá mao ếch thường vào tháng 6 đến tháng 10. Quy cách: cá mao ếch sống, được bảo quản tại hồ bể chứa. Tại shop còn nhiều loại cá tươi sống khác: cá Tầm - cá Chép Giòn - cá Mặt Quỷ - cá Mú - cá Bóp...', 28, 3)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (36, N'Cua Lông Hong Kong', N'cua-long-hong-kong-01.jpg', 850000.0000, 850000.0000, N'Cua Lông Hong Kong hay Cua Lông Thượng Hải là một trong top những loại cua ngon nhất thế giới, cua có gạch béo đặc trưng mà không có loại cua nào có thể sánh được.Xuất Xứ: Hong Kong & Thượng Hải Quy cách:- Cua Lông đực khoảng 6-7 con/kg giá 850.000đ/kg- Cua Lông cái khoảng 7-8 con/kg giá 990.000đ/kg- Giao hàng tận nơi TPHCM và các tỉnh. Chế biến: Cua Lông ngon nhất là hấp cách thủy vì giữ được hương vị ngon vốn có, ngoài ra còn có thể chế biến nhiều món hấp dẫn khác', 36, 4)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (37, N'Cua Pha Lê Úc Sống', N'cua-pha-le-uc-song-nhap-khau.jpg', 2700000.0000, 2400000.0000, N'Cua pha lê Úc (Cua Tuyết Úc) là sản phẩm mới được Hiếu Hải Sản nhập khẩu về và cung cấp cho khách hàng, cua pha lê Úc được đánh giá là cua ngon nhất thế giới.Quy cách: mỗi con cua trọng lượng từ 1,2kg - 2,2kg, giao sống tận nơi TPHCM và Hà NộiĐiện thoại: 0915 555 437 - 0913 555 437 - 0909 533 419 - 0909 500 419Cua Pha lê có những thớ thịt dai chắc, rất ngọt. Trong thực tế, Cua Pha Lê Úc được đánh giá là loài cua có vị ngon nhất thế giới.Cua Pha Lê luôn được các đầu bếp trên thế giới chọn làm nguyên liệu trong các cuộc thi ẩm thực ở phương đông & phương tây .', 0, 4)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (44, N'Cua Huỳnh Đế', N'cua-huynh-de.jpg', 1250000.0000, 1250000.0000, N'Cua Huỳnh đế tươi sống là đặc sản vùng biển miền Trung và biển Phú Quốc. Hiếu Hải Sản bán trực tiếp tại HCM-Hà Nội. Áp dụng Freeship hải sản cho các khu vực nội thành.Quy cách: Hiếu Hải Sản cung cấp cua huỳnh đế sống loại 1 từ 500g trở lên.Bảng giá:- 1.250.000đ/Kg cua sống trọng lượng 500g/con - 1,5kg/con- 650.000đ/Kg cua ướp đá hoặc bảo quản lạnh trọng lượng 500g/con trở lên (cam kết bao ăn)', 12, 4)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (45, N'Cua Hoàng Đế Alaska', N'cua-hoang-de-alaska.jpg', 2350000.0000, 2190000.0000, N'Cua hoàng đế (King crab) là hải sản nhập khẩu, shop chuyên loai cua hoàng đế Alaska đỏ tươi sống nguyên con, hải sản bán trực tiếp tại HCM-Hà Nội. Áp dụng Freeship hải sản cho các khu vực nội thành.Báo Giá:- Cua hoàng đế tươi sống 2.190.000đ/kg (trọng lượng 2 – 4kg/con).', 4, 4)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (47, N'Ghẹ Sống Ngon', N'ghe-song-01.jpg', 730000.0000, 650000.0000, N'Ghẹ sống tại Hiếu Hải Sản gồm: ghẹ thịt, ghẹ 2 da - gạch son (loại đặc biệt), Ghẹ được thu mua từ vùng biển Lagi Hàm Tân - Phan Thiết và vùng biển Cam Ranh - Khánh Hòa, nơi có chất lượng ghẹ ngon nhất cả nước.✓ Quy cách: ghẹ sống loại 1: 3-4 con/kg và loại 2: 5 con/kg, shop bao ăn từng con✓ Món ngon: hấp bia sả, rang me, rang muối, nấu lẩu, bánh canh,…', 85, 4)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (48, N'Sò Huyết Đại', N'so-huyet-dai-so-huyet-co.jpg', 500000.0000, 500000.0000, N'Sò huyết đại còn được gọi là "sò huyết cồ" vì kích thước lớn của nó so với loại sò huyết nhỏ mà mọi người thương thấy.- Sò huyết đại cung cấp nguồn chất đạm phong phú, chứa nhiều magiê và kẽm cùng nhiều khoáng chất giúp cơ thể có sức chịu đựng dẻo dai. Quy cách: tận tay khách hàng sống 100%Giá bán: 500.000đ/kg size từ 20 - 25con/kg', 43, 5)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (49, N'Ốc Tai Tượng', N'oc-tai-tuong.jpg', 260000.0000, 260000.0000, N'Quy cách: ốc tươi sốngNguồn gốc: các vùng biển miền Trung như Phú Yên, Nha Trang, Ninh Thuận, Côn Đảo.Giá bán: 280.000đ/kg ( mỗi con nặng từ 2-6kg)Ốc tai tượng thuộc vào nhóm ốc to nhất trong các loại ốc biển. Khách thường mua ốc tai tượng về chế biến các món như: nướng, hấp, nấu cháo, xào bơ tỏi...', 86, 5)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (50, N'Nghêu Đại - Nghêu Cồ', N'nghe-dai-ngheu-co.jpg', 240000.0000, 240000.0000, N'Sản phẩm: nghêu đại- nghêu cồ là loại nghêu được dùng nhiều nhất để chế biến món hấp sả hay hấp Thái được nhiều người yêu thích.- Xuất xứ: vùng biển Cần Giờ - Gò Công - Tiền Giang.- Quy cách: nghêu sống được giao hàng tận nơi.', 64, 5)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (51, N'Sò Dương', N'so-duong-song-hieu-hai-san.jpg', 430000.0000, 430000.0000, N'Sò Dương là một loài sò biển, sống trong tự nhiên ở khu vực có rạn san hô, cát trắng, thịt so duong rất thơm, ngọt.Quy cách: sò Dương sống 1kg từ 5-10 con.Xuất xứ: Phan Rang - Ninh ThuậnChế biến: Sò Dương nướng phô mai, nướng mỡ hành, hấp sả hay sashimi sống đều tuyệt ngon.', 35, 5)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (53, N'Ngao 2 Cồi', N'ngao-2-coi-hieu-hai-san.jpg', 350000.0000, 350000.0000, N'Ngao 2 cồi là loại hải sản ngon - bổ - rẻ được ưa chuộng tại các quán ăn với những món quen thuộc như: ngao 2 cồi nướng mỡ hành, ngao 2 cồi hấp thái, ngao 2 cồi sốt me, cháo ngao 2 cồi...Quy cách: ngao 2 cồi shop lựa từng con, giao sống tận nơi cho khách hàngBảo quản: sục oxy trong hồSize: từ 10 - 15con/kgHiếu Hải Sản chuyên cung cấp ngao 2 cồi sống đảm bảo sống 100% tận nơi, không chết, không hôi bùn.', 9, 5)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (54, N'Tu Hài', N'tu-hai-hieu-hai-san.jpg', 700000.0000, 700000.0000, N'Tu hài hay còn gọi là ốc vòi voi, là 1 trong những loại hải sản ngon và ít có xuất xứ từ vùng biển Nha Trang - Phan Rang - Phan Thiết. Quy cách: giao sống tận nơi, Size từ 8 - 10 con/kg. Hỗ trợ giao sống tại TPHCM và đóng thùng gửi đi các tỉnh.', 12, 5)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (55, N'Ốc Gai', N'oc-gai-hieu-hai-san.jpg', 100000.0000, 100000.0000, N'Quy cách: ốc tươi sống được bảo quản tại kho chứa.Hổ trợ giao ốc gai tại TPHCM và đóng thùng gửi đi tỉnh gần xa.', 6, 5)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (59, N'Ốc Hương', N'oc-huong-thien-nhien.jpg', 490000.0000, 490000.0000, N'Ốc hương tươi sống nhiều size, nhiều giá phục vụ nhu cầu mua sắm của quý khách. ĐẶC BIỆT, có ốc hương đại đánh bắt thiên nhiên, thịt ốc to giòn ngọt thơm ngon, phần gan béo, bùi  hấp dẫn vị ngọt tự nhiên.Hiếu Hải Sản bán trực tiếp tại HCM-Hà Nội. Áp dụng Freeship hải sản cho các khu vực nội thành.Quy cách: ốc hương tươi sống thiên nhiên.Bảng giá size- Size từ 90-100 con/kg: 490,000đ/kg. - Size từ 70-80 con/kg: 550,000đ/kg.- Size từ 60-70 con/kg: 600,000đ/kg- Size từ 40-50 con/kg: 750,000đ/kg- Size từ 30-40 con/kg: 850,000đ/kg- Size từ 20-30 con/kg: 900,000đ/kg.Bảo quản: sục oxy tại hồ', 35, 5)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (61, N'Ốc Hoàng Hậu', N'oc-hoang-hau-hieu-hai-san.jpg', 100000.0000, 100000.0000, N'Bán ốc tươi sống. Giao hàng tại TPHCM và đóng hàng gửi tỉnh gần xa', 12, 5)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (63, N'Ốc Đỏ', N'oc-do-hieu-hai-san.jpg', 100000.0000, 100000.0000, N' Xuất xứ Phan Thiết. Giao hải sản tại TPHCM.Quy cách ốc đỏ tươi sống. Bảo quản ốc đỏ tại hồ chứa.♦ Điện thoại: 0915 555 437 - 0913 555 437 - 0909 533 419 - 0909 500 419', 75, 5)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (64, N'Mực Lá Tươi', N'muc-la-tuoi-hieu-hai-san.jpg', 380000.0000, 380000.0000, N'Sản phẩm: Mực lá có thân ngắn, bè như chiếc lá, thịt dày có màu đỏ cánh giánn. Mực lá được Hiếu Hải Sản thu mua của ngư dân đánh bắt trực tiếp từ biển Phan Rang - Phan Thiết, nơi mực ngon nhất cả nước.Quy cách: trọng lượng mỗi con từ 500g - 1kg, mực tươi hút chân không bảo quản lạnh từng con.Xuất xứ: Phan Rang - Phan Thiết.Chế biến: Mực lá ngon nhất là hấp cách thủy hoặc nướng, ngoài ra có thể chế biến nhiều món ăn ngon khác như ăn sống, trộn gỏi, xào, nhúng lẩu, chiên mắm, chiên giòn,..', 13, 6)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (65, N'Mực Ống', N'muc-ong-hieu-hai-san.jpg', 450000.0000, 450000.0000, N'Sản phẩm: Mực ống có thân hình dài, là loại mực ngon trong họ hàng nhà mực.  Được đánh bắt trực tiếp từ biển Phan Rang - Phan Thiếtvà được ngư dân cấp đông nhanh nhằm bảo quản mực một cách ngon nhất.Quy cách: trọng lượng mỗi con từ 300g - 800g/con, mực bảo quản lạnhMón ngon: mực ống xào chua ngọt, mực ống xào thơm, mực ống chiên giòn, mực nướng sa tế, mực ống nấu bún, mực ống chiên nước mắm, mực ống hấp...', 64, 6)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (66, N'Hàu Sữa Nhật (Shashimi)', N'hau-sua-nhat.jpg', 285000.0000, 285000.0000, N'Hàu sữa Nhật chuẩn sashimi. Hiếu Hải Sản nhập khẩu trực tiếp từ cảng Kobe, Nhật Bản. Hàu tươi nguyên con, thịt hàu rất ngọt và sạch..Hiếu Hải Sản bán trực tiếp tại HCM-Hà Nội. Áp dụng Freeship hải sản cho các khu vực nội thành.Xuất xứ: Kobe, Nhật Bản.Quy cách:hàu nguyên con chưa tách vỏ, đóng khay xốp, bao bì hút chân không.Bảng giá size:size 5-7con/khay - 285,000đBảo quản: hàu tươi giữ cấp đông.Chế biến món sashimi - sushi, nướng, xào, súp lẩu...', 13, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (67, N'Cua Nâu Nauy', N'cua-nau.jpg', 690000.0000, 690000.0000, N'Cua Nâu Nauy tươi sống, cua siêu gạch hải sản nhập khẩu Nauy. Hiếu Hải Sản bán trực tiếp tại HCM-Hà Nội. Áp dụng Freeship hải sản cho các khu vực nội thành.Quy cách: Bán theo con, giao cua sống nguyên conBảng giá size:+ Size 6 - 8 lạng/con: 690.000đ', 76, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (68, N'Cua Champagne Úc Sống', N'cua-champ.jpg', 1290000.0000, 1290000.0000, N'Cua Champagne Úc (Cua sam-panh) là hải sản nhập khẩu tươi sống và Hiếu Hải Sản cung cấp cho khách hàng; Cua Champagne Úc được đánh giá hải sản có chất lượng tốt nhất về hương vị cũng như giá bán trên thị trường.Quy cách: mỗi con cua trọng lượng từ 1-2kg, giao sống tận nơi TPHCM.', 23, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (73, N'Sò Điệp Nhật', N'so-diep-nhat-song-01.jpg', 240000.0000, 240000.0000, N'Sò Điệp Nhật đánh bắt từ đảo Hokkaido - được đánh giá là loài sò điệp ngon nhất thế giới, cồi sò mềm không dai và có vị ngọt thanh.Quy cách: tại Hiếu Hải Sản đang có bán sò điệp Nhật sống, sò điệp Nhật lạnh nguyên con và cồi sò điệp Nhật nhập khẩu trực tiếpGiá bán:- Sò điệp Nhật bảo quản lạnh từ 8-10 con/kg giá 240.000đ/kg.- Sò điệp Nhật sống từ 6-8 con/kg giá 780.000đ/Kg- Cồi sò điệp Nhật từ 25-30 cồi/Kg giá 1.100.000đ/Kg', 65, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (74, N'Sò Bơ Mỹ', N'so-bo-my-hieu-hai-san.jpg', 450000.0000, 450000.0000, N'Sò Bơ Mỹ mới được Hiếu Hải Sản nhập khẩu về thị trường Việt Nam. Hình dáng sò Bơ to, vỏ bóng láng. Thịt sò Bơ rất nhiều và đầy, thịt ngọt ngon như thịt gà, có hương thơm mùi bơ rất lạ.Hiện tại sò Bơ Mỹ là hải sản quý hiếm có và được nhiều khách ưa thích. Hãy liên hệ ngay với Hiếu Hải Sản để được thưởng thức sản phẩm này và nhiều loại hải sản nhập khẩu khác.Quy cách: Sò Bơ sống 1kg khoảng 3 con. Giao hàng tại TPHCM.Chế biến: Sò bơ hấp, sò bơ nướng mọi, nướng mỡ hành hoặc nướng phô mai đút lò, sò bơ nhúng lẩu,...', 13, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (75, N'Bạch Tuột Nhật', N'bach-tuoc-nhat.png', 750000.0000, 750000.0000, N'<p>Bạch tuộc Nhật Bản - hải sản nhập khẩu mới tại cửa hàng Hiếu Hải Sản.</p><p>Trọng lượng mỗi con nặng từ 800g đến 1,5kg/con.</p><p> Bảo quản lạnh ở nhiệt độ lạnh –18 độ C.Bạch tuộc nhật dễ chế biến món ăn ngon với hương vị tươi ngon giòn giòn rất được ưa chuộng.</p><p>Bạch tuộc nhật được đánh giá là thực phẩm dinh dưỡng tốt cho phụ nữ sau sinh hay người dưỡng sức khoẻ.</p><p>Liên hệ mua bạch tuộc nhật tại Hiếu Hải Sản để được thưởng thức sản phẩm này và nhiều loại hải sản khác.</p><p>Chế biến: món hấp, luộc, nướng, trộn gỏi, ăn Sashimi hoặc sushi đều ngon.</p>', 7, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (77, N'Ốc BuLot Pháp', N'oc-bulot-phap-nhap-khau.jpg', 430000.0000, 430000.0000, N'- Ốc Bulot của Pháp, 1 loại hải sản được ưa chuộng hiện nay vì thịt ngọt, hương vị khác hẳn so với các loại ốc khác.- Ốc Bulot xông nhiệt chín và cấp đông chuẩn Châu Âu IQF nên chất lượng hương vị vẫn đảm bảo tươi ngon.- Mỗi kg ốc Bulot khoảng 50 - 60 con, quy cách đóng gói trong hộp sang trọng, giao hàng tận nơi.Xuất xứ: Vùng biển Normandy Pháp(Giá bán tại Hà Nội + 30 nghìn/kg)', 12, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (78, N'Bào Ngư Viền Đen Úc', N'bao-ngu-uc-vien-den.jpg', 1550000.0000, 1550000.0000, N'<p>Bào ngư viền đen sống nhập khẩu trực tiếp từ Úc, thực phẩm cao cấp giúp bổ sung và cân bằng dưỡng chất.</p><p>Xuất xứ: đảo Tasmania, Úc</p><p>Quy cách: bào ngư còn vỏ tươi sống, size 2 ~ 3 con/kg.</p><p>Chế biến món ăn: sashimi tươi; bào ngư hấp hành gừng; bào ngư sốt dầu hào; súp bào ngư vi ca</p>', 19, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (79, N'Ca Tuyết Phi Lê', N'ca-tuyet-nauy-phile.jpg', 620000.0000, 620000.0000, N'Cá tuyết phi lê là sản phẩm hải sản được yêu thích tại Hiếu Hải Sản, cá Tuyết được đánh bắt từ vùng biển NaUy, làm sạch sẽ, bỏ xương và nội tạng, chỉ giữ lại phần thịt tươi ngon nhất.Quy cách: Cá tuyết bông phi lê nửa thân (cá tuyết trắng loại ngon nhất) 0.8-1,3kg/miếng nửa thân, giữ lạnh.Giá bán: 620.000đ/kgXuất xứ: Công ty Norwegian Seafood - NauyChế biến: chiên áp chảo, nướng, sốt, ăn sashimi, rang muối.', 84, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (80, N'Sò Đỏ', N'so-do-nhap-khau.jpg', 1000000.0000, 1000000.0000, N'Sò đỏ Canada chứa nhiều đạm, ít mỡ, các vitamin A,B1,B2…các khoáng chất có giá trị dinh dưỡng cao như magne và kẽm giúp tăng cường sức chịu đựng dẻo dai cho cơ thể. Sò đỏ thơm mùi sữa và rất ngọt. Phần lớn sữa từ sò tập trung ở phần gốc. Nếu ăn cùng wasabi, nước tương thì rất tuyệt vời.Quy cách: Đóng hộp 1kg, bảo quản lạnh.Xuất xứ: Canada, sơ chế và đóng gói tại Nhật Bản', 26, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (81, N'Bào Ngư Hàn Quốc', N'bao-ngu-han-quoc-song.jpg', 1350000.0000, 1350000.0000, N'<p>Cung cấp Bào Ngư Hàn Quốc Tươi Sống. </p><p>Hải Sản Nhập Khẩu Chính Hãng. </p><p>Uy Tín Bao Ăn Bao Cân. </p><p>Bào ngư đánh bắt trực tiếp tại đảo Jeju Hàn Quốc, nhập cảng hàng không về TPHCM, và bảo quản sống tại hồ thủy sản. </p><p>Hiếu Hải Sản bán trực tiếp tại HCM-Hà Nội. </p><p>Áp dụng Freeship hải sản cho các khu vực nội thành.Quy cách: giao sống tận nơi.</p><p>Bảo quản: bảo quản bào ngư sống tại kho thủy sản.</p><p>Bảng giá size</p><p>Bào ngư Hàn Quốc sống size 10-12 con/kg - 1.350.000đ</p><p>Bào ngư Hàn Quốc tươi lạnh size 15-17 con/kg - 950.000đ</p>', 96, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (87, N'Vẹm Xanh New Zealand', N'vem-xanh-new-zealand.jpg', 290000.0000, 290000.0000, N'Sản phẩm: (tặng kèm nước sốt bơ sữa hoặc trứng muối trị giá 50.000đ)- Vẹm Xanh New Zealand nhập khẩu tách vỏ 25-30 con/kg, bảo quản lạnh.- Vẹm Xanh đánh bắt tự nhiên kích thước lớn và ngon nhất thế giới.- Thịt Vẹm mập, giàu dinh dưỡng, thích hợp với các món nướng, sốt, hấp  đều ngon tuyệt.Xuất xứ: Đảo Nam Stewart, miền Nam New Zealand.Giá bán: (tặng kèm nước sốt bơ sữa hoặc trứng muối trị giá 50.000đ) - Vẹm xanh New Zealand thường (Kono): 290.000đ/kg - Vẹm xanh New Zealand Organic (Pure): 340.000đ/kg', 23, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (88, N'Cá Thờn Bơn Sống', N'ca-bon-ca-thon-bon-song-han-quoc-05.jpg', 1100000.0000, 990000.0000, N'Họ cá thờn bơn rất phong phú có trên 100 loài khác nhau. Cá thờn bơn có hình thù cổ quái nhưng thịt ăn rất ngon,ngọt dịu,béo bùi. Quy cách: cá bơn sống.Trọng lượng: 1 con nặng từ 1kg - 2KgBảo quản: Cá sống quý khách có thể bảo quản nước hoặc làm sạch cho vào ngăn đá tủ lạnh.', 57, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (90, N'Trứng Cá Tầm Caviar', N'trung-ca-tam-caviar.jpg', 270000.0000, 270000.0000, N'Trứng cá Tầm là món khoái khẩu của giới thượng lưu phương Tây. Trứng cá Tầm có chứa nhiều dưỡng chất như canxi, phot-pho, protein, magie, sắt và đủ loại vitamin B12, B6, B2, B44, A, C và D cùng nhiều khoáng chất hữu ích.- Quy cách: Trứng cá tầm đen muối CAVIAR - trọng lượng 140g/hủ- Xuất xứ: Đức- Hợp với đồ uống: Vodka hay Champagne hoặc Rượu vang trắng.- Bảo quản: ≤10CTrứng cá đen là một món ăn có mùi vị đặc trưng và bổ dưỡng. Được làm từ các bọc trứng cá và muối, đó là một nguồn thực phẩm bổ dưỡng với các thành phần như canxi, và photpho cũng như là protein, selen, sắt, magiê và các loại vitamin B12, B6, B2, B44, C, A, và D. Trong trứng cá cũng có chứa các axit amin, khoáng chất acginin và histidin cũng như các axit amin cần thiết khác như lysine, isoleucine, và methionine.Một thìa trứng cá chứa 1 gam axit béo Omega-3, giúp ngăn ngừa các bệnh về tim.', 13, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (91, N'Cá Hồi Phi Lê', N'ca-hoi-nauy.jpg', 650000.0000, 650000.0000, N'Cá hồi phi lê (salmon fillet) là phần thịt cá cắt lát từ cá hồi nguyên con nhập khẩu. Hải sản bán trực tiếp tại HCM-Hà Nội. Áp dụng Freeship hải sản cho các khu vực nội thành.Quy cách: đóng gói khay xốp bao bì hút chân không ép khí. Bảo quản cá hồi tươi bằng tủ mát, và đủ tiêu chuẩn ăn cá hồi sashimi.Tặng kèm: gừng hồng sushi, mù tạt bột khi mua cá hồi phi lê.Bảng giáCá hồi phi lê tươi = 650,000đ/kg.Cá hồi nguyên con = 410,000đ/kg.Đầu cá hồi = 80,000đ/kg.Xương và lườn cá hồi = 80,000đ/kg.', 10, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (92, N'Trứng Cá Chuồn(500G)', N'trung-ca-chuon.jpg', 500000.0000, 500000.0000, N'Trứng cá chuồn là loại trứng cá nhỏ có màu cam hay đỏ được đóng hộp cẩn thận, bảo quản đông. Thường được làm món sashimi của Nhật.- Quy cách: Hộp 500gr- Bảo quản: Ngăn đông tủ lạnh- Cách dùng: dùng để làm món sushi, sashimi....', 15, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (93, N'Ốc Vòi Voi Canada', N'oc-voi-voi-canada-song.jpg', 1100000.0000, 990000.0000, N'Ốc vòi voi Canada hay còn gọi là tu hài Canada nhập khẩu sống trực tiếp và được Hiếu Hải Sản phân phối lẻ tại thị trường Việt NamQuy cách: trọng lượng mỗi con từ 1kg - 2kg, giao sống nguyên con.Giá bán:- Giá tại TPHCM: 990.000đ/Kg- Giá tại Hà Nội: 1.050.000đ/kg(Giá có thể biến động theo thời giá, quý khách thông cảm và liên hệ hotline để được báo giá)', 4, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (94, N'Chân Cua Hoàng Đế', N'chan-cua-hoang-de-alaska.jpg', 1650000.0000, 1650000.0000, N'Sản phẩm: Chân cua hoàng đế Alaska được đánh bắt, hấp chín và cấp đông nhanh trực tiếp chuẩn IQF ngay trên tàu nên vẫn giữ được nguyên vẹn hương vị tươi ngon vốn có như cua sống.Quy cách: chân cua hấp chín bảo quản lạnh, 1 bộ chân nặng từ 1kg - 1.5kgXuất xứ: Công ty Clearwater Seafood - Canada.', 15, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (95, N'Hàu Sữa Pháp', N'hau-sua-song.jpg', 8000.0000, 8000.0000, N'<p>✔ Quy cách: Bán theo con(giao sống nguyên con, cam kết nhiều sữa, tươi ngon )- Túi 100 con. Giá 600,000đ.</p><p>✔ Phụ phí giao hàng cho hóa đơn dưới 500.000đ</p>', 12, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (97, N'Bào Ngư Úc', N'bao-ngu-uc-hieu-hai-san.jpg', 6600000.0000, 6600000.0000, N'<p>Hiếu Hải Sản chuyên bán bào ngư Úc viền xanh, loại bào ngư ngon nhất, giàu dinh dưỡng nhất thế giới.</p><p>Bào ngư Úc viền xanh tách vỏ (có bán từng con)</p><p>- Size 3-4 con/kg: 6.900.000đ/kg </p><p>- Size 5-6 con/kg: 6.600.000đ/kg</p><p>Bào ngư Úc đóng hộp:- 1.700.000 đ/lon trọng lượng 427g gồm 2-4 con bào ngư viền xanh.</p>', 68, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (98, N'Cá Hồi Nguyên Con', N'ca-hoi-nguyen-con-nauy.jpg', 410000.0000, 41000.0000, N'Cá hồi tươi nguyên con nhập khẩu trực tiếp từ Na-Uy. Hiếu Hải Sản bán trực tiếp tại HCM-Hà Nội. Áp dụng Freeship hải sản cho các khu vực nội thành.Xuất xứ: Norway.Quy cách:Trọng lượng cá hồi nguyên con: 5kg đến 7kg/con.Số lượng đặt tối thiểu: 1 con (* Lưu ý: Đặt trước một ngày hoặc đặt vào lúc 8h sáng shop sẽ giao vào buổi chiều)Có cá hồi phi lê tươi chuẩn sashimi: 650,000đ', 67, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (99, N'Tôm Hùm Canada Đông Lạnh', N'tom-hum-canada-dong-lanh.jpg', 240000.0000, 240000.0000, N'Tôm hùm Canada đông lạnh trọng lượng mỗi con khoảng 350g - 400g thích hợp trong các bữa tiệc gia đình, buffet sang trọng.Quy cách: Tôm hùm Canada đông lạnh chuẩn IQF từ tôm sống.Trọng lượng:- 350g - 400g/con giá 240.000đ/con- 400g - 450g/con giá 260.000đ/conXuất xứ: Clearwater Seafoods Limited, Canada.Chế biến: nướng phô mai, hấp, rang muối,..', 5, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (100, N'Trứng Cá Hồi (250G)', N'trung-ca-hoi.jpg', 700000.0000, 700000.0000, N' Cá hồi từng được ví là hoàng đế của đại dương. Trứng cá hồi là một trong những loại trứng cá đắt đỏ và giàu dinh dưỡng nhất.- Quy cách: hộp 250gr- Bảo quản: Ngăn mát tủ lạnh- Nguồn gốc: Nhật Bản', 26, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (101, N'Bào Ngư New ZeaLand Lạnh', N'bao-ngu-new-zealand-lanh.jpg', 2150000.0000, 2150000.0000, N'<p>Bào ngư New Zealand lạnh được đánh bắt từ bào ngư đen sống (Paua shell), một loại bào ngư quý hiếm và thuộc loại ngon nhất thế giới.</p><p>Quy cách: Bào ngư đen New Zealand lạnh nguyên vỏ, trọng lượng 1 con từ 500g-1kg. </p><p>Xuất xứ: Pure Horizons Limited, New Zealand</p>', 26, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (104, N'Bào Ngư Đen New ZeaLand', N'bao-ngu-den-new-zealand.jpg', 2150000.0000, 2150000.0000, N'<p>Bào ngư đen New Zealand (Paua) là một loại bào ngư cực kỳ quý hiếm và ngon nhất thế giới. </p><p>Trong bào ngư đen New Zealand, nguồn dinh dưỡng, khoáng chất cực kỳ cao cùng với việc khai thác cực kỳ hạn chế nên bào ngư đen rất quý hiếm trên thị trường.</p><p>Quy cách:</p><p>- Bào ngư đen New Zealand còn vỏ trọng lượng từ 400g - 700g/con</p><p>- Sản phẩm được đóng gói ép chân không từng con.</p><p>- Giao hàng tận nơi TPHCM và Hà Nội</p><p><br></p>', 13, 7)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (105, N'Bạch Tuộc Xếp Hoa', N'bach-tuoc-baby.jpg', 145000.0000, 145000.0000, N'<p>Bạch Tuộc Xếp Hoa (hay bạch tuộc sữa mini ) đạt chuẩn xuất khẩu, bạch tuộc tươi được đóng gói khay tiện lợi. Hiếu Hải Sản bán trực tiếp tại HCM-Hà Nội. </p><p>Áp dụng Freeship hải sản cho các khu vực nội thành.</p><p>Xuất xứ: Việt Nam.Quy cách: đóng gói khay 40-80 con, túi chân không. </p><p>Bảo quản tươi cấp đông.Bảng Giá Sizesize 5 lạng/khay - 145,000đ</p><p>Chế biến: hấp, nướng, chiên, nấu lẩu...</p>', 18, 8)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (106, N'Chả Mực Hạ Long', N'cha-muc-ha-long-01.jpg', 490000.0000, 490000.0000, N'Chả Mực Hạ Long - chả mực giã tay. Hải sản tiện lợi giá tốt phù hợp với gia đình.Sản phẩm: đặc sản vùng Quảng Ninh, chả được làm từ mực nang tươi sống, giã nhuyễn bằng tay và chiên chín vàng ươm.- Hiếu Hải Sản cung cấp chả mực tại TPHCM. Giao nhanh trong ngày.- Chả mực hoàn toàn tự nhiên. Không hàn the, không tẩm bột màu, không chất bảo quản.Quy cách: Chả mực đóng thành khay 10 miếng có trọng lượng 500gram, hút khí ép chân không bao bì kín cao cấp.Bảo quản: cấp đông tại nhiệt độ lạnh giữ độ tươi ngon hải sản.', 75, 8)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (107, N'Thịt Ghẹ (500G)', N'thit-ghe-01.jpg', 180000.0000, 180000.0000, N'- Sản phẩm: thịt ghẹ đông lạnh, dẫn đầu trong danh sách những hải sản tiện lợi. Thịt ghẹ là nguyên liệu cho nhiều món ngon dành cho mọi lứa tuổi, hứa hẹn một bữa ăn ngon, một sức khỏe tốt cho các thành viên trong gia đình.- Quy cách: thịt ghẹ bóc vỏ, đóng khay 500g.- Bảo quản: ngăn đông, có thể bảo quản được rất lâu.- Hàng thịt ghẹ tại shop luôn là hàng mới, không bán hàng tồn kho, để quá lâu trong tủ lạnh.', 23, 8)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (108, N'Cá Trích Phi Lê (Khay 500G)', N'ca-trich-phi-le-02.jpg', 110000.0000, 110000.0000, N'Cá trích phi lê là 1 đặc sản nổi tiếng của đảo ngọc Phú Quốc, ai đến du lịch Phú Quốc mà chưa được thưởng thức món này thì quả là một thiếu sót lớn.Quy cách:- Cá Trích đã làm sạch sẽ, không xương, không tanh.- Đóng khay 500g bảo quản lạnhChế biến:- Cá có thể ăn sống, ngon nhất khi làm gỏi cá Trích.- Có thể chiên, hấp, kho, nhúng lẩu, ăn sống Sashimi,..', 5, 8)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (109, N'Thịt Tôm Tích (500G)', N'thit-tom-tich-hap-chin.jpg', 180000.0000, 180000.0000, N'- Thịt tôm tích được hấp từ những con tôm tít sống sau khi đánh bắt nên cực kỳ tươi ngon.- Thịt tôm đã chín, khách chỉ cần mua về chế biến ngay nên cực kỳ tiện lợi.- Giá: 180,000đ/hộp/500g khoảng (30-35 con). ', 75, 8)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (112, N'Trứng Cá Ngừ', N'trung-ca-ngu-01.jpg', 60000.0000, 60000.0000, N'Sản phẩm: Trứng cá Ngừ sọc dưa bảo quản lạnh.Quy cách: đóng gói hút chân không gói 500grCách dùng: Rã đông tự nhiên từ 10-20 phút.Chế biến: hấp chưng cách thủy, nấu lẩu...hoặc chế biến tùy thích.', 23, 8)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (115, N'Cá Thu Cắt Lát (500G)', N'ca-thu-cat-lat.jpg', 170000.0000, 170000.0000, N'Sản phẩm: Cá Thu còn da, còn xương, cắt lát (steak)Quy cách: Hút chân không gói 500g.', 7, 8)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (116, N'Cá Ngừ Đại Dương Cắt Khúc', N'ca-ngu-cat-khuc.jpg', 300000.0000, 300000.0000, N' Cá ngừ đại dương chất lượng cam kết tươi ngon, chuẩn xuất khẩu các thị trường Nhật Bản, EU. Đây là sản phẩm được nhiều khách hàng quen thuộc tin dùng nhiều.- Nơi sản xuất : Công ty TNHH Hải Long Nha Trang- Cá ngừ đại dương bỏ da, bỏ xương, dạng loin khoảng 3-5kg/ loin ( chia làm 3 khúc nhỏ, mỗi khúc khoảng 1,4-1,6kg). Khách hàng có thể mua từng khúc nhỏ.- Đóng gói: Hút chân không, đảm bảo an toàn thực phẩm- Bảo quản: ngăn đá tủ lạnh, dùng trực tiếp hoặc chế biến, sản phẩm phù hợp cho các món Sashimi, Sushi, Không tái đông khi rã đông sản phẩm.', 13, 8)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (117, N'Mắt Cá Ngừ Đại Dương', N'mat-ca-ngu-dai-duong-01.jpg', 120000.0000, 120000.0000, N'Mỗi con cá ngừ nặng từ 30kg - 50kg nhưng mắt chỉ nặng khoảng 200gam.- Mắt cá ngừ đại dương rất bổ dưỡng, to bằng quả trứng gà, rất giàu Omega-3 và DHA- Quy cách: đóng gói hút chân không mỗi túi gồm 6-8 mắt/kg- Xuất xứ: Phú Yên - Nha Trang- Hướng dẫn và hạn sử dụng in trên bao bì.Giá bán: - Mắt cá ngừ đại dương: 120.000đ/kg- Phi lê cá ngừ đại dương: 240.000đ/kg- Lườn cá ngừ đại dương: 100.000đ/kg- Bao tử cá ngừ đại dương: 90.000đ/kg- Trứng cá ngừ: 100.000đ/kg', 64, 8)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (119, N'Cá Cờ Kiếm Cắt Lát (500G)', N'ca-co-kiem-cat-lat.jpg', 145000.0000, 145000.0000, N'Sản phẩm: Cá cờ kiếm bỏ da, bỏ xương, cắt steak bằng máy cưaQuy cách: đóng gói hút chân không túi 500g.', 23, 8)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (120, N'Sụn Cá Cờ Kiếm (500G)', N'sun-ca-co-kiem.jpg', 50000.0000, 50000.0000, N'Sản phẩm: Sụn cá Cờ KiếmĐóng gói: 0,5kg/túi, hoặc tùy theo yêu cầu khách hàng.', 1, 8)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (121, N'Cá Cờ Gòn Cắt Lát (500G)', N'ca-co-gon-cat-lat.jpg', 100000.0000, 100000.0000, N'Quy cách: Cá cờ gòn cắt lát không da, không xươngKhối lượng: túi 500g hoặc theo quy cách khách hàng', 64, 8)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (124, N'Mực Khô Tẩm Gia Vị', N'muc-tam-gia-vi-hieu-hai-san.jpg', 840000.0000, 840000.0000, N'Mực khô tẩm gia vị vừa ngon, vừa tiện lợi cũng như sang trọng, sản phẩm có thể xé ăn liền ngay mà không cần chế biến. Xuất xứ: Nha TrangQuy cách: đóng gói 500gr và 1kg, hút chân khôngBảo quản: nơi thoáng mát (30 ngày), bảo quản lạnh (6 tháng)Cách dùng: Mực thích hợp nhâm nhi với bia và các loại nước giải khát', 11, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (125, N'Cá Đù Một Nắng Nguyên Con', N'ca-du-mot-nang-nguyen-con.jpg', 225000.0000, 225000.0000, N'Cá đù 1 nắng nguyên con. Hiếu hải sản cung cấp 2 loại cá đù một nắng nguyên con và xẻ bướm. Thịt cá đù dẻo, thịt ngọt và thơm. Cá được làm sạch, bỏ đầu và phơi dưới trời nắng giòn. Cá đù một nắng đem nướng trên lửa than hay chiên với dầu ngon đều.Bảng giá sizesize 20 con/kg: 225,000đ/kgQuy cách: cá đù một nắng, bao bì hút chân không ép khí.Bảo quản: đông lạnh', 53, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (126, N'Cá Lưỡi Trâu Một Nắng', N'ca-luoi-trau-mot-nang-01.jpg', 280000.0000, 280000.0000, N'CÁ LƯỠI TRÂU MỘT NẮNG. Hải sản khô một nắng. Hiếu Hải Sản bán trực tiếp tại HCM-Hà Nội. Áp dụng Freeship hải sản cho các khu vực nội thành.Bảng giá size:size 8-10 con/kg - 280.000đQuy cách: Đóng gói hút chân không.Bảo quản: đông lạnh', 12, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (127, N'Ruốc Khô Biển', N'ruoc-kho-bien.jpg', 280000.0000, 280000.0000, N'Sản phẩm:  Ruốc khô biển- Xuất xứ: Nha Trang- Quy cách: gói 500g hút chân không.- Bảo quản: nơi khô ráo, thoáng mát.', 57, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (128, N'Khô Cá Hổ', N'kho-ca-ho-hieu-hai-san.jpg', 300000.0000, 300000.0000, N'<p>Sản phẩm: khô cá hố là món ăn dân dã của người miền Trung, thích hợp với món nướng, chiên dầu rất chạy cơm và còn là món mồi nhấm rất bén.</p><p>Quy cách: bán theo ký hoặc theo quy cách khách hàng.</p><p>Bảo quản: nơi khô ráo, thoáng mát.</p><p>Sản xuất: Phan Rang, Phan Thiết</p>', 13, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (129, N'Tôm Khô Đất Cà Mau', N'tom-kho-ca-mau.jpg', 1400000.0000, 1400000.0000, N'<p>Tôm khô Cà Mau tại Hiếu Hải Sản đang bán là tôm khô đất chính gốc Năm Căn Cà Mau ngon đúng chuẩn, sản phẩm cao cấp loại 1 dành cho biếu tặng hoặc mang đi nước ngoài.</p><p>Tôm khô đất Cà Mau sau khi hấp chín, phơi khô và được tách vỏ theo cách thủ công hoàn toàn, màu sắc và hương vị tự nhiên vốn có.</p><p>Quy cách: Sản phẩm được đóng gói hút chân không theo trọng lượng 500g hoặc 1kg, có mẫu ăn thử cho khách, hỗ trợ giao hàng tận nơi.</p><p>Giá bán: </p><p>- Tôm khô Cà Mau loại lớn: 1.550.000đ/Kg</p><p>- Tôm khô Cà Mau loại trung: 1.350.000đ/Kg</p><p>Lưu ý: một số nơi bán tôm khô biển hoặc tôm sú, tôm thẻ không phải tôm khô làm từ tôm đất Cà Mau nên sẽ có chất lượng và giá bán thấp hơn, khách hàng thông minh nên tìm hiểu kỹ sản phẩm, hình ảnh và chất lượng thực tế trước khi mua sản phẩm.</p>', 85, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (130, N'Cá Thu Một Nắng', N'khoanh-ca.jpg', 290000.0000, 290000.0000, N'<p>Sản phẩm: Cá thu câu tươi được cắt thành khoanh, phơi trực tiếp một nắng nên cá có độ ráo dẻo nhưng vẫn giữ được độ ngon và mùi thơm tự nhiên.</p><p>Xuất xứ: Cá thu 1 nắng đặc sản Nha Trang - Phan Rang - Phan Thiết</p><p>Quy cách: cá cá thu một nắng, bịch 500gr và 1kg.</p><p>Bảo quản: ép chân không, bảo quản lạnh(Giá tại Hà Nội + 30.000đ/Kg)</p>', 23, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (131, N'Mực Khô Nhỏ Tẩm Ớt', N'muc-kho-nho-tam-ot-1.jpg', 600000.0000, 600000.0000, N'Quy cách: mực khô nhỏ tẩm gia vị, hút chân khôngBảo quản: nơi khô ráo, thoáng mát hoặc bảo quản lạnh- Mực tươi được tẩm ớt và phơi khô trong môi trường tự nhiên, hàng thật, không hóa chất', 6, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (132, N'Khô Cá Chỉ Vàng', N'kho-ca-chi-vang-1.jpg', 290000.0000, 290000.0000, N'Quy cách: cá chỉ vàng phơi khô, hút chân khôngBảo quản: nơi khô ráo, thoáng mát hoặc bảo quản lạnh', 45, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (133, N'Tôm Khô Biển', N'tom-kho-bien-nha-trang-1.jpg', 1300000.0000, 1300000.0000, N'Tôm biển hấp chín phơi khô, màu sắc tự nhiên, vị ngọt thanh càng nhai càng ngọt.Quy cách: đóng gói 250g, 500g hoặc 1kg theo yêu cầu của khách.Bảo quản: nơi khô ráo, thoáng mát hoặc bảo quản lạnhXuất xứ: Nha Trang - Phan Rang', 111, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (134, N'Khô Cá Lù Đù 1 Nắng', N'kho-ca-lu-du-mot-nang-1.jpg', 245000.0000, 245000.0000, N'Quy cách:  Cá lù đù một nắng Cần Giờ - Vũng Tàu hút chân không.Giá bán: (Giá bán tại Hà Nội + 30 nghìn/kg)- Cá đù 1 nắng nguyên con (20 con/kg): 225.000đ- Cá đù 1 nắng xẻ bướm(6-7 con/kg): 245.000đBảo quản: nơi khô ráo, thoáng mát hoặc bảo quản lạnh ', 124, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (135, N'Khô Cá Mai', N'kho-ca-mai.jpg', 370000.0000, 370000.0000, N'Quy cách:  Cá mai xẻ đôi lấy xương sấy khô, hút chân khôngBảo quản: nơi khô ráo, thoáng mát hoặc bảo quản lạnhXuất xứ: vùng biển Phan Rang, Phan Thiết, Nha Trang', 46, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (136, N'Mực Một Nắng', N'muc-mot-nang.jpg', 440000.0000, 440000.0000, N'Sản phẩm: Mực một nắng đặc sản Phan Rang - Phan Thiết làm từ mực ống câu xẻ phơi trong ngày, mực 1 nắng được đóng gói theo trọng lượng 500g hoặc 1kg, được hút ép chân không tiện lợi cho việc bảo quản, vận chuyển trong nước hoặc mang đi nước ngoài.Món ăn chế biến:- Mực 1 nắng nướng mọi, nướng muối ớt, nướng sa tế.- Mực 1 nắng chiên mắm, chiên giòn.- Mực 1 nắng hấp hành gừng, hấp xả ớt.- Mực 1 nắng sốt me, xào rau củ,..', 12, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (137, N'Mực Khô Câu', N'muc-kho-cau.jpg', 1450000.0000, 1450000.0000, N'Quy cách: Mực câu khô loại 1 cao cấp được Hiếu Hải Sản thu mua từ ngư dân Phan Rang, Phan Rí, Phan Thiết. Mực khô được đóng gói hút chân không tiện lợi, sạch sẽ dễ bảo quản và vận chuyển đi nước ngoài.Bảng size giá: Mực khô từ mực ống câu cao cấpsize 12-15 con/kg - 1.490.000đ/kgsize 18 - 22 con/kg - 1.350.000đ/kg', 12, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (138, N'Khô Cá Dứa Cần Giờ 1 Nắng', N'kho-ca-dua-can-gio-mot-nang-02.jpg', 480000.0000, 480000.0000, N'khô cá Dứa một nắng chính gốc, đặc sản Cần Giờ đang được nhiều khách hàng tin dùng hiện nay, đang trở thành một món ăn, một món quà biếu đầy ý nghĩa.Quy cách: Khô cá Dứa 1 nắng thương hiệu Hiếu Cá Dứa, được đóng gói hút chân không, bảo quản lạnh.Cam kết: Cá Dứa 1 nắng Cần Giờ xịn chính gốc.- Có mẫu cá cho quý khách dùng thử.- Tư vấn cách phân biệt khô cá dứa thật và giả.- Tư vấn khách cách bảo quản, vận chuyển, đóng gói đi nước ngoài.Giá bán: Khô cá Dứa Cần Giờ một nắng tại TPHCM (Giá tại Hà Nội + 30 nghìn/kg)480 nghìn/Kg size 1 con nặng từ 500g trở lên - 1kg.', 98, 9)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (139, N'Bào Ngư Vi Cá', N'bao-ngu-uc-vien-xanh-to.jpg', 1000000.0000, 100000.0000, N'<p>Hiếu Hải Sản bán bào ngư vi cá đa dạng chuẩn Size trọng lượng. </p><p>Luôn đảm bảo số lượng hải sản, cung cấp dịch vụ tiện lợi nhanh chóng. </p><p>Hiếu Hải Sản bán trực tiếp tại HCM-Hà Nội. </p><p>Áp dụng Freeship hải sản cho các khu vực nội thành.</p>', 4, 10)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (140, N'Sá Sùng Khô', N'sa-sung-kho-loai-1-01.jpg', 3000000.0000, 3000000.0000, N'Hiếu Hải Sản bán sá sùng khô nguồn gốc Nha Trang - Quảng Ninh. Quy cách: phơi khô, hút chân khôngBảo quản: để nơi khô ráo, thoáng mát hoặc bảo quản ngăn đông. Giá bán: 3.000.000đ/kg - đóng gói 200g - 500g hoặc 1kg theo yêu cầu.', 23, 10)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (141, N'Vi cá mập (100G)', N'vi-ca-map-nguyen-vay-01.jpg', 1500000.0000, 1500000.0000, N'Chuyên vi cá mập cao cấp, hải sản khô đặc sản Nha Trang. Hiếu Hải Sản bán trực tiếp tại HCM-Hà Nội. Áp dụng Freeship hải sản cho các khu vực nội thành.Quy cách & Bảng giá:+ Vi cá loại cước thượng hạng: 5.400.000đ/100g.+ Vi cá xé sợi còn sụn: 3.000.000đ/100g+ Vi cá mập nguyên vây cao cấp: 1.500.000đ/100g', 23, 10)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (142, N'Hải Sâm', N'hai-sam-trang-cao-cap-01.jpg', 1200000.0000, 1200000.0000, N'Hải sâm trắng cao cấp Nha Trang.Quy cách & Giá bán: - Hải sâm trắng tươi loại 1: 120.000đ/100g.- Đóng gói hút chân không, bảo quản lạnh.Chế biến: - Súp Hải sâm cùng vi cá hoặc bào ngư.- Hải sâm xào nấm đông cô, xào mướp, xào ớt chuông- Cháo hải sâm- Canh hải sâm hầm mộc nhĩ, hầm thịt ', 12, 10)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (144, N'Cá Tầm', N'ca-tam-song.jpg', 320000.0000, 290000.0000, N'Cá Tầm sống giống Nga, được nuôi tại Đà Lạt và Sapa. Hiếu Hải Sản cung cấp cá Tầm trọng lượng trung bình từ 1.5 - 3kg/con và cá Tầm khủng loại nặng từ 15-25kg/con.Quy cách: cá sống giao tận nhà tại TPHCM, Hà Nội và nhận gửi hàng đi tỉnh.Chế biến: Cá Tầm nướng muối ớt, lẩu cá Tầm măng chua, cá Tầm chiên sả ớt,..', 21, 11)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (145, N'Cá lăng', N'ca-lang-song-tphcm.jpg', 190000.0000, 190000.0000, N' Cá lăng là loài cá nước ngọt lớn, là món ăn đặc sản trong các nhà hàng lớn.- Thịt cá Lăng trắng, dai ngọt nên được khách yêu thích.- Hiếu Hải Sản giao sống tận nơi TPHCM.Quy cách: Cá Lăng sống size từ 1-3kg/conXuất xứ: cá Lăng sông Đồng Nai.', 46, 11)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (146, N'Cá Chẽm', N'ca-chem-song-01.jpg', 240000.0000, 240000.0000, N'- Cá Chẽm sống ở nước lợ, được đánh bắt từ thiên nhiên.- Thịt cá Chẽm dai ngọt và ít xuông xương nên được nhiều khách ưa thích.- Hiếu Hải Sản giao hàng sống đến tận nơi cho khách hàng tại TPHCM.Quy cách: Cá Chẽm sống trọng lượng 1-3kg/con.Chế biến: Hấp Hồng Kông (hấp xì dầu, chưng tương), sốt chua ngọt, chiên xù, áp chảo, lẫu cá chẽm, file cá chẽm chiên bột, cá chẽm nấu cháo....', 13, 11)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (147, N'Cá Biển Tươi Sạch', N'ca-bien-hang-ngay.jpg', 1000000.0000, 1000000.0000, N'Cá Biển Tươi Ngon Hàng Ngày. Luôn Mang Nguồn Hải Sản Tươi Sạch Đến Với Quý Khách Hàng Bởi Hiếu Hải Sản.Tiện Lợi Cho Việc Đi Chợ Trở Nên Dễ Dàng Nhanh Chóng. Cam Kết Chất Lượng Cá tươi sạch, và Giao Hàng Đúng Thời Gian.-------► ĐỪNG MẤT TIỀN để mua thực phẩm kém chất lượng.► ĐỪNG MẤT TIỀN để dùng thực phẩm không an toàn cho sức khỏe.► ĐỪNG MẤT TIỀN cho Bác Sĩ, Bệnh Viện.► HÃY BỎ TIỀN để mua thực phẩm tươi ngon sạch. ► HÃY BỎ TIỀN để thưởng thức 1 bữa ăn tươi ngon cho cả gia đình.► HÃY BỎ TIỀN vì sức khỏe của bạn.', 41, 11)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (148, N'Tôm Bạc Biển', N'tom-bac-bien.jpg', 400000.0000, 400000.0000, N'► Tôm Sú sống: 350.000đ/kg► Tôm Bạc Biển (10-15 con/kg): 450.000đ/kg► Tôm Sú Biển (4-6 con/kg): 650.000đ/kg✔ Hỗ trợ giao hàng tại TPHCM.LƯU Ý: ✔ Đặt hàng trước 16h hàng ngày, nhận hàng vào sáng hoặc chiều ngày hôm sau tại TPHCM.', 76, 11)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (149, N'Cá Dảnh - Lưỡi Trâu', N'ca-danh-ca-luoi-trau.jpg', 70000.0000, 70000.0000, N'- Cá Dãnh (Lưỡi Trâu): 70.000đ/kgLƯU Ý: ✔ Đặt hàng trước 16h hàng ngày, nhận hàng vào sáng hoặc chiều ngày hôm sau tại TPHCM.', 42, 11)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (150, N'Cá Mai Phi Lê', N'ca-ma-phi-le-lam-sach.jpg', 250000.0000, 250000.0000, N'<p>► Cá Mai Phi Lê: 250.000đ/Kg, đóng gói 250g.</p><p>LƯU Ý: ✔ Đặt hàng trước 16h hàng ngày, nhận hàng vào sáng hoặc chiều ngày hôm sau tại TPHCM.</p>', 16, 11)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (151, N'Cá Chim Biển', N'ca-chim.jpg', 190000.0000, 190000.0000, N'Cá Chim Biển- Nguyên con tươi: 190.000đ/kg- Cá Chim sống (1-2kg/con): 290.000đ/kgLƯU Ý: ✔ Đặt hàng trước 16h hàng ngày, nhận hàng vào sáng hoặc chiều ngày hôm sau tại TPHCM.', 76, 11)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (152, N'Cá Bóp Biển', N'ca-bop-bien.jpg', 160000.0000, 160000.0000, N'Cá Bóp Biển- Nguyên con (4-10kg/con): 160.000đ/kg- Cắt khoanh: 200.000đ/kg- Cá Bóp sống (2-4kg/con): 240.000đ/kgLƯU Ý: ✔ Đặt hàng trước 16h hàng ngày, nhận hàng vào sáng hoặc chiều ngày hôm sau tại TPHCM.', 14, 11)
INSERT [dbo].[SanPham] ([ID_SanPham], [TenSanPham], [HinhAnh], [GiaGoc], [GiaBan], [MoTa], [SoLuong], [ID_DanhMuc]) VALUES (153, N'Cá Mú Câu', N'ca-mu-do-cau.jpg', 260000.0000, 260000.0000, N'► Cá Mú Đỏ Câu- Trọng lượng từ 800g-1,2kg/con: 260.000đ/kg.- Trọng lượng từ 1,5kg-5kg/con: 320.000đ/kg.► Cá Mú Bông Câu (1-5kg/con): 220.000đ/kg.► Cá Mú Nghệ Câu (1-5kg/con): 280.000đ/kg.► Cá Mú Đen Sống (1-2kg/con): 270.000đ/kg.LƯU Ý:✔ Đặt hàng trước 16h hàng ngày, nhận hàng vào sáng hoặc chiều ngày hôm sau tại TPHCM.', 11, 11)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([ID_TaiKhoan], [Email], [MatKhau], [HoTen], [GioiTinh], [SDT], [DiaChi], [TrangThai]) VALUES (2, N'nguyenduchoa@gmail.com                            ', N'e10adc3949ba59abbe56e057f20f883e                  ', N'Nguyễn Đức Hòa', 1, N'0123456789', N'Quế Võ', 1)
INSERT [dbo].[TaiKhoan] ([ID_TaiKhoan], [Email], [MatKhau], [HoTen], [GioiTinh], [SDT], [DiaChi], [TrangThai]) VALUES (3, N'hathanhhoang@gmail.com                            ', N'ca077b853175229b60abbd27ac7a2763                  ', N'Hà Thanh Hoàng', 1, N'0912345678', N'Thái Bình', 1)
INSERT [dbo].[TaiKhoan] ([ID_TaiKhoan], [Email], [MatKhau], [HoTen], [GioiTinh], [SDT], [DiaChi], [TrangThai]) VALUES (6, N'lavanhoa@gmail.com                                ', N'e10adc3949ba59abbe56e057f20f883e                  ', N'La Văn Hòa', 0, N'0123456788', N'Test', 1)
INSERT [dbo].[TaiKhoan] ([ID_TaiKhoan], [Email], [MatKhau], [HoTen], [GioiTinh], [SDT], [DiaChi], [TrangThai]) VALUES (7, N'Hoang@gmail.com                                   ', N'e10adc3949ba59abbe56e057f20f883e                  ', N'123', 1, N'123       ', N'123', 1)
INSERT [dbo].[TaiKhoan] ([ID_TaiKhoan], [Email], [MatKhau], [HoTen], [GioiTinh], [SDT], [DiaChi], [TrangThai]) VALUES (8, N'admin                                             ', N'e10adc3949ba59abbe56e057f20f883e                  ', N'Nhom 13', 1, N'0332834556', N'q', 0)
INSERT [dbo].[TaiKhoan] ([ID_TaiKhoan], [Email], [MatKhau], [HoTen], [GioiTinh], [SDT], [DiaChi], [TrangThai]) VALUES (9, N'lieudz@gmail.com                                  ', N'e10adc3949ba59abbe56e057f20f883e                  ', N'Nguyễn Văn Liệu', 1, N'0332834556', N'Bắc Ninh', 1)
INSERT [dbo].[TaiKhoan] ([ID_TaiKhoan], [Email], [MatKhau], [HoTen], [GioiTinh], [SDT], [DiaChi], [TrangThai]) VALUES (10, N'Hoang123@gmail.com                                ', N'4297f44b13955235245b2497399d7a93                  ', N'Huyền', 0, N'0183502831', N'Hà Nội', 1)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[TinTuc_VaoBep] ON 

INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (2, N'GIÃN CÁCH KHÔNG XA CÁCH - HIẾU ĐỒNG HÀNH CÙNG BẠN', N'thumb-thongcao.jpg', CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'<h1><span style="color: rgb(10, 10, 10); font-size: 16px; text-align: justify;">Khác với những con tôm đông lạnh, bơm hóa chất hoặc bị ươn do để lâu ngày, thì tôm tươi có phần thân hơi cong, thịt căng chắc, tuy nhiên, tôm không to và dày thịt khác thường. Ngoài ra, bạn cũng nên lưu ý chọn tôm có phần vỏ linh hoạt, còn nguyên vẹn, đầu phải dính chặt vào thân tôm nhé, đảm bảo tôm sẽ luôn tươi rói đấy.</span><br></h1>', 1)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (3, N'MẸ BẦU ĂN BẠCH TUỘC ĐƯỢC KHÔNG? HÃY XEM 5 LỢI ÍCH NÀY', N'loi-ich-an-bach-tuoc-baby.png', CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'<p>Theo đông y, thịt bạch tuộc có tính bình, không độc. Khi ăn vào có tác dụng ích khí, dưỡng huyết, thông sữa, chống suy nhược. Thịt bạch tuộc tươi có giá trị dinh dưỡng cao, hổ trợ mẹ bầu tăng cường sức đề kháng, bồi bổ khỏe mạnh suốt thời kỳ mang thai. </p><p>BẠCH TUỘC XẾP HOA, hải sản tươi ngon tiện lợi phù hợp với chế độ dinh dưỡng cho các mẹ bầu, và cả gia đình. Dễ dàng sử dụng chế biến món ngon với 15phut. </p><p>5 LỢI ÍCH KHI ĂN BẠCH TUỘC DÀNH CHO MẸ BẦU</p><p>1. Bổ sung chất dinh dưỡngĐối với mẹ bầu, bạch tuộc là nguồn dinh dưỡng tốt cho cả mẹ và thai nhi. Nhờ chứa hàm lượng cao vitamin và khoáng chất nên giúp tăng cường sức đề kháng của mẹ bầu trong suốt 9 tháng mang thai.</p><p>2. Tăng cường sức đề khángDo bạch tuộc có chứa nhiều canxi, kali và photpho và các chất béo khác nên axit có niều khả năng tăng cường sức đề kháng để giúp ngăn ngừa bệnh.</p><p>3. Tốt cho hệ tiêu hóaTrong bạch tuộc có chứa hàm lượng selenium cao nên có tác dụng chuyển hóa protein trong dạ dày giúp quá trình tiêu hóa trở nên đơn giản hơn. Mặt khác, đây còn là một trong những chất có khả năng chống oxy hóa tốt giúp ngăn chặn các gốc tự do gây hại cho cơ thể.</p><p>4. Tăng cường trao đổi chấtVới hàm lượng vitamin B12 giúp tăng cường trao đổi chất, tạo ra các tế mẹo máu đỏ mới và hỗ trợ chức năng não bộ hàng ngày. Việc trao đổi chất tốt trong cơ thể mẹ bầu không chỉ giúp cung cấp dưỡng chất cho mẹ mà còn giúp cung cấp dưỡng chất cho cả bé.5. Giúp thai nhi phát triển trí tuệ tốt hơn</p><p>Đặc biệt, trong bạch tuộc chứa hàm lượng tương đối cao omega-3 – đây là vi chất tuyệt vời đối với sự phát triển trí tuệ của thai nhi. Bởi vậy, mẹ bầu ăn thịt bạch tuộc còn giúp thai nhi phát triển trí tuệ tốt hơn.</p>', 1)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (6, N'BÌNH ỔN GIÁ MÙA GIÃN CÁCH TẠI HIẾU HẢI SẢN', N'binh-on-giapng.jpg', CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'Tìm hiểu thêm qua số điện thoại 091.5555.437 - 091.3555.437', 1)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (7, N'VOUCHER HẢI SẢN ƯU ĐÃI MUA HÀNG TẠI HIẾU HẢI SẢN', N'banner-voucher.jpg', CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'<p>Tiếp Sức Qua Mùa Dịch Tặng Voucher
Yên tâm tại nhà mua hải sản nhận voucher không lo đi xa! khách hàng nên ở nhà để đảm bảo an toàn.. </p><p>Việc giao hải sản hãy để team nhà HIẾU phục vụ tận nơi hoàn toàn MIỄN PHÍ nha. Hỗ trợ FREESHIP cho khách hàng mua từ đơn hàng lần 2 trong nội thành HCM. ( khu vực Bình Chánh, Hóc-môn, Củ Chi, Quận 9, Nhà Bè,... sẽ được giảm tùy theo khu vực).</p><p>+ Ngoài 100 mặt hàng Hải sản tươi ngon chất lượng được lựa chọn kỹ càng để phục vụ khách yêu. NAY HIẾU GỞI TẶNG Thêm ĐẾN KHÁCH voucher trị giá đến 200K.
</p><p>
+ Ưu đãi đặc biệt TIẾP SỨC QUA MÙA DỊCH duy nhất chỉ 10 ngày từ 01/07/2021 đến 10/07/2021.

TẶNG VOUCHER_100K cho đơn hàng trên 1 triệu đồng.
TẶNG VOUCHER_200K cho đơn hàng trên 2 triệu đồng.
Mua hải sản tại HIẾU HẢI SẢN không chỉ có hải sản tươi ngon. Chúng tôi mang đến khách hàng dịch vụ bán hàng chuyên nghiệp nhất.

CHÍNH SÁCH HỔ TRỢ MUA HÀNG
Freeship toàn bộ cho khách đã mua hàng tại Hiếu từ lần 2.
Những khách xa các quận, huyện ngoại thành có thể phụ thêm phí giao hàng từ 20k-50k/ đơn tuỳ khu vực.
</p><p>Cảm ơn khách hàng đã yêu thương và tin tưởng team nhà Hiếu hơn 10 năm qua NHANH TAY nhận ưu đãi ngay chỉ 10 NGÀY nhé khách yêu.
</p><p>==========
****LƯU Ý: Mỗi voucher sẽ chỉ được sử dụng trong ngày.
==========
</p><p>
MUA HẢI SẢN - NHỚ GỌI HIẾU
</p><p>Hotline: 091. 5555.437 - 091. 3555. 437
</p><p>Cửa hàng: 62D/27 Nguyên Hồng, P.11, Bình Thạnh, TP.HCM
</p><p>Nhận báo giá: www.fb.com/hieuhaisan</p>', 1)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (8, N'CÁ HỒI NƯỚNG THÌ LÀ', N'ca-hoi-thi-la-sua.jpg', CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'<p>Nguyên liệu chế biến cá hồi nướng thì là
</p><p>- Cá hồi Nauy </p><p>

- Thì là, tỏi băm
</p><p>
- Đường, hạt nêm
</p><p>

Cách làm cá hồi nướng thì là
</p><p>

Bước 1: tẩm ướp cá hồi phi lê với tỏi băm,đường và hạt nêm cùng với lá thì là
</p><p>
Bước 2: cho vào lò nướng khoảng 5 phút sau đó đã có thể dọn ra và dùng được rồi
</p><p>
Thế là qua những bước đơn giản thì cả nhà đã có món cá Hồi nướng thì là thật ngon phải không nào. Ngoài món cá Hồi nướng thì là còn nhiều món rất ngon mà bạn có thể tham khảo thêm qua những bài viết bên dưới.

Cá hồi nguyên con sau khi đánh bắt được mổ sơ chế, ướp lạnh và vận chuyển bằng máy bay trong điều kiện bảo quản tối ưu trong thùng lạnh ở nhiệt độ 0-1*C.

Từ cá hồi nguyên con, cửa hàng sẽ phi lê phần thịt ngon nhất của cá. Loại bỏ hoàn toàn lớp xương và mỡ và bỏ luôn cả da nếu quý khách yêu cầu.</p>', 0)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (9, N'CÁ HỒI KHO BA RỌI', N'ca_hoi_kho_ba_roi.jpg', CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'<p>Cách chế biến món cá Hồi kho ba rọi, vừa đơn giản nhưng vừa ngon, thích hợp trong các buổi tiệc hoặc các buổi cơm gia đình. Ngoài món kho ba rọi thì cá Hồi còn nhiều món rất ngon mà bạn có thể tham khảo thêm qua những bài viết bên dưới.
</p><p>



Nguyên liệu chế biến cá hồi kho ba rọi
</p><p>
- Cá hồi phi lê
</p><p>
- Ớt, tỏi băm
</p><p>
- Đường, nước mắm
</p><p>
- Thịt ba rọi ngon
</p><p>
Cách làm cá hồi kho ba rọi
</p><p>

Bước 1: Bỏ thịt ba chỉ vào rang với tỏi và nước mắm
</p><p>
Bước 2: đổ thịt vô và kho chung với cá hồi
</p><p>
Bước 3: chờ cho tới khi món ăn sắc màu và kẹo nước
</p><p>
Bước 4: Chuẩn bị và dọn món ăn ra dĩa

cá hồi kho ba rọi
</p><p>

Thế là qua những bước đơn giản thì cả nhà đã có món cá Hồi kho ba rọi thật ngon phải không nào. Ngoài món cá Hồi kho ba rọi còn nhiều món rất ngon mà bạn có thể tham khảo thêm qua những bài viết bên dưới.



Cá hồi nguyên con sau khi đánh bắt được mổ sơ chế, ướp lạnh và vận chuyển bằng máy bay trong điều kiện bảo quản tối ưu trong thùng lạnh ở nhiệt độ 0-1*C.


Từ cá hồi nguyên con, cửa hàng sẽ phi lê phần thịt ngon nhất của cá. Loại bỏ hoàn toàn lớp xương và mỡ và bỏ luôn cả da nếu quý khách yêu cầu.</p>', 0)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (10, N'CÁ HỒI ÁP CHẢO', N'ca_hoi_ap_chao.jpg', CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'<p>Hiếu Hải Sản xin hướng dẫn mọi người cách chế biến món cá Hồi áp chảo, vừa đơn giản nhưng vừa ngon, thích hợp trong các buổi tiệc hoặc các buổi cơm gia đình.
</p><p>


Nguyên liệu chuẩn bị
Cá hồi Nauy phi lê
Ớt, tỏi băm
Đường, nước mắm
</p><p>Cách làm cá hồi áp chảo
cá hồi áp chảo
</p><p>
Bước 1: bỏ dầu vô chiên cá đều

cá hồi áp chảo
</p><p>
Bước 2: làm nước sốt. Bỏ 2 muỗng đường, tỏi, ớt băm, 1 muỗng rưỡi nước mắm trộn đều lại với nhau.

cá hồi áp chảo
</p><p>
Bước 3: Cá hồi phi lê đã chín vàng sau đó rưới nước sốt lên.

cá hồi áp chảo
</p><p>
Bước 4: Khi cá chín đều, tắt bếp và cho cá Hồi ra dĩa

cá hồi áp chảo

Thế là qua những bước đơn giản thì cả nhà đã có món cá Hồi áp chảo thật ngon phải không nào. </p><p>Ngoài món áp chảo thì cá Hồi còn nhiều món rất ngon mà bạn có thể tham khảo thêm qua những bài viết bên dưới.

Cá Hồi Phi lê giá bao nhiêu
 cá hồi nauy nguyên con

Tại Hiếu Hải Sản đang có bán cá hồi Na Uy nguyên con (5 - 7kg/con)

cá hồi nauy phi lê

hoặc cá Hồi Nauy phi lê lẻ 500g hoặc 1kg/miếng
</p><p>
LIÊN HỆ MUA CÁ HỒI
</p><p>Cửa hàng HIẾU HẢI SẢN

Chuyên cung cấp hải sản tươi sống chất lượng uy tín cao
</p><p>Địa chỉ: 62D/27 Nguyên Hồng, Phường 11, Quận Bình Thạnh, TP.HCM
Hoặc gọi số: O91 55 55 437 - O91 35 55 437</p>', 0)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (11, N'CUA RANG MẶN', N'cua_rang_man.jpg', CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'<p>Cua rang mặn luôn làm người ăn thương nhớ bởi vị mặn ngọt hấp dẫn khó tìm ở các món ăn khác. Vị ngọt cùng mùi tiêu thơm nồng quyện lẫn vị mặn đặc trưng của cua luôn làm cho nhà chúng ta hao cơm đấy
</p><p>
Không quá khó hay cầu kỳ đâu, nàng nào chưa đảm nữ công gia chánh vẫn thực hiện được
</p><p>
Hãy dành 5 phút tìm hiểu để biết được tuyệt chiêu làm cua rang này bạn nhé!
</p><p>
 



 

Thành phẩm : </p><p>

 



 

 

Nguyên Liệu Bao Gồm : 

1 kg cua biển

1 ít hành tím, tỏi, ớt băm nhỏ

1 ít hạt nêm, tiêu

1 gói bột chiên giòn nhỏ

1 ít dầu hào
</p><p>
 

Quy Trình Chế Biến Như Sau : </p><p>

Bước 1 : Cua làm sạch, để riêng gạch cua, cắt miếng vừa ăn, càng cua đập dập
</p><p>
 



 

Bước 2 : Xóc cua với ít bột chiên giòn, bắt chảo dầu nóng chiên sơ cua
</p><p>
 



  

Bước 3 : Vớt cua ra để ráo, cho hành tỏi và ớt vào phi vàng, cho gạch cua vào xào. Cho dầu hào, gia vị và cho cua vào đảo đều cho thấm gia vị
</p><p>
 

Bước 4 : Nhắc xuống nêm tiêu và trang trí ngò rí cho đẹp mắt

 



 

Chúc cả nhà thực hiện thành công và ngon miệng ^^</p>', 0)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (12, N'CUA RANG MUỐI KIỂU HỒNG KÔNG', N'cua_rang_muoi_hk.jpg', CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'Bạn có thể chế biến rất nhiều món từ cua nhưng cách làm cua rang muối ớt kiểu Hồng Kông sẽ đem đến cho bạn một món ăn hấp dẫn và mới lạ. Bạn hãy lưu lại công thức với hướng dẫn tỉ mỉ và chi tiết dưới đây để trổ tài ngay nhé!

Cua là món ăn yêu thích của bất cứ tín đồ hải sản nào, bởi hương vị thơm ngon. Thành phần dinh dưỡng của cua rất phong phú có nhiều canxi cũng như vitamin, nhất là vitamin nhóm B, axit béo và omega 3. Với cách chế biến theo kiểu Hồng Kông này, bạn sẽ có một món cua vừa cay cay, vừa mặn mặn, cực kì kích thích vị giác.

 



 

Cách làm cua rang muối ớt kiểu Hồng Kông :

Nguyên liệu làm cua rang muối ớt kiểu Hồng Kông :

800gr cua biển

50gr tôm khô

5gr bột ớt

50gr chà bông

10gr ngũ vị hương

100gr hành tây

100gr ớt chuông

25gr hạt điều

50gr tỏi

Hành lá

Hành khô

Bột chiên xù

Gia vị: muối, hạt nêm, bột ngọt, tiêu, đường

 



 

Các bước làm cua rang muối ớt kiểu Hồng Kông

Bước 1: Sơ chế nguyên liệu

Cua khi mua về nếu vẫn còn dây cột bạn nên để nguyên dây, sau đó lật yếm cua có hình tam giác dưới bụng lên, dùng mũi dao chọc thẳng vào chỗ hõm dưới bụng cho chân và càng cua duỗi ra. Khi thấy chân và càng cua đã duỗi ra hoàn toàn thì dùng kéo hoặc dao cắt bỏ hết dây buộc.

Dùng bàn chải chà sạch xung quanh, đặc biệt là phần hai bên hông cua, đây là nơi bám rong rêu nhiều nhất do đó cần chà kỹ.

Dùng tay tách bỏ phần yếm cua và các lông cua phía bên trong yếm.

Tách mai cua ra khỏi thân, loại bỏ hết chất bẩn trong thịt cua, cắt thân cua làm đôi. Gỡ càng cua ra và đập dập tùy thích.

Hành tím, tỏi bóc vỏ, rửa sạch rồi băm nhuyễn.

Hành lá bỏ gốc, rửa sạch, cắt khúc.

Ớt rửa sạch, cắt khúc nhỏ.

Hành tây bóc vỏ, rửa sạch, cắt nhỏ.

Bước 2: Ướp và chiên cua

Cho muối, hạt nêm, bột ngọt, tiêu, tỏi băm và hành tím băm nhuyễn vào ướp với cua, trộn đều để ngấm gia vị.

Ướp từ 10-15 phút thì đem cua đi tẩm với bột chiên.

Bắc chảo lên bếp, chiên cua trong chảo ngập dầu đến khi cua vàng đều thì vớt ra để ráo dầu. Lưu ý dầu phải thật nóng già để cua nhanh chín ở bên trong và bên ngoài thì vàng giòn, như vậy cua sẽ đẹp mắt mà vẫn có mùi thơm rất đặc trưng.



 

Bước 3: Làm muối ớt rang cua

Trong một chảo sạch cho tôm khô, hạt điều và 1/2 chén bột chiên xù vào rang sơ qua.

Trút ra tô cho chà bông, muối, hạt nêm, bột ngọt, đường, tiêu, ngũ vị hương, bột ớt vào, trộn đều. Cho hết tất cả vào máy xay nhuyễn.

Bước 4: Rang cua với muối ớt

Đổ dầu vào chảo nóng, thêm hành tím, tỏi băm, hành tây, hành lá, ớt chuông vào xào thơm.

Cho cua và muối rang đã xay nhuyễn vào, trộn đều cho thấm gia vị. Tiếp tục xào thêm khoảng 10 phút với lửa lớn thì tắt bếp.

Trút cua ra đĩa và trang trí theo ý.', 0)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (13, N'CUA RANG TỎI', N'cua_rang_toi.jpg', CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'Từ những nguyên liệu đơn giản, quen thuộc, nhưng dưới bàn tay của những người nội trợ khéo léo cùng đồng hành với góc ẩm thực của hiếu hải sản sẽ chế biến được món cua rang tỏi ớt lạ miệng và vô cùng hấp dẫn!

1. Các nguyên liệu chế biến cua rang tỏi ớt

 



 

- Cua thịt: 1 kg

- Tỏi băm nhuyễn: 200 gr

- Hành tím băm nhuyễn: 30gr

- Ớt: 1 trái

- Gừng Hành lá

- Súp bột chiên giòn

- Gia vị: hạt nêm, đường, muối,…

2. Cách chế biến cua rang tỏi ớt

 



 

 

Bước 1: Cua làm sạch, chặt thành miếng, không quên cắt bỏ phần chân nhọn. Dùng dao đập nhẹ cho càng cua hơi bể, không nên đập mạnh càng sẽ bị nát, cho cua ra rổ để ráo nước.

Bước 2: Ớt và gừng băm nhuyễn.

Bước 3: Đặt chảo lên bếp, đun nóng dầu, phi thơm tỏi.

Bước 4: Nêm cua với một ít hạt nêm, muối trắng rồi chiên chín, sau đó vớt ra để ráo dầu. Dùng luôn chảo chiên cua cho cua, tỏi phi, hành tím, gừng, ớt băm nhuyễn vào trộn đều và rang chung. Sau đó nêm nếm gia vị vừa đủ, tiếp đó cho hành lá vào đảo đều rồi tắt bếp.

 ', 0)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (14, N'CUA RANG ME', N'cua_rang_me.jpg', CAST(N'2021-12-15T00:00:00.000' AS DateTime), N'Vị chua chua thanh mát của những trái me tỏa hương trong cách làm cua rang me cùng vị cay cay thơm nồng nàn của tỏi, ớt và vị ngọt dịu của đường, tất cả hòa quyện cùng mùi thơm rất ngọt của cua khiến ai cũng mê mẩn muốn ăn mãi không thôi. Món này cũng khá là đơn giản dễ làm, mọi người thử vào bếp cùng mình nhé.



 

Nguyên Liệu Bao Gồm :

4 con cua

1 túi me vắt Nước đường, hạt nêm, tỏi, ớt, bột năng, tiêu

 

Các bước :

Bước 1 : Cua đem rửa sạch, tách phần mai ra. Cá nhân mình thích để nguyên gạch ở mai con cua chứ không lấy ra ^^. Tỏi bóc thật nhiều rồi đập dập, xắt nhỏ. Ớt 1 quả xắt nhỏ. Bỏ cua vào bát lớn chho một ít tiêu, một ít hạt nêm, 1/3 nước me vắt vào, ướp tầm 20 phút.

 



 

Bước 2 : Hai phần nước me vắt còn lại bỏ ra bát khác, thêm nước ấm rồi cho nước đường vào quấy đều. Sao cho vừa khẩu vị chua ngọt mà bạn ưng ý. Phần me này bạn nhớ bỏ hạt và bã ra chỉ lấy phần nước mà thôi.

 

Bước 3 : Bắc nồi lên bếp, đổ dầu ăn vào đun nóng. Rồi cho tỏi vào phi thơm. Tiếp đến, cho nước me vào cùng cua. Đậy vung, để lửa nhỏ cho cua chín và thật ngấm sốt. Lúc cua đã chín thì cho thêm ớt và đun thêm lúc nữa. Rồi nêm nếm lại cho vừa khẩu vị của bạn.

 



 

Bước 4 : Sau khi, cua đã ngấm sốt thì lấy ra đĩa và măm măm thôi.', 0)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (15, N'CUA RANG MUỐI', N'cua_rang_muoi.jpg', CAST(N'2021-12-19T00:00:00.000' AS DateTime), N'Cua rang muối (cua rang muoi) luôn làm người ăn thương nhớ bởi vị mặn ngọt hấp dẫn khó tìm ở các món ăn khác. Vị ngọt cùng mùi tiêu thơm nồng quyện lẫn vị mặn đặc trưng của hải sản luôn làm cho nhiều người tò mò về cách chế biến món ăn này. Tuy là một món ăn cầu kỳ nhưng luôn có các tuyệt chiêu dành cho những nàng chưa đảm nữ công gia chánh. Hãy dành 5 phút tìm hiểu để biết được tuyệt chiêu làm cua rang muối này bạn nhé!



 

Nguyên liệu làm cua rang muối gồm có:

Cua biển: 4 con ( khoảng 1-1,8 kg)

4 Thìa cafe muối

5 tép tỏi băm Dầu ăn, dầu mè Giấm ăn Gia vị gồm: hạt tiêu xay, đường, bột ngọt, xuyên tiêu( đã xay nhuyễn)

1 quả chanh

 



 

Cách làm cua rang muối ngon như sau:

Để có món cua rang muối ngon thì hãy chọn cua ngon. Đây là điều rất quan trọng, bạn hãy lưu ý chọn cua có màu ngả nâu, thịt săn và tươi sống.



 

Cách sơ chế cua:

Bước 1: Sau khi mua cua về bạn hãy để nguyên phần dây buộc càng rồi lật cua lên. Tiếp đó dùng dao chọc vào phần hõm của yếm đến khi cua không còn cử động.



 

Bước 2: Tiếp đến là gỡ dây buộc rồi tiến hành rửa sạch, lột mai và yếm cua. Sau đó ướp gia vị gồm muối và đường với thịt cua trong khoảng 20-30 phút cho ngấm.

Lưu ý: Với những con cua to thì bạn hãy cắt thành 2 hoặc 4 phần và càng cứng thì nên đập giập nhằm giúp thịt cua ngấm gia vị sẽ tạo độ đậm đà cho món ăn.

Cách thực hiện làm cua rang muối (cua rang muoi) ngon:

Bước 1: Đầu tiên bạn hãy trộn đều: 3 tép tỏi băm nhỏ, 1/2 thìa cafe tiêu bột, 2 thìa dầu hào, 1 thìa cafe muối, 1 thìa xuyên tiêu và một chút dầu mè.

Bước 2: Bạn phi thơm tỏi trên chảo dầu sôi rồi tiến hành vớt bỏ tỏi đã vàng nhằm tránh bị cháy khét. Sau đó cho thịt cua và mai cua vào dầu chiên vàng rồi gắp ra rổ để ráo dầu.



 

Bước 3: Tiếp theo là múc bớt dầu chiên trong chảo cho đến khi còn chừng 2 -3 muỗng dầu thì đổ hỗn hợp gia vị đã trộn trước đó vào đun sôi rồi đổ cua vào trộn đều. Lưu ý, bạn nên xào ở chế độ lửa lớn trong khoảng 10 -15 phút cho thịt cua ngấm đều gia vị.

Bước 4: Các bạn chỉ cần cho thành quả của bạn ra đĩa và mời cả nhà thưởng thức nữa thôi đấy. Nhớ xếp thịt cua thành từng con rồi úp mai lên cho đẹp mắt nhé. Nếu thích ăn đậm đà, bạn có thể pha thêm nước chấm với công thức đơn giản sau: hạt tiêu, hành củ băm nhuyễn, 1 thìa cafe muối, đường và chanh.', 0)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (16, N'CUA NƯỚNG PHÔ MAI', N'cua_nuong_pho_mai.jpg', CAST(N'2019-09-22T00:00:00.000' AS DateTime), N'Phô mai béo ngậy quyện cùng thịt cua dai và thơm ngon nhất định sẽ là món ăn mà các bé nhà bạn rất ưa thích đấy. Cách làm cua nướng phô mai không khó, cũng không cầu kỳ sẽ giúp bé nhà bạn ăn nhiều và ngon miệng hơn. Cuối tuần đến rồi xắn tay vào bếp và thực hiện món ăn nha.

 

 

 

1. Nguyên liệu

-  1 con cua 500g

-  200g nạc cua

-  100g giò sống

-  1 muỗng canh hành boa rô băm

-  1 muỗng canh dầu ăn

-  1/3 muỗng café đường

-  2 muỗng café tiêu trắng

-  ½ muỗng café muối

- 1 muỗng canh phô mai bột

- Giấy nhôm gói cua

- Chanh cắt lát



 

2. Cách làm cua nướng phô mai

-  Cua rửa sạch rồi đem hấp chín, gỡ lấy phần nạc cua, chú ý giữ lại càng và mai cua.

-  Mai cua rửa sạch cả bên trong lẫn bên ngoài và lau khô.



 

-  Trộn thịt cua với giò sống, boa rô, tiêu, đường và 1 muỗng café dầu ăn. Thoa một ít dầu ăn vào lòng mai cua, cho hỗn hợp thịt cua và giò sống vừa trộn vào, rắc bột phô mai lên trên và ấn chặt.

-  Cắt giấy nhôm vuông khoảng 30cm dùng để gói cua, gói thật chặt và cho vào lò nướng. Khi chín sẽ lấy ra cắt bỏ lớp giấy nhôm bao ngoài mai cua.



 

- Tiếp tục cắt thêm một miếng giấy nhôm có kích thước bằng đường kính của lòng đĩa rồi xếp vào đĩa, bày mai cua lên chú ý để phần nạc ngửa lên rồi xếp càng vào như 1 con cua nguyên vẹn. Trang trí thêm bằng chanh cắt lát và dọn dùng nóng.

', 0)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (17, N'CUA NƯỚNG MUỐI ỚT', N'cua-rang-muoi-hai-phong-cuc-chuan.jpg', CAST(N'2019-09-22T00:00:00.000' AS DateTime), N'Với sắc đỏ của cua cùng với vị cay của ớt và vị đậm đà từ từng thớ thịt cua sẽ khiến bạn không thể cưỡng lại đâu nha, vậy hãy cùng hieuhaisan xắn tay vào bếp nào. ^^



Chuẩn bị nguyên liệu : 

- 1kg Cua

- 50gr Ớt bột

- 2 quả ớt sừng

- Màu điều: đây là gia vị cũng rất dễ mua, bạn có thể mua ở siêu thị hoặc quán tạp hóa đều có nha. Màu điều sẽ giúp món cua nướng của bạn có màu sắc hấp dẫn hơn

- Dầu hào

- Hạt tiêu xay

- Tỏi, chanh, tương ớt

- Một số loại gia vị khác: muối, bột nêm, mắm, dầu ăn

- Rau thơm: tùy theo sở thích bạn có thể mua rau mùi, rau diếp, rau mùi tàu…

Chế biến nguyên liệu : 

- Với Cua: Bạn để nguyên con rửa sạch với nước lạnh, có thể pha thêm chút muối nha. Sau đó vớt để ráo nước nha.

- Tỏi: Băm nhỏ

- Ớt: bỏ cuống, bổ dọc ớt và bỏ phần hạt

- Rau thơm: Nhặt lấy phần non, ngâm với nước muối 15 phút rồi sau đó rửa sạch để ráo nước

Các bước làm món Cua nướng muối ớt : 

Ướp Cua

- Với các gia vị trên bạn sẽ dùng để ướp cua như sau: Để cua vào nồi thật to để có thể trộn gia vị cho dễ nha. Tiếp đến bạn cho 50gr ớt bột, 1 thìa dầu hào, 1 thìa hạt tiêu xay, vài nhánh tỏi đã băm nhỏ, 1 thìa nước cốt chanh, 1 thìa mắm, ½ thìa muối 1 thìa bột nêm và 1 thìa dầu ăn vào nồi trộn sao cho đều để cua có thể ngấm gia vị nha.

- Bạn nên ướp cua ít nhất là 15 phút nha, nếu có thời gian thì 30-45 phút càng tốt nha.

  Trên đây là gia vị để ướp cua thông thường, nên bạn có thể thêm bớt một số loại gia vị cũng như lượng dùng để phù hợp với khẩu vị gia đình mình.

Muối ớt

  Cách làm muối ớt rất đơn giản và nó tương tự giống như cách làm muối ớt của món Tôm nướng muối ớt. Bạn có thể tham khảo cách sau: Với 2 trái ớt sừng đỏ ở trên cộng với 2 thìa muối hạt, ½ thìa bột ngọt, tiêu sọ tách hạt bạn cho cùng vào cối và giã thật nhỏ. Sau khi giã xong bạn cho ra từng đĩa nhỏ phù hợp với lượng người ăn, khi ăn cho thêm 1 thìa nước cốt chanh nữa là bạn đã có 1 đĩa muối chanh ớt cực ngon cho món Cua nướng rồi đó.

Nướng cua

  Sau khi Cua đã ngấm gia vị, bạn chỉ cần đặt cua lên trên vỉ nướng Bếp than hoa và chờ đến khi thấy cua chuyển sang sắc màu đỏ tươi hấp dẫn và mùi thơm cay cạy đậm là bạn có thể thưởng thức món Cua nướng muối ớt rồi

  Sau khi Cua đã chin bạn đặt lên đĩa và có thể trang trí với các loại rau xanh, hay cà rốt để món cua thêm hấp dẫn nha.

  Như vậy, với những bước đơn giản là bạn đã làm được món Cua nướng muối ớt rất tuyệt rồi, vậy còn chần chờ gì nữa mà cuối tuần này bạn không đi chợ và nấu món Cua nướng cực ngon này cho gia đình', 0)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (18, N'CÁCH NẤU MÓN CUA NƯỚNG MỌI CỰC KÌ HẤP DẪN VÀ DỄ LÀM CHO CẢ NHÀ', N'cua-nuong_moi.jpg', CAST(N'2019-09-21T00:00:00.000' AS DateTime), N'Chuẩn bị nguyên liệu :

- Cua biển: bạn nên chọn những con cua khoảng 400-500gr, mai màu tươi nha

- Rau răm

- Ớt, chanh

- Gia vị: mắm, muối, đường, tiêu, xì dầu

- Dụng cụ: Bếp nướng than hoa

Cách làm món Cua nướng thơm ngon tại nhà :

 

Bước 1: Sơ chế nguyên liệu

- Cua biển mua về để cả con, làm sạch cua bằng cách dùng bàn chải chà đều mình con cua cho đến khi hết phèn, sình trên mình cua sau đó rửa sạch bằng nước muối loãng, sau đó để ráo nước

- Ớt: bỏ bớt hạt và thái chéo

- Chanh: Vắt lấy nước cốt

- Rau răm: nhặt lấy phần non, rửa sạch, để ráo nước

 

Bước 2: Ướp cua

Bạn cho 2 thìa xì dầu, 1 thìa mắm, 1 thìa đường, ½ thìa muối và 1 xíu tiêu xay trộn đều sau đó phết đều lên mình cua. Để 15 phút thịt cua ngấm gia vị nha

 

Bước 3: Nướng cua

  Sau khi than đã hồng bạn đặt úp cua lên vỉ nướng nướng vởi lửa riu riu, khoảng 15 phút khi bạn thấy giữa mai cua có một đốm vàng gạch , phía dưới yếm có màu vàng xém và cảm nhận được mùi cua nướng tỏa hương thơm nức mũi là cua đã nướng chín rồi và có thể thưởng thức được nha.

  Với món cua nướng thơm ngon trên bếp nướng than hoa này bạn nên thưởng thức khi còn nóng hổi thì sẽ xảm nhận được vị đặc biệt hơn rất nhiều đó là vị thịt cua chín mềm cùng với nước từ thịt cua ngọt ngọt cay cay hấp dẫn , phần gạch cua sánh sánh đậm đặc không thể diễn tả hết vị ngọt béo bùi , nức mùi của món cua nướng mọi ngon này. Và tuyệt vời nhất là ăn cùng rau răm , muối tiêu chanh hoặc ớt chanh là chuẩn số một luôn rồi.

  Nghe vô cùng hấp dẫn không thể cưỡng lại phải không, vậy hãy cùng xách giỏ đi chợ và chế biến món cua nướng mọi này thôi nào, một món nướng cay cay ngọt ngọt trên bếp nướng than hoa cùng gia đình quay quần cuối tuần vừa dân giã lại rất bổ dưỡng đó nha.', 0)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (19, N'CÔNG THỨC NẤU MÓN CUA HẤP MUỐI CỰC NGON CỦA HIẾU', N'cua_hap.jpg', CAST(N'2021-09-20T00:00:00.000' AS DateTime), N'Nguyên Liệu Chế Biến Bao Gồm :

1 con cua to

1 chén muối hạt

1 cây sả to Muối ớt xanh, rau răm

Các Bước Chế Biến Như Sau : 

Bước 1 : Cua để ngăn đá tủ lạnh 30 phút. Lấy ra dùng đũa đâm vào yếm cua để cua thật sự chết, như vậy khi hấp không sợ bị gãy càng nha! tháo dây cột dùng bàn chải chà rửa sạch sẽ bùn đất xung quanh cua



Bước 2 : Cho 1 lớp muối hột vào thố đất, trải thêm lớp sả



Bước 3 : Rồi cho cua vào. Đậy nắp lại. Nấu chín cua(khi thấy cua chuyển sang màu đỏ) tầm 20 phút



Bước 4 : Cua chín rồi nè! Màu đỏ đẹp



Bước 5 : Thưởng thức thôi nha! Có thể ăn kèm nước chấm muối ớt xanh hoặc muối tiêu chanh!

', 0)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (20, N'MUA CHÂN CUA TUYẾT GIÁ RẺ NHẬN NGAY ƯU ĐÃI, QUÀ TẶNG KÈM', N'cua-tuyet-gia-re.jpg', CAST(N'2019-06-19T00:00:00.000' AS DateTime), N'Chân Cua Tuyết 1kg giá giảm mạnh từ 620.000đ chỉ còn 550.000đ. Bởi lí do cua tuyết đang vào mùa đánh bắt, Quý Khách nhanh tay chốt "Deal" và nhận ngay ƯU ĐÃI hấp dẫn tại HIẾU HẢI SẢN.

banner chan cua tuyet

+ Cua tuyết là loại hải sản quý hiếm thường sống ở các vùng biển lạnh. Cũng có đặc tính chân dài như Cua Hoàng Đế Alaska, nhưng lại có ngoại hình khiêm tốn và nhỏ hơn rất nhiều.

+ Hải sản nhập khẩu áp dụng quy trình: Cua tuyết sau khi được đánh bắt có chọn lọc, sẽ được bỏ mai, làm sạch ruột và đưa vào hấp chín và cấp đông nhanh, đây là quy trình khép kín để bảo quản chất lượng hải sản.

+ Chân Cua Tuyết là một món ăn nổi tiếng khắp Thế Giới, từ Âu sang Á và thường xuất hiện phổ biến ở Nhật và Hàn Quốc. Sự hấp dẫn của Loài Cua này được đánh giá cao nằm ở phần thịt có màu trắng sữa, ngọt giòn thớ thịt săn chắc, và đậm đà hương vị đặc trưng riêng cua Tuyết.', 1)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (21, N'TRI ÂN KHÁCH HÀNG GIẢM GIÁ ƯU ĐÃI HẤP DẪN DUY NHẤT NĂM 2021', N'bao-ngu-lon.jpg', CAST(N'2020-12-20T00:00:00.000' AS DateTime), N'BÀO NGƯ ĐÓNG HỘP - NHẬP KHẨU TỪ AUSTRALIA

+ GIÁ BÁN: 1,700,000đ/LON - GIẢM CÒN: 1,350,000đ/LON. (Qúa hấp dẫn, khách còn chần chờ gì nữa...)

+ Chương trình bắt đầu từ ngày 17/4/2021 cho đến hết ngày 1/5/2021.
Nhanh tay rinh ngay trong dịp này, dành tặng những món quà ý nghĩa cho gia đình mình, VỪA NGON LẠI VỪA BỔ.

giam-gia-bao-ngu-lon
giảm giá bào ngư lon Úc cực shock

bao-ngu-lon-dong-hop
hộp quà tặng bào ngư sang trọng

tri-an-khach-hang
tri ân khách hàng giảm giá hấp dẫn

- Bào ngư được coi là một trong những sản phẩm quý của biển vì sống trong môi trường khá khắc nghiệt, sản lượng thấp và được đánh giá là 1 trong 8 thứ quý giá của biển.

HÃY MAU MAU NHANH TỚI HIẾU HẢI SẢN ĐỂ RINH NGAY VỀ CHO MÌNH NHA', 1)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (22, N'CHÂN CUA ALASKA - CHÂN CUA CANADA: LOẠI NÀO NGON', N'chan-cua-alaska-kingcrab.jpg', CAST(N'2019-12-12T00:00:00.000' AS DateTime), N'Chân cua Alaska và Chân cua Canada, đang rất được nhiều khách hàng ưa chuộng bởi hơn hết sự ân cần phục vụ của HIẾU HẢI SẢN tạo niềm tin nơi thương hiệu.

Khách hàng có thể trực tiếp cảm nhận được sản phẩm tại chổ, tận mắt cầm trên tay chân cua tại shop và xem chất lượng của thịt cua… Shop hổ trợ giao hải sản tận nhà tại Sài Gòn.
Chân cua alaska nhập khẩu

Chân cua Alaska - hay là chân cua king crab, chân cua hoàng đế chính là hải sản nhập khẩu từ ALASKA, Bắc Mỹ. Tại nhà máy chế biến thuỷ hải sản Alaska, chân cua được qua hấp chín đông lạnh, áp dụng đúng tiêu chuẩn quốc tế IQF nên vẫn giữ được nguyên vẹn hương vị tươi ngon vốn có như cua sống.

Cửa hàng Hiếu Hải Sản là nhà cung cấp chân cua uy tín với giá tốt nhất trên thị trường. Bên cạnh đó, chúng tôi cũng có dịch vụ ưu đãi khuyến mãi cho khách đặt hàng tại SHOP. Liên hệ mua chân cua tại website: hieuhaisan.com hoặc Fanpage: fb.me/hieuhaisan ✯ Gọi Hotline 0915.555.437 - 0913.555.437 Kênh hổ trợ tư vấn bán hàng (từ 7h00 sáng đến 18h00 chiều)

Cách sử dụng chế biến Chân cua Alaska rất đơn giản. Chỉ cần hấp sơ cho nóng là dùng món ngay tại chổ hoặc chế biến cầu kỳ hơn như món cua hoàng đế sốt cajun, cua hoàng đề rang me đậm đà, cua hoàng đế nướng bơ tỏi...

»xem thêm: cua hoàng đế tươi sống

Chân cua Canada hay chân cua tuyết là phần chân thân cua được tách đôi từ cua sống. Cua Tuyết được đánh bắt và bảo quản lạnh để giữ độ tươi của thịt cua, sau đó chân cua tuyết được chế biến tại nhà máy sản xuất thuỷ hải sản Canada, chân cua tuyết được đánh giá cao về chất lượng và giá trị dinh dưỡng nên được các nhà hàng và khách lẻ sử dụng rất nhiều.

Chân cua Tuyết tuy là hải sản Canada, nay đã được Hiếu Hải Sản nhập khẩu về Việt Nam và cung cấp hải sản tại TPHCM. Khách hàng mua chân cua chỉ cần đăt hàng online tại website: hieuhaisan.com hoặc Fanpage: fb.me/hieuhaisan ✯ Gọi Hotline 0915.555.437 - 0913.555.437 - Kênh hổ trợ tư vấn bán hàng (từ 7h00 sáng đến 18h00 chiều)

Cách sử dụng chế biến chân cua tuyết canada với các món ăn: rang me, rang tỏi, rang chà bông, hấp muối chanh, hấp gừng, bánh canh cua, nấu lẩu...

VẬY CHÂN CUA ALASKA VÀ CHÂN CUA TUYẾT CANADA LOẠI NÀO NGON
Tuỳ vào khẩu vị của khách hàng. Shop xin chia sẻ vài thông tin hữu ích gửi đến khách hàng khi chọn mua chân cua phù hợp để dùng.

- Chân cua Alaska vị mặn đậm đà chất riêng, với lớp thịt trắng dày dai sần sật. Khi dùng món chân cua nên cần có dụng cụ để tách vỏ cứng bạn có thể dùng dao hoặc kéo lớn để tách thịt cua.

- Chân cua tuyết có kích cỡ nhỏ hơn so với chân cua alaska, nhưng vị ngọt lịm thanh và lớp vỏ ngoài mỏng nhẹ dễ dàng tách thịt, bạn có thể dùng tay không để tách thịt cua.', 1)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (23, N'ĂN TÔM CÀNG ĐỎ NAUY ĐÚNG CÁCH NHƯ THẾ NÀO', N'tom-cang-do-nauy-19.jpg', CAST(N'2019-01-19T00:00:00.000' AS DateTime), N'Hãy cùng xem cách chế biến và tách thịt tôm càng đỏ Nauy để ăn đúng cách như thế nào nhé!! Hiếu Hải Sản Thương hiệu Hải Sản thành lập từ năm 2007✯Uy tín hơn 12 năm trong lĩnh vực bán lẻ hải sản✯Giao hàng nhanh chóng trong ngày✯

', 1)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (24, N'ĂN MỰC TRỨNG NGON KHÔNG - GIÁ MỰC 1KG BAO NHIÊU', N'nuong-muc-trung.jpg', CAST(N'2021-12-22T00:00:00.000' AS DateTime), N'Bạn đã ăn mực trứng chưa? Giá mực 1kg bao nhiêu tiền? Nên mua mực trứng tươi sống, phần đầu không bị đứt rời khỏi thân, túi mực không dập, da sáng óng ánh, mắt trong xanh. còn nguyên lớp vỏ không bị trầy xước hay bị bợt da. Trên thân có nhiều chấm nhỏ. Mực trứng ngon sẽ có vị ngon ngọt tự nhiên của râu mực, thịt dẻo săn chắc và vị béo ngậy của trứng mực. Nhưng không phải ai cũng biết lựa chọn mực trứng tươi ngon, bổ dưỡng và có nhiều trứng.


Giá 1kg mực trứng tùy thuộc vào độ tươi, tỉ lệ trứng, hiện nay là 250.000đ/kg khoảng 30 con, mực trứng cao cấp loại 1.
', 1)
INSERT [dbo].[TinTuc_VaoBep] ([ID_TinTuc], [TieuDe], [HinhAnh], [NgayTao], [NoiDung], [Status]) VALUES (25, N'GHẸ XANH LÀM MÓN GÌ NGON', N'dac-san-nha-trang-6.jpg', CAST(N'2021-05-16T00:00:00.000' AS DateTime), N'Muốn hấp ghẹ ngon không hề khó như mọi vẫn nghĩ mà lại khiến món ăn trở nên tươi ngon, đậm đà hơn. Với các kinh nghiệm bổ ích sau sẽ giúp cho các chị em chế biến được những món ăn ngon và mới lạ cho gia đình thân yêu của mình. Giá ghẹ xanh tươi sống


GHẸ HẤP BIA SẢ
Nguyên liệu

1 kg ghẹ sống
4 củ sả
Muối tiêu, chanh, ớt
Cách làm
- Mua ghẹ sống còn nguyên con, nhìn tươi xanh, càng to và bấm vào phần thân thấy rắn chắc. Không nên lựa chọn những con ghẹ quá to hay quá nhỏ, yếm mềm và mọng nước đều không ngon.

- Dùng một chiếc đũa chọc nhẹ vào miệng con ghẹ để ghẹ chết thật nhanh, không tháo dây buộc càng và rửa thật sạch phần mai, thân, càng của ghẹ, để cho ráo nước.

- Chuẩn bị nồi hấp cách thủy, thay phần nước trong nồi bằng 1 lon bia. Sau đó, cho củ sả đã rửa sạch, cắt khúc, đập dập vào để lót dưới đáy vỉ hấp.

- Đậy nồi hấp lên bếp, đun sôi bia cho tới khi có mùi thơm thì cho ghẹ đã sơ chế vào, đậy nắp vung lại và tiếp tục đun lửa to cho hơi sả, bia bốc lên thấm mùi thơm vào thịt ghẹ.

- Ngoài ra, tùy khẩu vị của từng người mà có thể chuẩn bị thêm chanh, ớt và ít mù tạt chấm kèm để hương vị món ghẹ hấp bia sả thêm đậm đà hơn.

GHẸ HẤP LÁ CHANH
Nguyên liệu

Ghẹ tươi: tùy thuộc vào số lượng người ăn
Bột me
3 muỗng nước lọc hoặc nước dừa
Đường, muối, hạt tiêu, ớt tươi
Nồi hấp
Cách làm
- Chọn những con ghẹ còn khỏe và chắc để tăng độ ngon cho món ăn. Khi sơ chế, để giảm bớt mùi tanh thì có thể ướp ghẹ với dấm và rượu trắng.

- Chuẩn bị nồi hấp chuyên dụng, cho ghẹ vào nồi và thêm vài lá chanh đã thái nhỏ. Thời gian ghẹ hấp chín đều nhất là khoảng 10 - 15 phút, nếu để hấp quá lâu ghẹ sẽ bị mất hết chất dinh dưỡng.

- Pha chế nước chấm: cho đường, ớt, bột me, nước dừa vào chiếc bát nhỏ; khuấy đều và nêm nếm cho vừa ăn.

- Khi ghẹ có màu đỏ au cùng mùi lá chanh thơm lừng thì ghẹ đã chín, sau đó trình bày ra đĩa, thưởng thức khi nóng và chấm nước chấm đã pha sẵn.

GHẸ HẤP GỪNG TỎI
Nguyên liệu

1 con ghẹ biển lớn
20g gừng
10g rau mùi
20g hành lá thái nhỏ
1 củ tỏi
Gia vị: nước mắm, dầu ăn, rượu vang nấu ăn
Cách làm
- Mua ghẹ tươi và phần yếm khép kín sẽ ngon hơn. Sau đó, ướp với các loại gia vị và rưới nước mắm tỏi gừng lên phía trên.

- Tỏi, gừng cạo sạch vỏ, băm nhỏ; rau mùi, hành lá rửa sạch và thái nhỏ.

- Cho khoảng 500ml nước sôi vào nồi hấp, cho 6 lát gừng và ghẹ vào hấp cách thủy trong khoảng 15 phút. Khi ghẹ có màu đỏ au cùng mùi thơm của gừng thì ghẹ đã chín.

- Mang món ghẹ hấp gừng tỏi ra đĩa, rắc thêm chút rau mùi và hành lá băm nhỏ lên trên, thưởng thức cùng muối tiêu chanh.

GHẸ HẤP NƯỚC DỪA
Nguyên liệu

1kg ghẹ tươi
1 nhánh tỏi tây
1 nhánh cần tây
1 củ gừng nhỏ
2 cây sả
1/2 thìa cà phê muối tinh
1 quả dừa tươi
Cách làm
- Chọn những con ghẹ xanh làm sạch và để ráo nước. Gừng đem đập dập, băm nhỏ; sả cắt khúc và cần tây, tỏi tây cũng rửa sạch, cắt khúc.

- Dừa gọt vỏ, tỉa khoanh tròn và chắt lấy khoảng 500ml nước dừa.

- Cho nước dừa tươi vào nồi, đập dập hành tím, băm nhỏ và nấu nước dừa cho sôi, rồi thêm hạt nêm, muối cho vừa ăn. Sau đó, cho ghẹ vào và luộc khoảng 12 - 15 phút là chín.

- Khi thấy ghẹ chuyển sang màu đỏ au thì vớt ra, đun lại nước dừa và rưới lên trên ghẹ.

- Món ghẹ hấp nước dừa thơm ngon, đậm đà hương vị ai ai cũng mê!!!', 1)
SET IDENTITY_INSERT [dbo].[TinTuc_VaoBep] OFF
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT (NULL) FOR [HinhAnh]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT (NULL) FOR [MoTa]
GO
ALTER TABLE [dbo].[TinTuc_VaoBep] ADD  DEFAULT (NULL) FOR [HinhAnh]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([ID_DonHang])
REFERENCES [dbo].[DonHang] ([ID_DonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([ID_SanPham])
REFERENCES [dbo].[SanPham] ([ID_SanPham])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_TaiKhoan1] FOREIGN KEY([ID_TaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([ID_TaiKhoan])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_TaiKhoan1]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMuc] FOREIGN KEY([ID_DanhMuc])
REFERENCES [dbo].[DanhMuc] ([ID_DanhMuc])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DanhMuc]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD CHECK  (([TrangThai]>=(1) AND [TrangThai]<=(4)))
GO
USE [master]
GO
ALTER DATABASE [HaiSanDB] SET  READ_WRITE 
GO
