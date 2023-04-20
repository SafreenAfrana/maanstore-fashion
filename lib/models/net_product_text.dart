class NetproductText {
  NetproductText({
    int? id,
    String? name,
    String? slug,
    String? permalink,
    String? dateCreated,
    String? dateCreatedGmt,
    String? dateModified,
    String? dateModifiedGmt,
    String? type,
    String? status,
    bool? featured,
    String? catalogVisibility,
    String? description,
    String? shortDescription,
    String? sku,
    String? price,
    String? regularPrice,
    String? salePrice,
    dynamic dateOnSaleFrom,
    dynamic dateOnSaleFromGmt,
    dynamic dateOnSaleTo,
    dynamic dateOnSaleToGmt,
    bool? onSale,
    bool? purchasable,
    int? totalSales,
    bool? virtual,
    bool? downloadable,
    List<dynamic>? downloads,
    int? downloadLimit,
    int? downloadExpiry,
    String? externalUrl,
    String? buttonText,
    String? taxStatus,
    String? taxClass,
    bool? manageStock,
    int? stockQuantity,
    bool? inStock,
    String? backorders,
    bool? backordersAllowed,
    bool? backordered,
    bool? soldIndividually,
    String? weight,
    Dimensions? dimensions,
    bool? shippingRequired,
    bool? shippingTaxable,
    String? shippingClass,
    int? shippingClassId,
    bool? reviewsAllowed,
    String? averageRating,
    int? ratingCount,
    List<dynamic>? upsellIds,
    List<dynamic>? crossSellIds,
    int? parentId,
    String? purchaseNote,
    List<Categories>? categories,
    List<Tags>? tags,
    List<Images>? images,
    List<Attributes>? attributes,
    List<dynamic>? defaultAttributes,
    List<int>? variations,
    List<dynamic>? groupedProducts,
    int? menuOrder,
    String? priceHtml,
    List<int>? relatedIds,
    List<MetaData>? metaData,
    Links? links,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _permalink = permalink;
    _dateCreated = dateCreated;
    _dateCreatedGmt = dateCreatedGmt;
    _dateModified = dateModified;
    _dateModifiedGmt = dateModifiedGmt;
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
    _totalSales = totalSales;
    _virtual = virtual;
    _downloadable = downloadable;
    _downloads = downloads;
    _downloadLimit = downloadLimit;
    _downloadExpiry = downloadExpiry;
    _externalUrl = externalUrl;
    _buttonText = buttonText;
    _taxStatus = taxStatus;
    _taxClass = taxClass;
    _manageStock = manageStock;
    _stockQuantity = stockQuantity;
    _inStock = inStock;
    _backorders = backorders;
    _backordersAllowed = backordersAllowed;
    _backordered = backordered;
    _soldIndividually = soldIndividually;
    _weight = weight;
    _dimensions = dimensions;
    _shippingRequired = shippingRequired;
    _shippingTaxable = shippingTaxable;
    _shippingClass = shippingClass;
    _shippingClassId = shippingClassId;
    _reviewsAllowed = reviewsAllowed;
    _averageRating = averageRating;
    _ratingCount = ratingCount;
    _upsellIds = upsellIds;
    _crossSellIds = crossSellIds;
    _parentId = parentId;
    _purchaseNote = purchaseNote;
    _categories = categories;
    _tags = tags;
    _images = images;
    _attributes = attributes;
    _defaultAttributes = defaultAttributes;
    _variations = variations;
    _groupedProducts = groupedProducts;
    _menuOrder = menuOrder;
    _priceHtml = priceHtml;
    _relatedIds = relatedIds;
    _metaData = metaData;
    _links = links;
  }
  int? _id;
  String? _name;
  String? _slug;
  String? _permalink;
  String? _dateCreated;
  String? _dateCreatedGmt;
  String? _dateModified;
  String? _dateModifiedGmt;
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
  int? _totalSales;
  bool? _virtual;
  bool? _downloadable;
  List<dynamic>? _downloads;
  int? _downloadLimit;
  int? _downloadExpiry;
  String? _externalUrl;
  String? _buttonText;
  String? _taxStatus;
  String? _taxClass;
  bool? _manageStock;
  int? _stockQuantity;
  bool? _inStock;
  String? _backorders;
  bool? _backordersAllowed;
  bool? _backordered;
  bool? _soldIndividually;
  String? _weight;
  Dimensions? _dimensions;
  bool? _shippingRequired;
  bool? _shippingTaxable;
  String? _shippingClass;
  int? _shippingClassId;
  bool? _reviewsAllowed;
  String? _averageRating;
  int? _ratingCount;
  List<dynamic>? _upsellIds;
  List<dynamic>? _crossSellIds;
  int? _parentId;
  String? _purchaseNote;
  List<Categories>? _categories;
  List<Tags>? _tags;
  List<Images>? _images;
  List<Attributes>? _attributes;
  List<dynamic>? _defaultAttributes;
  List<int>? _variations;
  List<dynamic>? _groupedProducts;
  int? _menuOrder;
  String? _priceHtml;
  List<int>? _relatedIds;
  List<MetaData>? _metaData;
  Links? _links;

  int? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  String? get permalink => _permalink;
  String? get dateCreated => _dateCreated;
  String? get dateCreatedGmt => _dateCreatedGmt;
  String? get dateModified => _dateModified;
  String? get dateModifiedGmt => _dateModifiedGmt;
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
  int? get totalSales => _totalSales;
  bool? get virtual => _virtual;
  bool? get downloadable => _downloadable;
  List<dynamic>? get downloads => _downloads;
  int? get downloadLimit => _downloadLimit;
  int? get downloadExpiry => _downloadExpiry;
  String? get externalUrl => _externalUrl;
  String? get buttonText => _buttonText;
  String? get taxStatus => _taxStatus;
  String? get taxClass => _taxClass;
  bool? get manageStock => _manageStock;
  int? get stockQuantity => _stockQuantity;
  bool? get inStock => _inStock;
  String? get backorders => _backorders;
  bool? get backordersAllowed => _backordersAllowed;
  bool? get backordered => _backordered;
  bool? get soldIndividually => _soldIndividually;
  String? get weight => _weight;
  Dimensions? get dimensions => _dimensions;
  bool? get shippingRequired => _shippingRequired;
  bool? get shippingTaxable => _shippingTaxable;
  String? get shippingClass => _shippingClass;
  int? get shippingClassId => _shippingClassId;
  bool? get reviewsAllowed => _reviewsAllowed;
  String? get averageRating => _averageRating;
  int? get ratingCount => _ratingCount;
  List<dynamic>? get upsellIds => _upsellIds;
  List<dynamic>? get crossSellIds => _crossSellIds;
  int? get parentId => _parentId;
  String? get purchaseNote => _purchaseNote;
  List<Categories>? get categories => _categories;
  List<Tags>? get tags => _tags;
  List<Images>? get images => _images;
  List<Attributes>? get attributes => _attributes;
  List<dynamic>? get defaultAttributes => _defaultAttributes;
  List<int>? get variations => _variations;
  List<dynamic>? get groupedProducts => _groupedProducts;
  int? get menuOrder => _menuOrder;
  String? get priceHtml => _priceHtml;
  List<int>? get relatedIds => _relatedIds;
  List<MetaData>? get metaData => _metaData;
  Links? get links => _links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['permalink'] = _permalink;
    map['date_created'] = _dateCreated;
    map['date_created_gmt'] = _dateCreatedGmt;
    map['date_modified'] = _dateModified;
    map['date_modified_gmt'] = _dateModifiedGmt;
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
    map['total_sales'] = _totalSales;
    map['virtual'] = _virtual;
    map['downloadable'] = _downloadable;
    if (_downloads != null) {
      map['downloads'] = _downloads?.map((v) => v.toJson()).toList();
    }
    map['download_limit'] = _downloadLimit;
    map['download_expiry'] = _downloadExpiry;
    map['external_url'] = _externalUrl;
    map['button_text'] = _buttonText;
    map['tax_status'] = _taxStatus;
    map['tax_class'] = _taxClass;
    map['manage_stock'] = _manageStock;
    map['stock_quantity'] = _stockQuantity;
    map['in_stock'] = _inStock;
    map['backorders'] = _backorders;
    map['backorders_allowed'] = _backordersAllowed;
    map['backordered'] = _backordered;
    map['sold_individually'] = _soldIndividually;
    map['weight'] = _weight;
    if (_dimensions != null) {
      map['dimensions'] = _dimensions?.toJson();
    }
    map['shipping_required'] = _shippingRequired;
    map['shipping_taxable'] = _shippingTaxable;
    map['shipping_class'] = _shippingClass;
    map['shipping_class_id'] = _shippingClassId;
    map['reviews_allowed'] = _reviewsAllowed;
    map['average_rating'] = _averageRating;
    map['rating_count'] = _ratingCount;
    if (_upsellIds != null) {
      map['upsell_ids'] = _upsellIds?.map((v) => v.toJson()).toList();
    }
    if (_crossSellIds != null) {
      map['cross_sell_ids'] = _crossSellIds?.map((v) => v.toJson()).toList();
    }
    map['parent_id'] = _parentId;
    map['purchase_note'] = _purchaseNote;
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    if (_tags != null) {
      map['tags'] = _tags?.map((v) => v.toJson()).toList();
    }
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    if (_defaultAttributes != null) {
      map['default_attributes'] =
          _defaultAttributes?.map((v) => v.toJson()).toList();
    }
    map['variations'] = _variations;
    if (_groupedProducts != null) {
      map['grouped_products'] =
          _groupedProducts?.map((v) => v.toJson()).toList();
    }
    map['menu_order'] = _menuOrder;
    map['price_html'] = _priceHtml;
    map['related_ids'] = _relatedIds;
    if (_metaData != null) {
      map['meta_data'] = _metaData?.map((v) => v.toJson()).toList();
    }
    if (_links != null) {
      map['_links'] = _links?.toJson();
    }
    return map;
  }
}

/// self : [{"href":"https://livetutorial.net/index.php/wp-json/wc/v2/products/6377"}]
/// collection : [{"href":"https://livetutorial.net/index.php/wp-json/wc/v2/products"}]

class Links {
  Links({
    List<Self>? self,
    List<Collection>? collection,
  }) {
    _self = self;
    _collection = collection;
  }

  Links.fromJson(dynamic json) {
    if (json['self'] != null) {
      _self = [];
      json['self'].forEach((v) {
        _self?.add(Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      _collection = [];
      json['collection'].forEach((v) {
        _collection?.add(Collection.fromJson(v));
      });
    }
  }
  List<Self>? _self;
  List<Collection>? _collection;

  List<Self>? get self => _self;
  List<Collection>? get collection => _collection;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_self != null) {
      map['self'] = _self?.map((v) => v.toJson()).toList();
    }
    if (_collection != null) {
      map['collection'] = _collection?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// href : "https://livetutorial.net/index.php/wp-json/wc/v2/products"

class Collection {
  Collection({
    String? href,
  }) {
    _href = href;
  }

  Collection.fromJson(dynamic json) {
    _href = json['href'];
  }
  String? _href;

  String? get href => _href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = _href;
    return map;
  }
}

/// href : "https://livetutorial.net/index.php/wp-json/wc/v2/products/6377"

class Self {
  Self({
    String? href,
  }) {
    _href = href;
  }

  Self.fromJson(dynamic json) {
    _href = json['href'];
  }
  String? _href;

  String? get href => _href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = _href;
    return map;
  }
}

/// id : 4253
/// key : "shopengine_product_views_count"
/// value : "204"

class MetaData {
  MetaData({
    int? id,
    String? key,
    String? value,
  }) {
    _id = id;
    _key = key;
    _value = value;
  }

  MetaData.fromJson(dynamic json) {
    _id = json['id'];
    _key = json['key'];
    _value = json['value'];
  }
  int? _id;
  String? _key;
  String? _value;

  int? get id => _id;
  String? get key => _key;
  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['key'] = _key;
    map['value'] = _value;
    return map;
  }
}

/// id : 1
/// name : "color"
/// position : 0
/// visible : true
/// variation : true
/// options : ["Green","Orange"]

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

/// id : 6379
/// date_created : "2022-01-09T07:10:12"
/// date_created_gmt : "2022-01-09T07:10:12"
/// date_modified : "2022-06-04T05:23:50"
/// date_modified_gmt : "2022-06-04T05:23:50"
/// src : "https://livetutorial.net/wp-content/uploads/2022/01/071.png"
/// name : "07[1]"
/// alt : ""
/// position : 0

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

/// id : 59
/// name : "shoe"
/// slug : "shoe"

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

/// id : 86
/// name : "Flash Sale"
/// slug : "flash-sale"

class Categories {
  Categories({
    int? id,
    String? name,
    String? slug,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
  }

  Categories.fromJson(dynamic json) {
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

/// length : ""
/// width : ""
/// height : ""

class Dimensions {
  Dimensions({
    String? length,
    String? width,
    String? height,
  }) {
    _length = length;
    _width = width;
    _height = height;
  }

  Dimensions.fromJson(dynamic json) {
    _length = json['length'];
    _width = json['width'];
    _height = json['height'];
  }
  String? _length;
  String? _width;
  String? _height;

  String? get length => _length;
  String? get width => _width;
  String? get height => _height;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['length'] = _length;
    map['width'] = _width;
    map['height'] = _height;
    return map;
  }
}
