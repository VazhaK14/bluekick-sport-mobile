// To parse this JSON data, do
//
//     final ProductEntry = ProductEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(
  json.decode(str).map((x) => ProductEntry.fromJson(x)),
);

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String model;
  String pk;
  Fields fields;

  ProductEntry({required this.model, required this.pk, required this.fields});

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    model: json["model"],
    pk: json["pk"].toString(),
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  int user;
  String name;
  int price;
  int stock;
  String description;
  dynamic thumbnail;
  String category;
  double rating;
  double ratingSum;
  double ratingCount;
  bool isAvail;
  bool isFeatured;

  Fields({
    required this.user,
    required this.name,
    required this.price,
    required this.stock,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.rating,
    required this.ratingSum,
    required this.ratingCount,
    required this.isAvail,
    required this.isFeatured,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"] ?? 0,
    name: json["name"] ?? "",
    price: json["price"] ?? 0,
    stock: json["stock"] ?? 0,
    description: json["description"] ?? "",
    thumbnail: json["thumbnail"] ?? "",
    category: json["category"] ?? "",
    rating: (json["rating"] as num?)?.toDouble() ?? 0.0,
    ratingSum: (json["rating_sum"] as num?)?.toDouble() ?? 0.0,
    ratingCount: (json["rating_count"] as num?)?.toDouble() ?? 0.0,
    isAvail: json["is_avail"] ?? false,
    isFeatured: json["is_featured"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "name": name,
    "price": price,
    "stock": stock,
    "description": description,
    "thumbnail": thumbnail,
    "category": category,
    "rating": rating,
    "rating_sum": ratingSum,
    "rating_count": ratingCount,
    "is_avail": isAvail,
    "is_featured": isFeatured,
  };
}
