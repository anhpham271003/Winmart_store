create database yeucaupm
go 
use yeucaupm 
go 
create table NhaCungCap(
	MaNhaCC char(10) primary key,
	TenNhaCC nvarchar(50) not null,
	DiaChi nvarchar(50) not null,
	SoDienThoai numeric(18,0) not null
)


create table KhachHang(
	MaKH char(10) primary key,
	TenKH nvarchar(50) not null,
	DiaChi nvarchar(50) not null,
	SoDienThoai numeric(18,0) not null,
	NgayThem date not null,
	GhiChu nvarchar(100)
)


create table DonVT(
	MaDVT char(10) primary key,
	TenDVT nvarchar(50) not null,
	QuyDoi nvarchar(50) not null,
	TrangThai nvarchar(20)
)


create table NhanVien(
	MaNV char(10) primary key,
	TenNV nvarchar(50) not null,
	ChucVu nvarchar(20) not null,
	DiaChi nvarchar(50) not null,
	SoDienThoai numeric(18,0) not null,
	NgayBD date not null,
	NgayKT date not null,
	TrangThai nvarchar(20)
)

create table LoaiHang(
	MaLoaiHang char(10) primary key,
	TenLoaiHang nvarchar(50) not null,
	GhiChu nvarchar (100)
)

create table HangHoa(
	MaHangHoa char(10) primary key,
	TenHangHoa nvarchar(50) not null,
	MaLoaiHang char(10) not null,
	MaDVT char(10) not null,
	DonGia INT not null,
	foreign key (MaLoaiHang) references LoaiHang(MaLoaiHang),
	foreign key (MaDVT) references DonVT(MaDVT)
)

create table KhoHang(
	MaKhoHang char(10) primary key,
	TenKhoHang nvarchar(50) not null,
	MaNV char(10) not null,
	MaNhaCC char(10) not null,
	GhiChu nvarchar(100),
	foreign key (MaNV) references NhanVien(MaNV),
	foreign key (MaNhaCC) references NhaCungCap(MaNhaCC)
)

create table ThanhToan(
	MaThanhToan char(10) primary key,
	TenThanhToan nvarchar(50) not null,
	HinhThucTT nvarchar (50) not null
)


create table DonHang(
	MaDonHang char(10) primary key,
	TenDonHang nvarchar(50) not null,
	MaKH char(10) not null,
	MaNV char(10) not null,
	NgayLap date not null,
	MaThanhToan char(10) not null,
	GhiChu nvarchar(100),
	foreign key (MaKH) references KhachHang(MaKH),
	foreign key (MaNV) references NhanVien(MaNV),
	foreign key (MaThanhToan) references ThanhToan(MaThanhToan)
)

create table HoaDon(
	MaHoaDon char(10) primary key,
	TenHoaDon nvarchar(50) not null,
	NgayTao date not null,
	NgayGiao date not null,
	MaDonHang char(10) not null,
	ChietKhau int not null,
	ThanhTien int not null,
	GhiChu nvarchar(100),
	foreign key (MaDonHang) references DonHang(MaDonHang)
)

create table PhieuXuat(
	MaPX char(10) primary key,
	TenPhieu nvarchar(50) not null,
	NgayTao date not null,
	GhiChu nvarchar(100)
)

create table PhieuNhap(
	MaPN char(10) primary key,
	TenPhieu nvarchar(50) not null,
	NgayTao date not null,
	GhiChu nvarchar(100)
)

create table PhieuNo(
	MaPhieuNo char(10) primary key,
	TenPhieu nvarchar(50) not null,
	MaNhaCC char(10) not null,
	NgayTao date not null,
	SoTien int not null,
	TinhTrang nvarchar(20) not null,
	foreign key (MaNhaCC) references NhaCungCap(MaNhaCC)
)

create table CTHoaDon(
	MaHangHoa char(10)not null,
	MaHoaDon char(10) not null,
	NgayTao date not null,
	TenHangHoa nvarchar(50) not null,
	SoLuong int not null,
	ChietKhau int not null,
	ThanhTien int not null,
	GhiChu nvarchar(100),
	foreign key (MaHangHoa) references HangHoa(MaHangHoa),
	foreign key (MaHoaDon) references HoaDon(MaHoaDon)
)

create table CTPhieuNhap(
	MaPN char(10) not null,
	MaHangHoa char(10) not null,
	NgayTao date not null,
	TenHangHoa nvarchar(50) not null,
	GhiChu nvarchar(100),
	foreign key (MaPN) references PhieuNhap(MaPN),
	foreign key (MaHangHoa) references HangHoa(MaHangHoa)
)

create table CTPhieuXuat
(
	MaPX char(10) not null,
	MaHangHoa char(10) not null,
	NgayTao date not null,
	TenHangHoa nvarchar(50) not null,
	GhiChu nvarchar(100),
	foreign key (MaPX) references PhieuXuat(MaPX),
	foreign key (MaHangHoa) references HangHoa(MaHangHoa)
)