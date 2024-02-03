import 'dart:convert';

SignUpDataModel signUpDataModelFromJson(String str) =>
    SignUpDataModel.fromJson(json.decode(str));

String signUpDataModelToJson(SignUpDataModel data) =>
    json.encode(data.toJson());

class SignUpDataModel {
  String? image;
  String? ownerName;
  String? shopName;
  String? phone;
  String? password;
  String? email;
  String? address;
  String? nidNo;
  String? nidImage;
  String? tradeLicenseNo;
  String? tradeLicenseImage;
  String? nidImageFront;
  String? nidImageBack;
  int? divisionId;
  int? districtId;
  int? thanaId;
  int? placeId;
  int? routeId;
  String? lat;
  String? lng;
  int? isVerified;
  String? status;

  SignUpDataModel({
    this.image,
    this.ownerName,
    this.shopName,
    this.phone,
    this.password,
    this.email,
    this.address,
    this.nidNo,
    this.nidImage,
    this.tradeLicenseNo,
    this.tradeLicenseImage,
    this.nidImageFront,
    this.nidImageBack,
    this.divisionId,
    this.districtId,
    this.thanaId,
    this.placeId,
    this.routeId,
    this.lat,
    this.lng,
    this.isVerified,
    this.status,
  });

  factory SignUpDataModel.fromJson(Map<String, dynamic> json) =>
      SignUpDataModel(
        image: json["image"],
        ownerName: json["owner_name"],
        shopName: json["shop_name"],
        phone: json["phone"],
        password: json["password"],
        email: json["email"],
        address: json["address"],
        nidNo: json["nid_no"],
        nidImage: json["nid_image"],
        tradeLicenseNo: json["trade_license_no"],
        tradeLicenseImage: json["trade_license_image"],
        nidImageFront: json["nid_image_front"],
        nidImageBack: json["nid_image_back"],
        divisionId: json["division_id"],
        districtId: json["district_id"],
        thanaId: json["thana_id"],
        placeId: json["place_id"],
        routeId: json["route_id"],
        lat: json["lat"],
        lng: json["lng"],
        isVerified: json["is_verified"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "owner_name": ownerName,
        "shop_name": shopName,
        "phone": phone,
        "password": password,
        "email": email,
        "address": address,
        "nid_no": nidNo,
        "nid_image": nidImage,
        "trade_license_no": tradeLicenseNo,
        "trade_license_image": tradeLicenseImage,
        "nid_image_front": nidImageFront,
        "nid_image_back": nidImageBack,
        "division_id": divisionId,
        "district_id": districtId,
        "thana_id": thanaId,
        "place_id": placeId,
        "route_id": routeId,
        "lat": lat,
        "lng": lng,
        "is_verified": isVerified,
        "status": status,
      };
}
