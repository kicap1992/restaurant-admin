class ReservasiMejaModel {
  int? idMeja;
  int? idUser;
  String? status;
  String? jamBooking;
  String? createdAt;
  String? updatedAt;

  ReservasiMejaModel(
      {this.idMeja,
      this.idUser,
      this.status,
      this.jamBooking,
      this.createdAt,
      this.updatedAt});

  ReservasiMejaModel.fromJson(Map<String, dynamic> json) {
    idMeja = json['id_meja'];
    idUser = json['id_user'];
    status = json['status'];
    jamBooking = json['jam_booking'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_meja'] = idMeja;
    data['id_user'] = idUser;
    data['status'] = status;
    data['jam_booking'] = jamBooking;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
