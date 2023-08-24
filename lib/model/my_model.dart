class MyModel {
  String? message;
  bool? theBool;
  dynamic data;

  MyModel({this.message, this.theBool, this.data});

  MyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    theBool = json['bool'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['bool'] = theBool;
    data['data'] = this.data;
    return data;
  }
}
