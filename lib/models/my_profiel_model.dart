class MyProfileModel {
  Data data;

  MyProfileModel({this.data});

  MyProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String token;
  String language;
  String phone;
  String name;
  String lastname;
  String photo;
  int rating;
  String passportPhoto;
  String driverLicensePhoto;

  Data(
      {this.id,
      this.token,
      this.language,
      this.phone,
      this.name,
      this.lastname,
      this.photo,
      this.rating,
      this.passportPhoto,
      this.driverLicensePhoto});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    language = json['language'];
    phone = json['phone'];
    name = json['name'];
    lastname = json['lastname'];
    photo = json['photo'];
    rating = json['rating'];
    passportPhoto = json['passportPhoto'];
    driverLicensePhoto = json['driverLicensePhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['language'] = this.language;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['photo'] = this.photo;
    data['rating'] = this.rating;
    data['passportPhoto'] = this.passportPhoto;
    data['driverLicensePhoto'] = this.driverLicensePhoto;
    return data;
  }
}
