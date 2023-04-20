// To parse this JSON data, do
//
//     final productReviewModel = productReviewModelFromJson(jsonString);

import 'dart:convert';

List<ProductReviewModel> productReviewModelFromJson(String str) =>
    List<ProductReviewModel>.from(
        json.decode(str).map((x) => ProductReviewModel.fromJson(x)));

String productReviewModelToJson(List<ProductReviewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductReviewModel {
  ProductReviewModel({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.productId,
    this.status,
    this.reviewer,
    this.reviewerEmail,
    this.review,
    this.rating,
    this.verified,
    this.reviewerAvatarUrls,
  });

  int? id;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  int? productId;
  String? status;
  String? reviewer;
  String? reviewerEmail;
  String? review;
  int? rating;
  bool? verified;
  Map<String, String>? reviewerAvatarUrls;

  factory ProductReviewModel.fromJson(Map<dynamic, dynamic> json) =>
      ProductReviewModel(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        productId: json["product_id"],
        status: json["status"],
        reviewer: json["reviewer"],
        reviewerEmail: json["reviewer_email"],
        review: json["review"],
        rating: json["rating"],
        verified: json["verified"],
        reviewerAvatarUrls: Map.from(json["reviewer_avatar_urls"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "status": status,
        "reviewer": reviewer,
        "reviewer_email": reviewerEmail,
        "review": review,
        "rating": rating,
        "verified": verified,
      };
}
