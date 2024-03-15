class DanhMucDoiTuongModel {
  String ID;
  String IDDanhMucDonVi;
  String IDDanhMucLoaiDoiTuong;
  String Ma;
  String Ten;
  String IDDanhMucNguoiSuDungCreate;
  String CreateDate;
  String? IDDanhMucNguoiSuDungEdit;
  String? EditDate;

  DanhMucDoiTuongModel(
      {required this.ID,
      required this.IDDanhMucDonVi,
      required this.IDDanhMucLoaiDoiTuong,
      required this.Ma,
      required this.Ten,
      required this.IDDanhMucNguoiSuDungCreate,
      required this.CreateDate,
      required this.IDDanhMucNguoiSuDungEdit,
      required this.EditDate});

  factory DanhMucDoiTuongModel.fromJson(Map<String, dynamic> json) {
    return DanhMucDoiTuongModel(
        ID: json['ID'].toString(),
        IDDanhMucDonVi: json['IDDanhMucDonVi'].toString(),
        IDDanhMucLoaiDoiTuong: json['IDDanhMucLoaiDoiTuong'].toString(),
        Ma: json['Ma'].toString(),
        Ten: json['Ten'].toString(),
        IDDanhMucNguoiSuDungCreate:
            json['IDDanhMucNguoiSuDungCreate'].toString(),
        CreateDate: json['CreateDate'].toString(),
        IDDanhMucNguoiSuDungEdit: json['IDDanhMucNguoiSuDungEdit'].toString(),
        EditDate: json['EditDate'].toString());
  }
}
