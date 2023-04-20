/// id : 727
/// parent_id : 0
/// number : "727"
/// order_key : "wc_order_58d2d042d1d"
/// created_via : "rest-api"
/// version : "3.0.0"
/// status : "processing"
/// currency : "USD"
/// date_created : "2017-03-22T16:28:02"
/// date_created_gmt : "2017-03-22T19:28:02"
/// date_modified : "2017-03-22T16:28:08"
/// date_modified_gmt : "2017-03-22T19:28:08"
/// discount_total : "0.00"
/// discount_tax : "0.00"
/// shipping_total : "10.00"
/// shipping_tax : "0.00"
/// cart_tax : "1.35"
/// total : "29.35"
/// total_tax : "1.35"
/// prices_include_tax : false
/// customer_id : 0
/// customer_ip_address : ""
/// customer_user_agent : ""
/// customer_note : ""
/// billing : {"first_name":"John","last_name":"Doe","company":"","address_1":"969 Market","address_2":"","city":"San Francisco","state":"CA","postcode":"94103","country":"US","email":"john.doe@example.com","phone":"(555) 555-5555"}
/// shipping : {"first_name":"John","last_name":"Doe","company":"","address_1":"969 Market","address_2":"","city":"San Francisco","state":"CA","postcode":"94103","country":"US"}
/// payment_method : "bacs"
/// payment_method_title : "Direct Bank Transfer"
/// transaction_id : ""
/// date_paid : "2017-03-22T16:28:08"
/// date_paid_gmt : "2017-03-22T19:28:08"
/// date_completed : null
/// date_completed_gmt : null
/// cart_hash : ""
/// meta_data : [{"id":13106,"key":"_download_permissions_granted","value":"yes"}]
/// line_items : [{"id":315,"name":"Woo Single #1","product_id":93,"variation_id":0,"quantity":2,"tax_class":"","subtotal":"6.00","subtotal_tax":"0.45","total":"6.00","total_tax":"0.45","taxes":[{"id":75,"total":"0.45","subtotal":"0.45"}],"meta_data":[],"sku":"","price":3},{"id":316,"name":"Ship Your Idea &ndash; Color: Black, Size: M Test","product_id":22,"variation_id":23,"quantity":1,"tax_class":"","subtotal":"12.00","subtotal_tax":"0.90","total":"12.00","total_tax":"0.90","taxes":[{"id":75,"total":"0.9","subtotal":"0.9"}],"meta_data":[{"id":2095,"key":"pa_color","value":"black"},{"id":2096,"key":"size","value":"M Test"}],"sku":"Bar3","price":12}]
/// tax_lines : [{"id":318,"rate_code":"US-CA-STATE TAX","rate_id":75,"label":"State Tax","compound":false,"tax_total":"1.35","shipping_tax_total":"0.00","meta_data":[]}]
/// shipping_lines : [{"id":317,"method_title":"Flat Rate","method_id":"flat_rate","total":"10.00","total_tax":"0.00","taxes":[],"meta_data":[]}]
/// fee_lines : []
/// coupon_lines : []
/// refunds : []
/// _links : {"self":[{"href":"https://example.com/wp-json/wc/v3/orders/727"}],"collection":[{"href":"https://example.com/wp-json/wc/v3/orders"}]}

class OrderResponseModel {
  OrderResponseModel({
    int? id,
    int? parentId,
    String? number,
    String? orderKey,
    String? createdVia,
    String? version,
    String? status,
    String? currency,
    String? dateCreated,
    String? dateCreatedGmt,
    String? dateModified,
    String? dateModifiedGmt,
    String? discountTotal,
    String? discountTax,
    String? shippingTotal,
    String? shippingTax,
    String? cartTax,
    String? total,
    String? totalTax,
    bool? pricesIncludeTax,
    int? customerId,
    String? customerIpAddress,
    String? customerUserAgent,
    String? customerNote,
    Billing? billing,
    Shipping? shipping,
    String? paymentMethod,
    String? paymentMethodTitle,
    String? transactionId,
    String? datePaid,
    String? datePaidGmt,
    dynamic dateCompleted,
    dynamic dateCompletedGmt,
    String? cartHash,
    List<MetaData>? metaData,
    List<LineItems>? lineItems,
    List<TaxLines>? taxLines,
    List<ShippingLines>? shippingLines,
    List<dynamic>? feeLines,
    List<dynamic>? couponLines,
    List<dynamic>? refunds,
    Links? links,
  }) {
    _id = id;
    _parentId = parentId;
    _number = number;
    _orderKey = orderKey;
    _createdVia = createdVia;
    _version = version;
    _status = status;
    _currency = currency;
    _dateCreated = dateCreated;
    _dateCreatedGmt = dateCreatedGmt;
    _dateModified = dateModified;
    _dateModifiedGmt = dateModifiedGmt;
    _discountTotal = discountTotal;
    _discountTax = discountTax;
    _shippingTotal = shippingTotal;
    _shippingTax = shippingTax;
    _cartTax = cartTax;
    _total = total;
    _totalTax = totalTax;
    _pricesIncludeTax = pricesIncludeTax;
    _customerId = customerId;
    _customerIpAddress = customerIpAddress;
    _customerUserAgent = customerUserAgent;
    _customerNote = customerNote;
    _billing = billing;
    _shipping = shipping;
    _paymentMethod = paymentMethod;
    _paymentMethodTitle = paymentMethodTitle;
    _transactionId = transactionId;
    _datePaid = datePaid;
    _datePaidGmt = datePaidGmt;
    _dateCompleted = dateCompleted;
    _dateCompletedGmt = dateCompletedGmt;
    _cartHash = cartHash;
    _metaData = metaData;
    _lineItems = lineItems;
    _taxLines = taxLines;
    _shippingLines = shippingLines;
    _feeLines = feeLines;
    _couponLines = couponLines;
    _refunds = refunds;
    _links = links;
  }

  OrderResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _parentId = json['parent_id'];
    _number = json['number'];
    _orderKey = json['order_key'];
    _createdVia = json['created_via'];
    _version = json['version'];
    _status = json['status'];
    _currency = json['currency'];
    _dateCreated = json['date_created'];
    _dateCreatedGmt = json['date_created_gmt'];
    _dateModified = json['date_modified'];
    _dateModifiedGmt = json['date_modified_gmt'];
    _discountTotal = json['discount_total'];
    _discountTax = json['discount_tax'];
    _shippingTotal = json['shipping_total'];
    _shippingTax = json['shipping_tax'];
    _cartTax = json['cart_tax'];
    _total = json['total'];
    _totalTax = json['total_tax'];
    _pricesIncludeTax = json['prices_include_tax'];
    _customerId = json['customer_id'];
    _customerIpAddress = json['customer_ip_address'];
    _customerUserAgent = json['customer_user_agent'];
    _customerNote = json['customer_note'];
    _billing =
        json['billing'] != null ? Billing.fromJson(json['billing']) : null;
    _shipping =
        json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null;
    _paymentMethod = json['payment_method'];
    _paymentMethodTitle = json['payment_method_title'];
    _transactionId = json['transaction_id'];
    _datePaid = json['date_paid'];
    _datePaidGmt = json['date_paid_gmt'];
    _dateCompleted = json['date_completed'];
    _dateCompletedGmt = json['date_completed_gmt'];
    _cartHash = json['cart_hash'];
    if (json['meta_data'] != null) {
      _metaData = [];
      json['meta_data'].forEach((v) {
        _metaData?.add(MetaData.fromJson(v));
      });
    }
    if (json['line_items'] != null) {
      _lineItems = [];
      json['line_items'].forEach((v) {
        _lineItems?.add(LineItems.fromJson(v));
      });
    }
    if (json['tax_lines'] != null) {
      _taxLines = [];
      json['tax_lines'].forEach((v) {
        _taxLines?.add(TaxLines.fromJson(v));
      });
    }
    if (json['shipping_lines'] != null) {
      _shippingLines = [];
      json['shipping_lines'].forEach((v) {
        _shippingLines?.add(ShippingLines.fromJson(v));
      });
    }
    _links = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }
  int? _id;
  int? _parentId;
  String? _number;
  String? _orderKey;
  String? _createdVia;
  String? _version;
  String? _status;
  String? _currency;
  String? _dateCreated;
  String? _dateCreatedGmt;
  String? _dateModified;
  String? _dateModifiedGmt;
  String? _discountTotal;
  String? _discountTax;
  String? _shippingTotal;
  String? _shippingTax;
  String? _cartTax;
  String? _total;
  String? _totalTax;
  bool? _pricesIncludeTax;
  int? _customerId;
  String? _customerIpAddress;
  String? _customerUserAgent;
  String? _customerNote;
  Billing? _billing;
  Shipping? _shipping;
  String? _paymentMethod;
  String? _paymentMethodTitle;
  String? _transactionId;
  String? _datePaid;
  String? _datePaidGmt;
  dynamic _dateCompleted;
  dynamic _dateCompletedGmt;
  String? _cartHash;
  List<MetaData>? _metaData;
  List<LineItems>? _lineItems;
  List<TaxLines>? _taxLines;
  List<ShippingLines>? _shippingLines;
  List<dynamic>? _feeLines;
  List<dynamic>? _couponLines;
  List<dynamic>? _refunds;
  Links? _links;

  int? get id => _id;
  int? get parentId => _parentId;
  String? get number => _number;
  String? get orderKey => _orderKey;
  String? get createdVia => _createdVia;
  String? get version => _version;
  String? get status => _status;
  String? get currency => _currency;
  String? get dateCreated => _dateCreated;
  String? get dateCreatedGmt => _dateCreatedGmt;
  String? get dateModified => _dateModified;
  String? get dateModifiedGmt => _dateModifiedGmt;
  String? get discountTotal => _discountTotal;
  String? get discountTax => _discountTax;
  String? get shippingTotal => _shippingTotal;
  String? get shippingTax => _shippingTax;
  String? get cartTax => _cartTax;
  String? get total => _total;
  String? get totalTax => _totalTax;
  bool? get pricesIncludeTax => _pricesIncludeTax;
  int? get customerId => _customerId;
  String? get customerIpAddress => _customerIpAddress;
  String? get customerUserAgent => _customerUserAgent;
  String? get customerNote => _customerNote;
  Billing? get billing => _billing;
  Shipping? get shipping => _shipping;
  String? get paymentMethod => _paymentMethod;
  String? get paymentMethodTitle => _paymentMethodTitle;
  String? get transactionId => _transactionId;
  String? get datePaid => _datePaid;
  String? get datePaidGmt => _datePaidGmt;
  dynamic get dateCompleted => _dateCompleted;
  dynamic get dateCompletedGmt => _dateCompletedGmt;
  String? get cartHash => _cartHash;
  List<MetaData>? get metaData => _metaData;
  List<LineItems>? get lineItems => _lineItems;
  List<TaxLines>? get taxLines => _taxLines;
  List<ShippingLines>? get shippingLines => _shippingLines;
  List<dynamic>? get feeLines => _feeLines;
  List<dynamic>? get couponLines => _couponLines;
  List<dynamic>? get refunds => _refunds;
  Links? get links => _links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['parent_id'] = _parentId;
    map['number'] = _number;
    map['order_key'] = _orderKey;
    map['created_via'] = _createdVia;
    map['version'] = _version;
    map['status'] = _status;
    map['currency'] = _currency;
    map['date_created'] = _dateCreated;
    map['date_created_gmt'] = _dateCreatedGmt;
    map['date_modified'] = _dateModified;
    map['date_modified_gmt'] = _dateModifiedGmt;
    map['discount_total'] = _discountTotal;
    map['discount_tax'] = _discountTax;
    map['shipping_total'] = _shippingTotal;
    map['shipping_tax'] = _shippingTax;
    map['cart_tax'] = _cartTax;
    map['total'] = _total;
    map['total_tax'] = _totalTax;
    map['prices_include_tax'] = _pricesIncludeTax;
    map['customer_id'] = _customerId;
    map['customer_ip_address'] = _customerIpAddress;
    map['customer_user_agent'] = _customerUserAgent;
    map['customer_note'] = _customerNote;
    if (_billing != null) {
      map['billing'] = _billing?.toJson();
    }
    if (_shipping != null) {
      map['shipping'] = _shipping?.toJson();
    }
    map['payment_method'] = _paymentMethod;
    map['payment_method_title'] = _paymentMethodTitle;
    map['transaction_id'] = _transactionId;
    map['date_paid'] = _datePaid;
    map['date_paid_gmt'] = _datePaidGmt;
    map['date_completed'] = _dateCompleted;
    map['date_completed_gmt'] = _dateCompletedGmt;
    map['cart_hash'] = _cartHash;
    if (_metaData != null) {
      map['meta_data'] = _metaData?.map((v) => v.toJson()).toList();
    }
    if (_lineItems != null) {
      map['line_items'] = _lineItems?.map((v) => v.toJson()).toList();
    }
    if (_taxLines != null) {
      map['tax_lines'] = _taxLines?.map((v) => v.toJson()).toList();
    }
    if (_shippingLines != null) {
      map['shipping_lines'] = _shippingLines?.map((v) => v.toJson()).toList();
    }
    if (_feeLines != null) {
      map['fee_lines'] = _feeLines?.map((v) => v.toJson()).toList();
    }
    if (_couponLines != null) {
      map['coupon_lines'] = _couponLines?.map((v) => v.toJson()).toList();
    }
    if (_refunds != null) {
      map['refunds'] = _refunds?.map((v) => v.toJson()).toList();
    }
    if (_links != null) {
      map['_links'] = _links?.toJson();
    }
    return map;
  }
}

/// self : [{"href":"https://example.com/wp-json/wc/v3/orders/727"}]
/// collection : [{"href":"https://example.com/wp-json/wc/v3/orders"}]

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

/// href : "https://example.com/wp-json/wc/v3/orders"

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

/// href : "https://example.com/wp-json/wc/v3/orders/727"

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

/// id : 317
/// method_title : "Flat Rate"
/// method_id : "flat_rate"
/// total : "10.00"
/// total_tax : "0.00"
/// taxes : []
/// meta_data : []

class ShippingLines {
  ShippingLines({
    int? id,
    String? methodTitle,
    String? methodId,
    String? total,
    String? totalTax,
    List<dynamic>? taxes,
    List<dynamic>? metaData,
  }) {
    _id = id;
    _methodTitle = methodTitle;
    _methodId = methodId;
    _total = total;
    _totalTax = totalTax;
    _taxes = taxes;
    _metaData = metaData;
  }

  ShippingLines.fromJson(dynamic json) {
    _id = json['id'];
    _methodTitle = json['method_title'];
    _methodId = json['method_id'];
    _total = json['total'];
    _totalTax = json['total_tax'];
  }
  int? _id;
  String? _methodTitle;
  String? _methodId;
  String? _total;
  String? _totalTax;
  List<dynamic>? _taxes;
  List<dynamic>? _metaData;

  int? get id => _id;
  String? get methodTitle => _methodTitle;
  String? get methodId => _methodId;
  String? get total => _total;
  String? get totalTax => _totalTax;
  List<dynamic>? get taxes => _taxes;
  List<dynamic>? get metaData => _metaData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['method_title'] = _methodTitle;
    map['method_id'] = _methodId;
    map['total'] = _total;
    map['total_tax'] = _totalTax;
    if (_taxes != null) {
      map['taxes'] = _taxes?.map((v) => v.toJson()).toList();
    }
    if (_metaData != null) {
      map['meta_data'] = _metaData?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 318
/// rate_code : "US-CA-STATE TAX"
/// rate_id : 75
/// label : "State Tax"
/// compound : false
/// tax_total : "1.35"
/// shipping_tax_total : "0.00"
/// meta_data : []

class TaxLines {
  TaxLines({
    int? id,
    String? rateCode,
    int? rateId,
    String? label,
    bool? compound,
    String? taxTotal,
    String? shippingTaxTotal,
    List<dynamic>? metaData,
  }) {
    _id = id;
    _rateCode = rateCode;
    _rateId = rateId;
    _label = label;
    _compound = compound;
    _taxTotal = taxTotal;
    _shippingTaxTotal = shippingTaxTotal;
    _metaData = metaData;
  }

  TaxLines.fromJson(dynamic json) {
    _id = json['id'];
    _rateCode = json['rate_code'];
    _rateId = json['rate_id'];
    _label = json['label'];
    _compound = json['compound'];
    _taxTotal = json['tax_total'];
    _shippingTaxTotal = json['shipping_tax_total'];
  }
  int? _id;
  String? _rateCode;
  int? _rateId;
  String? _label;
  bool? _compound;
  String? _taxTotal;
  String? _shippingTaxTotal;
  List<dynamic>? _metaData;

  int? get id => _id;
  String? get rateCode => _rateCode;
  int? get rateId => _rateId;
  String? get label => _label;
  bool? get compound => _compound;
  String? get taxTotal => _taxTotal;
  String? get shippingTaxTotal => _shippingTaxTotal;
  List<dynamic>? get metaData => _metaData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['rate_code'] = _rateCode;
    map['rate_id'] = _rateId;
    map['label'] = _label;
    map['compound'] = _compound;
    map['tax_total'] = _taxTotal;
    map['shipping_tax_total'] = _shippingTaxTotal;
    if (_metaData != null) {
      map['meta_data'] = _metaData?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 315
/// name : "Woo Single #1"
/// product_id : 93
/// variation_id : 0
/// quantity : 2
/// tax_class : ""
/// subtotal : "6.00"
/// subtotal_tax : "0.45"
/// total : "6.00"
/// total_tax : "0.45"
/// taxes : [{"id":75,"total":"0.45","subtotal":"0.45"}]
/// meta_data : []
/// sku : ""
/// price : 3

class LineItems {
  LineItems({
    int? id,
    String? name,
    int? productId,
    int? variationId,
    int? quantity,
    String? taxClass,
    String? subtotal,
    String? subtotalTax,
    String? total,
    String? totalTax,
    List<Taxes>? taxes,
    List<dynamic>? metaData,
    String? sku,
    int? price,
  }) {
    _id = id;
    _name = name;
    _productId = productId;
    _variationId = variationId;
    _quantity = quantity;
    _taxClass = taxClass;
    _subtotal = subtotal;
    _subtotalTax = subtotalTax;
    _total = total;
    _totalTax = totalTax;
    _taxes = taxes;
    _metaData = metaData;
    _sku = sku;
    _price = price;
  }

  LineItems.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _productId = json['product_id'];
    _variationId = json['variation_id'];
    _quantity = json['quantity'];
    _taxClass = json['tax_class'];
    _subtotal = json['subtotal'];
    _subtotalTax = json['subtotal_tax'];
    _total = json['total'];
    _totalTax = json['total_tax'];
    if (json['taxes'] != null) {
      _taxes = [];
      json['taxes'].forEach((v) {
        _taxes?.add(Taxes.fromJson(v));
      });
    }
    _sku = json['sku'];
    _price = json['price'];
  }
  int? _id;
  String? _name;
  int? _productId;
  int? _variationId;
  int? _quantity;
  String? _taxClass;
  String? _subtotal;
  String? _subtotalTax;
  String? _total;
  String? _totalTax;
  List<Taxes>? _taxes;
  List<dynamic>? _metaData;
  String? _sku;
  int? _price;

  int? get id => _id;
  String? get name => _name;
  int? get productId => _productId;
  int? get variationId => _variationId;
  int? get quantity => _quantity;
  String? get taxClass => _taxClass;
  String? get subtotal => _subtotal;
  String? get subtotalTax => _subtotalTax;
  String? get total => _total;
  String? get totalTax => _totalTax;
  List<Taxes>? get taxes => _taxes;
  List<dynamic>? get metaData => _metaData;
  String? get sku => _sku;
  int? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['product_id'] = _productId;
    map['variation_id'] = _variationId;
    map['quantity'] = _quantity;
    map['tax_class'] = _taxClass;
    map['subtotal'] = _subtotal;
    map['subtotal_tax'] = _subtotalTax;
    map['total'] = _total;
    map['total_tax'] = _totalTax;
    if (_taxes != null) {
      map['taxes'] = _taxes?.map((v) => v.toJson()).toList();
    }
    if (_metaData != null) {
      map['meta_data'] = _metaData?.map((v) => v.toJson()).toList();
    }
    map['sku'] = _sku;
    map['price'] = _price;
    return map;
  }
}

/// id : 75
/// total : "0.45"
/// subtotal : "0.45"

class Taxes {
  Taxes({
    int? id,
    String? total,
    String? subtotal,
  }) {
    _id = id;
    _total = total;
    _subtotal = subtotal;
  }

  Taxes.fromJson(dynamic json) {
    _id = json['id'];
    _total = json['total'];
    _subtotal = json['subtotal'];
  }
  int? _id;
  String? _total;
  String? _subtotal;

  int? get id => _id;
  String? get total => _total;
  String? get subtotal => _subtotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['total'] = _total;
    map['subtotal'] = _subtotal;
    return map;
  }
}

/// id : 13106
/// key : "_download_permissions_granted"
/// value : "yes"

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

/// first_name : "John"
/// last_name : "Doe"
/// company : ""
/// address_1 : "969 Market"
/// address_2 : ""
/// city : "San Francisco"
/// state : "CA"
/// postcode : "94103"
/// country : "US"

class Shipping {
  Shipping({
    String? firstName,
    String? lastName,
    String? company,
    String? address1,
    String? address2,
    String? city,
    String? state,
    String? postcode,
    String? country,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _company = company;
    _address1 = address1;
    _address2 = address2;
    _city = city;
    _state = state;
    _postcode = postcode;
    _country = country;
  }

  Shipping.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _company = json['company'];
    _address1 = json['address_1'];
    _address2 = json['address_2'];
    _city = json['city'];
    _state = json['state'];
    _postcode = json['postcode'];
    _country = json['country'];
  }
  String? _firstName;
  String? _lastName;
  String? _company;
  String? _address1;
  String? _address2;
  String? _city;
  String? _state;
  String? _postcode;
  String? _country;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get company => _company;
  String? get address1 => _address1;
  String? get address2 => _address2;
  String? get city => _city;
  String? get state => _state;
  String? get postcode => _postcode;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['company'] = _company;
    map['address_1'] = _address1;
    map['address_2'] = _address2;
    map['city'] = _city;
    map['state'] = _state;
    map['postcode'] = _postcode;
    map['country'] = _country;
    return map;
  }
}

/// first_name : "John"
/// last_name : "Doe"
/// company : ""
/// address_1 : "969 Market"
/// address_2 : ""
/// city : "San Francisco"
/// state : "CA"
/// postcode : "94103"
/// country : "US"
/// email : "john.doe@example.com"
/// phone : "(555) 555-5555"

class Billing {
  Billing({
    String? firstName,
    String? lastName,
    String? company,
    String? address1,
    String? address2,
    String? city,
    String? state,
    String? postcode,
    String? country,
    String? email,
    String? phone,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _company = company;
    _address1 = address1;
    _address2 = address2;
    _city = city;
    _state = state;
    _postcode = postcode;
    _country = country;
    _email = email;
    _phone = phone;
  }

  Billing.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _company = json['company'];
    _address1 = json['address_1'];
    _address2 = json['address_2'];
    _city = json['city'];
    _state = json['state'];
    _postcode = json['postcode'];
    _country = json['country'];
    _email = json['email'];
    _phone = json['phone'];
  }
  String? _firstName;
  String? _lastName;
  String? _company;
  String? _address1;
  String? _address2;
  String? _city;
  String? _state;
  String? _postcode;
  String? _country;
  String? _email;
  String? _phone;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get company => _company;
  String? get address1 => _address1;
  String? get address2 => _address2;
  String? get city => _city;
  String? get state => _state;
  String? get postcode => _postcode;
  String? get country => _country;
  String? get email => _email;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['company'] = _company;
    map['address_1'] = _address1;
    map['address_2'] = _address2;
    map['city'] = _city;
    map['state'] = _state;
    map['postcode'] = _postcode;
    map['country'] = _country;
    map['email'] = _email;
    map['phone'] = _phone;
    return map;
  }
}
