import 'dart:convert';

LocationDataModel locationDataModelFromJson(String str) =>
    LocationDataModel.fromJson(json.decode(str));

String locationDataModelToJson(LocationDataModel data) =>
    json.encode(data.toJson());

class LocationDataModel {
  List<District>? divisions;
  List<District>? districts;
  List<Place>? thanas;
  List<Place>? places;

  LocationDataModel({
    this.divisions,
    this.districts,
    this.thanas,
    this.places,
  });

  factory LocationDataModel.fromJson(Map<String, dynamic> json) =>
      LocationDataModel(
        divisions: json["divisions"] == null
            ? []
            : List<District>.from(
                json["divisions"]!.map((x) => District.fromJson(x))),
        districts: json["districts"] == null
            ? []
            : List<District>.from(
                json["districts"]!.map((x) => District.fromJson(x))),
        thanas: json["thanas"] == null
            ? []
            : List<Place>.from(json["thanas"]!.map((x) => Place.fromJson(x))),
        places: json["places"] == null
            ? []
            : List<Place>.from(json["places"]!.map((x) => Place.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "divisions": divisions == null
            ? []
            : List<dynamic>.from(divisions!.map((x) => x.toJson())),
        "districts": districts == null
            ? []
            : List<dynamic>.from(districts!.map((x) => x.toJson())),
        "thanas": thanas == null
            ? []
            : List<dynamic>.from(thanas!.map((x) => x.toJson())),
        "places": places == null
            ? []
            : List<dynamic>.from(places!.map((x) => x.toJson())),
      };
}

class District {
  int? id;
  int? divisionId;
  String? code;
  String? name;
  Status? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  District({
    this.id,
    this.divisionId,
    this.code,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        divisionId: json["division_id"],
        code: json["code"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "division_id": divisionId,
        "code": code,
        "name": name,
        "status": statusValues.reverse[status],
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt?.toIso8601String(),
      };
}

enum Status { ACTIVE, INACTIVE }

final statusValues =
    EnumValues({"active": Status.ACTIVE, "inactive": Status.INACTIVE});

class Place {
  int? id;
  int? divisionId;
  int? districtId;
  int? thanaId;
  String? code;
  String? name;
  String? postalCode;
  Status? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  Place({
    this.id,
    this.divisionId,
    this.districtId,
    this.thanaId,
    this.code,
    this.name,
    this.postalCode,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        divisionId: json["division_id"],
        districtId: json["district_id"],
        thanaId: json["thana_id"],
        code: json["code"],
        name: json["name"],
        postalCode: json["postal_code"],
        status: statusValues.map[json["status"]]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"] == null
            ? null
            : DateTime.parse(json["deleted_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "division_id": divisionId,
        "district_id": districtId,
        "thana_id": thanaId,
        "code": code,
        "name": name,
        "postal_code": postalCode,
        "status": statusValues.reverse[status],
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt?.toIso8601String(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
