class SingleProductModel {
  SingleProductModel({
    int? id,
    String? name,
    String? description,
    String? shortDescription,
    String? price,
    String? regularPrice,
    String? salePrice,
    int? totalSales,
    bool? manageStock,
    dynamic stockQuantity,
    bool? inStock,
    String? averageRating,
    int? ratingCount,
    List<Tags>? tags,
    List<Images>? images,
    List<Attributes>? attributes,
  }) {
    _id = id;
    _name = name;
    _description = description;
    _shortDescription = shortDescription;
    _price = price;
    _regularPrice = regularPrice;
    _salePrice = salePrice;
    _totalSales = totalSales;
    _stockQuantity = stockQuantity;
    _inStock = inStock;
    _averageRating = averageRating;
    _ratingCount = ratingCount;
    _tags = tags;
    _attributes = attributes;
    _images = images;
  }

  SingleProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _shortDescription = json['short_description'];
    _price = json['price'];
    _regularPrice = json['regular_price'];
    _salePrice = json['sale_price'];
    _stockQuantity = json['stock_quantity'];
    _inStock = json['in_stock'];
    _averageRating = json['average_rating'];
    _ratingCount = json['rating_count'];

    if (json['tags'] != null) {
      _tags = [];
      json['tags'].forEach((v) {
        _tags?.add(Tags.fromJson(v));
      });
    }
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(Attributes.fromJson(v));
      });
    }
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
  }
  int? _id;
  String? _name;
  String? _description;
  String? _shortDescription;
  String? _price;
  String? _regularPrice;
  String? _salePrice;
  int? _totalSales;
  dynamic _stockQuantity;
  bool? _inStock;
  String? _averageRating;
  int? _ratingCount;
  List<Tags>? _tags;
  List<Attributes>? _attributes;
  List<Images>? _images;

  int? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get shortDescription => _shortDescription;
  String? get price => _price;
  String? get regularPrice => _regularPrice;
  String? get salePrice => _salePrice;
  int? get totalSales => _totalSales;
  dynamic get stockQuantity => _stockQuantity;
  bool? get inStock => _inStock;
  String? get averageRating => _averageRating;
  int? get ratingCount => _ratingCount;
  List<Tags>? get tags => _tags;
  List<Attributes>? get attributes => _attributes;
  List<Images>? get images => _images;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['short_description'] = _shortDescription;
    map['price'] = _price;
    map['regular_price'] = _regularPrice;
    map['sale_price'] = _salePrice;
    map['total_sales'] = _totalSales;
    map['stock_quantity'] = _stockQuantity;
    map['in_stock'] = _inStock;
    map['average_rating'] = _averageRating;
    map['rating_count'] = _ratingCount;
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Attributes {
  Attributes({
    int? id,
    String? name,
    int? position,
    bool? visible,
    bool? variation,
    List<String>? options,
  }) {
    _id = id;
    _name = name;
    _position = position;
    _visible = visible;
    _variation = variation;
    _options = options;
  }

  Attributes.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _position = json['position'];
    _visible = json['visible'];
    _variation = json['variation'];
    _options = json['options'] != null ? json['options'].cast<String>() : [];
  }
  int? _id;
  String? _name;
  int? _position;
  bool? _visible;
  bool? _variation;
  List<String>? _options;

  int? get id => _id;
  String? get name => _name;
  int? get position => _position;
  bool? get visible => _visible;
  bool? get variation => _variation;
  List<String>? get options => _options;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['position'] = _position;
    map['visible'] = _visible;
    map['variation'] = _variation;
    map['options'] = _options;
    return map;
  }
}

class Images {
  Images({
    int? id,
    String? dateCreated,
    String? dateCreatedGmt,
    String? dateModified,
    String? dateModifiedGmt,
    String? src,
    String? name,
    String? alt,
    int? position,
  }) {
    _id = id;
    _dateCreated = dateCreated;
    _dateCreatedGmt = dateCreatedGmt;
    _dateModified = dateModified;
    _dateModifiedGmt = dateModifiedGmt;
    _src = src;
    _name = name;
    _alt = alt;
    _position = position;
  }

  Images.fromJson(dynamic json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateCreatedGmt = json['date_created_gmt'];
    _dateModified = json['date_modified'];
    _dateModifiedGmt = json['date_modified_gmt'];
    _src = json['src'];
    _name = json['name'];
    _alt = json['alt'];
    _position = json['position'];
  }
  int? _id;
  String? _dateCreated;
  String? _dateCreatedGmt;
  String? _dateModified;
  String? _dateModifiedGmt;
  String? _src;
  String? _name;
  String? _alt;
  int? _position;

  int? get id => _id;
  String? get dateCreated => _dateCreated;
  String? get dateCreatedGmt => _dateCreatedGmt;
  String? get dateModified => _dateModified;
  String? get dateModifiedGmt => _dateModifiedGmt;
  String? get src => _src;
  String? get name => _name;
  String? get alt => _alt;
  int? get position => _position;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date_created'] = _dateCreated;
    map['date_created_gmt'] = _dateCreatedGmt;
    map['date_modified'] = _dateModified;
    map['date_modified_gmt'] = _dateModifiedGmt;
    map['src'] = _src;
    map['name'] = _name;
    map['alt'] = _alt;
    map['position'] = _position;
    return map;
  }
}

class Tags {
  Tags({
    int? id,
    String? name,
    String? slug,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
  }

  Tags.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
  }
  int? _id;
  String? _name;
  String? _slug;

  int? get id => _id;
  String? get name => _name;
  String? get slug => _slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    return map;
  }
}
