// ignore_for_file: constant_identifier_names

class SingleProductVariations {
  SingleProductVariations({
    this.id,
    this.description,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.inStock,
    this.image,
    this.attributes,
  });

  int? id;
  String? description;
  String? price;
  String? regularPrice;
  String? salePrice;
  bool? inStock;
  Images? image;
  List<Attribute>? attributes;

  factory SingleProductVariations.fromJson(dynamic json) => SingleProductVariations(
        id: json["id"],
        description: json["description"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        inStock: json["in_stock"],
        image: Images.fromJson(json["image"]),
        attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "in_stock": inStock,
        "image": image!.toJson(),
        "attributes": List<dynamic>.from(attributes!.map((x) => x.toJson())),
      };
}

class Attribute {
  Attribute({
    this.id,
    this.name,
    this.option,
  });

  int? id;
  String? name;
  String? option;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        name: json["name"],
        option: json["option"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "option": option,
      };
}

enum Name { COLOR, SIZE }

final nameValues = EnumValues({"color": Name.COLOR, "size": Name.SIZE});

enum Backorders { YES }

final backordersValues = EnumValues({"yes": Backorders.YES});

class Images {
  Images({
    this.id,
    this.src,
    this.name,
  });

  int? id;
  String? src;
  String? name;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"],
        src: json["src"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "src": src,
        "name": name,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
