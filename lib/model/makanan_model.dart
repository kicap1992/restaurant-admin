class MakananModel {
  int? idMakanan;
  String? namaMakanan;
  String? hargaMakanan;
  String? deskripsiMakanan;
  String? imgUrl;

  MakananModel(
      {this.idMakanan,
      this.namaMakanan,
      this.hargaMakanan,
      this.deskripsiMakanan,
      this.imgUrl});

  MakananModel.fromJson(Map<String, dynamic> json) {
    idMakanan = json['id_makanan'];
    namaMakanan = json['nama_makanan'];
    hargaMakanan = json['harga_makanan'];
    deskripsiMakanan = json['deskripsi_makanan'];
    imgUrl = json['img_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_makanan'] = idMakanan;
    data['nama_makanan'] = namaMakanan;
    data['harga_makanan'] = hargaMakanan;
    data['deskripsi_makanan'] = deskripsiMakanan;
    data['img_url'] = imgUrl;
    return data;
  }
}
