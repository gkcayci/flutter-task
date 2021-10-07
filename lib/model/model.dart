// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

List<Model> modelFromJson(String str) =>
    List<Model>.from(json.decode(str).map((x) => Model.fromJson(x)));

String modelToJson(List<Model> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Model {
  Model({
    required this.slug,
    required this.id,
    required this.epoch,
    required this.date,
    required this.company,
    required this.companyLogo,
    required this.position,
    required this.tags,
    required this.logo,
    required this.description,
    required this.location,
    required this.url,
    required this.applyUrl,
    required this.original,
  });

  String slug;
  String id;
  String epoch;
  DateTime date;
  String company;
  String companyLogo;
  String position;
  List<String> tags;
  String? logo;
  String description;
  String location;
  String url;
  String applyUrl;
  bool? original;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        slug: json["slug"],
        id: json["id"],
        epoch: json["epoch"],
        date: DateTime.parse(json["date"]),
        company: json["company"],
        companyLogo: json["company_logo"],
        position: json["position"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        logo: json["logo"] == null ? null : json["logo"],
        description: json["description"],
        location: json["location"],
        url: json["url"],
        applyUrl: json["apply_url"],
        original: json["original"] == null ? null : json["original"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "id": id,
        "epoch": epoch,
        "date": date.toIso8601String(),
        "company": company,
        "company_logo": companyLogo,
        "position": position,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "logo": logo == null ? null : logo,
        "description": description,
        "location": location,
        "url": url,
        "apply_url": applyUrl,
        "original": original == null ? null : original,
      };
}
