class ProductModel {
  ProductModel({
    int? id,
    String? name,
    String? description,
    String? price,
    String? regularPrice,
    String? salePrice,
    bool? manageStock,
    int? stockQuantity,
    bool? inStock,
    List<Images>? images,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _type = type;
    _status = status;
    _featured = featured;
    _catalogVisibility = catalogVisibility;
    _description = description;
    _shortDescription = shortDescription;
    _sku = sku;
    _price = price;
    _regularPrice = regularPrice;
    _salePrice = salePrice;
    _dateOnSaleFrom = dateOnSaleFrom;
    _dateOnSaleFromGmt = dateOnSaleFromGmt;
    _dateOnSaleTo = dateOnSaleTo;
    _dateOnSaleToGmt = dateOnSaleToGmt;
    _onSale = onSale;
    _purchasable = purchasable;
    _virtual = virtual;
    _downloadable = downloadable;
    _taxStatus = taxStatus;
    _taxClass = taxClass;
    _manageStock = manageStock;
    _stockQuantity = stockQuantity;
    _inStock = inStock;
    _shippingRequired = shippingRequired;
    _shippingTaxable = shippingTaxable;
    _shippingClass = shippingClass;
    _shippingClassId = shippingClassId;
    _reviewsAllowed = reviewsAllowed;
    _averageRating = averageRating;
    _parentId = parentId;
    _purchaseNote = purchaseNote;
    _images = images;
  }

  ProductModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _type = json['type'];
    _status = json['status'];
    _featured = json['featured'];
    _catalogVisibility = json['catalog_visibility'];
    _description = json['description'];
    _shortDescription = json['short_description'];
    _sku = json['sku'];
    _price = json['price'];
    _regularPrice = json['regular_price'];
    _salePrice = json['sale_price'];
    _dateOnSaleFrom = json['date_on_sale_from'];
    _dateOnSaleFromGmt = json['date_on_sale_from_gmt'];
    _dateOnSaleTo = json['date_on_sale_to'];
    _dateOnSaleToGmt = json['date_on_sale_to_gmt'];
    _onSale = json['on_sale'];
    _purchasable = json['purchasable'];
    _virtual = json['virtual'];
    _downloadable = json['downloadable'];
    _taxStatus = json['tax_status'];
    _taxClass = json['tax_class'];
    _manageStock = json['manage_stock'];
    _stockQuantity = json['stock_quantity'];
    _inStock = json['in_stock'];
    _shippingRequired = json['shipping_required'];
    _shippingTaxable = json['shipping_taxable'];
    _shippingClass = json['shipping_class'];
    _shippingClassId = json['shipping_class_id'];
    _reviewsAllowed = json['reviews_allowed'];
    _averageRating = json['average_rating'];
    _parentId = json['parent_id'];
    _purchaseNote = json['purchase_note'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
  }
  int? _id;
  String? _name;
  String? _slug;
  String? _type;
  String? _status;
  bool? _featured;
  String? _catalogVisibility;
  String? _description;
  String? _shortDescription;
  String? _sku;
  String? _price;
  String? _regularPrice;
  String? _salePrice;
  dynamic _dateOnSaleFrom;
  dynamic _dateOnSaleFromGmt;
  dynamic _dateOnSaleTo;
  dynamic _dateOnSaleToGmt;
  bool? _onSale;
  bool? _purchasable;
  bool? _virtual;
  bool? _downloadable;
  String? _taxStatus;
  String? _taxClass;
  bool? _manageStock;
  int? _stockQuantity;
  bool? _inStock;
  bool? _shippingRequired;
  bool? _shippingTaxable;
  String? _shippingClass;
  int? _shippingClassId;
  bool? _reviewsAllowed;
  String? _averageRating;
  int? _parentId;
  String? _purchaseNote;
  List<Images>? _images;

  int? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get type => _type;
  String? get status => _status;
  bool? get featured => _featured;
  String? get catalogVisibility => _catalogVisibility;
  String? get description => _description;
  String? get shortDescription => _shortDescription;
  String? get sku => _sku;
  String? get price => _price;
  String? get regularPrice => _regularPrice;
  String? get salePrice => _salePrice;
  dynamic get dateOnSaleFrom => _dateOnSaleFrom;
  dynamic get dateOnSaleFromGmt => _dateOnSaleFromGmt;
  dynamic get dateOnSaleTo => _dateOnSaleTo;
  dynamic get dateOnSaleToGmt => _dateOnSaleToGmt;
  bool? get onSale => _onSale;
  bool? get purchasable => _purchasable;
  bool? get virtual => _virtual;
  bool? get downloadable => _downloadable;
  String? get taxStatus => _taxStatus;
  String? get taxClass => _taxClass;
  bool? get manageStock => _manageStock;
  int? get stockQuantity => _stockQuantity;
  bool? get inStock => _inStock;
  bool? get shippingRequired => _shippingRequired;
  bool? get shippingTaxable => _shippingTaxable;
  String? get shippingClass => _shippingClass;
  int? get shippingClassId => _shippingClassId;
  bool? get reviewsAllowed => _reviewsAllowed;
  String? get averageRating => _averageRating;
  int? get parentId => _parentId;
  String? get purchaseNote => _purchaseNote;
  List<Images>? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['type'] = _type;
    map['status'] = _status;
    map['featured'] = _featured;
    map['catalog_visibility'] = _catalogVisibility;
    map['description'] = _description;
    map['short_description'] = _shortDescription;
    map['sku'] = _sku;
    map['price'] = _price;
    map['regular_price'] = _regularPrice;
    map['sale_price'] = _salePrice;
    map['date_on_sale_from'] = _dateOnSaleFrom;
    map['date_on_sale_from_gmt'] = _dateOnSaleFromGmt;
    map['date_on_sale_to'] = _dateOnSaleTo;
    map['date_on_sale_to_gmt'] = _dateOnSaleToGmt;
    map['on_sale'] = _onSale;
    map['purchasable'] = _purchasable;
    map['virtual'] = _virtual;
    map['downloadable'] = _downloadable;
    map['tax_status'] = _taxStatus;
    map['tax_class'] = _taxClass;
    map['manage_stock'] = _manageStock;
    map['stock_quantity'] = _stockQuantity;
    map['in_stock'] = _inStock;
    map['shipping_required'] = _shippingRequired;
    map['shipping_taxable'] = _shippingTaxable;
    map['shipping_class'] = _shippingClass;
    map['shipping_class_id'] = _shippingClassId;
    map['reviews_allowed'] = _reviewsAllowed;
    map['average_rating'] = _averageRating;
    map['parent_id'] = _parentId;
    map['purchase_note'] = _purchaseNote;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
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
