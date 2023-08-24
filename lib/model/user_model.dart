class UserModel {
  int? idUser;
  String? nama;
  String? noTelpon;
  String? tanggalLahir;
  String? jenisKelamin;
  String? alamat;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.idUser,
      this.nama,
      this.noTelpon,
      this.tanggalLahir,
      this.jenisKelamin,
      this.alamat,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    nama = json['nama'];
    noTelpon = json['no_telpon'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    alamat = json['alamat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_user'] = idUser;
    data['nama'] = nama;
    data['no_telpon'] = noTelpon;
    data['tanggal_lahir'] = tanggalLahir;
    data['jenis_kelamin'] = jenisKelamin;
    data['alamat'] = alamat;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
