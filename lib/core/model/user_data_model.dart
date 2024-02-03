import 'dart:convert';

UserDataModel userDataModelFromJson(String str) =>
    UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  String? token;
  String? message;
  User? user;
  List<Distributor>? distributor;
  Payload? payload;
  int? minimumDistance;

  UserDataModel({
    this.token,
    this.message,
    this.user,
    this.distributor,
    this.payload,
    this.minimumDistance,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        token: json["token"],
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        distributor: json["distributor"] == null
            ? []
            : List<Distributor>.from(
                json["distributor"]!.map((x) => Distributor.fromJson(x))),
        payload:
            json["payload"] == null ? null : Payload.fromJson(json["payload"]),
        minimumDistance: json["minimum_distance"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "message": message,
        "user": user?.toJson(),
        "distributor": distributor == null
            ? []
            : List<dynamic>.from(distributor!.map((x) => x.toJson())),
        "payload": payload?.toJson(),
        "minimum_distance": minimumDistance,
      };
}

class Distributor {
  int? id;
  String? name;
  String? baseId;
  String? regionId;
  String? areaId;
  int? depotId;
  String? lat;
  String? lng;

  Distributor({
    this.id,
    this.name,
    this.baseId,
    this.regionId,
    this.areaId,
    this.depotId,
    this.lat,
    this.lng,
  });

  factory Distributor.fromJson(Map<String, dynamic> json) => Distributor(
        id: json["id"],
        name: json["name"],
        baseId: json["base_id"],
        regionId: json["region_id"],
        areaId: json["area_id"],
        depotId: json["depot_id"],
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "base_id": baseId,
        "region_id": regionId,
        "area_id": areaId,
        "depot_id": depotId,
        "lat": lat,
        "lng": lng,
      };
}

class Payload {
  String? email;
  String? password;

  Payload({
    this.email,
    this.password,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

class User {
  int? id;
  String? name;
  String? userType;
  int? cardNo;
  String? type;
  String? designation;
  int? designationId;
  String? email;
  String? mobile;
  String? photo;
  String? workplaceType;
  int? workplaceId;

  User({
    this.id,
    this.name,
    this.userType,
    this.cardNo,
    this.type,
    this.designation,
    this.designationId,
    this.email,
    this.mobile,
    this.photo,
    this.workplaceType,
    this.workplaceId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        userType: json["user_type"],
        cardNo: json["card_no"],
        type: json["type"],
        designation: json["designation"],
        designationId: json["designation_id"],
        email: json["email"],
        mobile: json["mobile"],
        photo: json["photo"],
        workplaceType: json["workplace_type"],
        workplaceId: json["workplace_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_type": userType,
        "card_no": cardNo,
        "type": type,
        "designation": designation,
        "designation_id": designationId,
        "email": email,
        "mobile": mobile,
        "photo": photo,
        "workplace_type": workplaceType,
        "workplace_id": workplaceId,
      };
}
