// To parse this JSON data, do
//
//     final packagelist = packagelistFromJson(jsonString);

import 'dart:convert';

Packagelist packagelistFromJson(String str) => Packagelist.fromJson(json.decode(str));

String packagelistToJson(Packagelist data) => json.encode(data.toJson());

class Packagelist {
  int success;
  String message;
  List<Datum> data;

  Packagelist({
    required this.success,
    required this.message,
    required this.data,
  });

  factory Packagelist.fromJson(Map<String, dynamic> json) => Packagelist(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  int id;
  String categoryTitle;
  dynamic categoryImage;
  String status;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int categoryId;
  LangId langId;
  String categoryDescription;

  Datum({
    required this.id,
    required this.categoryTitle,
    required this.categoryImage,
    required this.status,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryId,
    required this.langId,
    required this.categoryDescription,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    categoryTitle: json["category_title"],
    categoryImage: json["category_image"],
    status: json["status"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categoryId: json["category_id"],
    langId: langIdValues.map[json["lang_id"]]!,
    categoryDescription: json["category_description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_title": categoryTitle,
    "category_image": categoryImage,
    "status": status,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "category_id": categoryId,
    "lang_id": langIdValues.reverse[langId],
    "category_description": categoryDescription,
  };
}

enum LangId {
  EN
}

final langIdValues = EnumValues({
  "en": LangId.EN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
