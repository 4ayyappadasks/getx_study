// To parse this JSON data, do
//
//     final packageDetails = packageDetailsFromJson(jsonString);

import 'dart:convert';

PackageDetails packageDetailsFromJson(String str) => PackageDetails.fromJson(json.decode(str));

String packageDetailsToJson(PackageDetails data) => json.encode(data.toJson());

class PackageDetails {
  int success;
  String message;
  Data data;
  List<Package> packages;

  PackageDetails({
    required this.success,
    required this.message,
    required this.data,
    required this.packages,
  });

  factory PackageDetails.fromJson(Map<String, dynamic> json) => PackageDetails(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    packages: List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
    "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
  };
}

class Data {
  int id;
  String categoryTitle;
  dynamic categoryImage;
  String status;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int categoryId;
  String langId;
  String categoryDescription;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    categoryTitle: json["category_title"],
    categoryImage: json["category_image"],
    status: json["status"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categoryId: json["category_id"],
    langId: json["lang_id"],
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
    "lang_id": langId,
    "category_description": categoryDescription,
  };
}

class Package {
  int id;
  String title;
  String price;
  String percentage;
  String categoryId;
  String advisorAmount;
  String image;
  String icon;
  int showOnMenu;
  int showOnFooter;
  int showOnHome;
  DateTime createdAt;
  DateTime updatedAt;
  int packageId;
  String langId;
  String summary;
  String description;

  Package({
    required this.id,
    required this.title,
    required this.price,
    required this.percentage,
    required this.categoryId,
    required this.advisorAmount,
    required this.image,
    required this.icon,
    required this.showOnMenu,
    required this.showOnFooter,
    required this.showOnHome,
    required this.createdAt,
    required this.updatedAt,
    required this.packageId,
    required this.langId,
    required this.summary,
    required this.description,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    percentage: json["percentage"],
    categoryId: json["category_id"],
    advisorAmount: json["advisor_amount"],
    image: json["image"],
    icon: json["icon"],
    showOnMenu: json["show_on_menu"],
    showOnFooter: json["show_on_footer"],
    showOnHome: json["show_on_home"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    packageId: json["package_id"],
    langId: json["lang_id"],
    summary: json["summary"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "percentage": percentage,
    "category_id": categoryId,
    "advisor_amount": advisorAmount,
    "image": image,
    "icon": icon,
    "show_on_menu": showOnMenu,
    "show_on_footer": showOnFooter,
    "show_on_home": showOnHome,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "package_id": packageId,
    "lang_id": langId,
    "summary": summary,
    "description": description,
  };
}
