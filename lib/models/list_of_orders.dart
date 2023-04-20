class ListOfOrders {
  dynamic id;
  dynamic status;
  dynamic dateCreated;
  dynamic total;
  dynamic customerId;
  dynamic paymentUrl;
  String? paymentMethod;
  String? paymentMethodTitle;
  List<LineItems>? lineItems;
  Shipping? shipping;

  ListOfOrders({
    this.id,
    this.status,
    this.dateCreated,
    this.total,
    this.customerId,
    this.lineItems,
    this.shipping,
    this.paymentMethod,
    this.paymentMethodTitle,
  });

  ListOfOrders.fromJson(dynamic json) {
    id = json['id'];
    status = json['status'];
    dateCreated = json['date_created'];
    total = json['total'];
    customerId = json['customer_id'];
    paymentUrl = json['payment_url'];
    paymentMethod = json['payment_method'];
    paymentMethodTitle = json['payment_method_title'];
    if (json['line_items'] != null) {
      lineItems = <LineItems>[];
      json['line_items'].forEach((v) {
        lineItems!.add(LineItems.fromJson(v));
      });
    }
    shipping = json['shipping'] != null ? Shipping.fromJson(json['shipping']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['date_created'] = dateCreated;
    data['total'] = total;
    data['customer_id'] = customerId;
    data['payment_url'] = paymentUrl;
    data['payment_method'] = paymentMethod;
    data['payment_method_title'] = paymentMethodTitle;
    if (lineItems != null) {
      data['line_items'] = lineItems!.map((v) => v.toJson()).toList();
    }
    if (shipping != null) {
      data['shipping'] = shipping!.toJson();
    }
    return data;
  }
}

class Billing {
  String? firstName;
  String? lastName;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;
  String? email;
  String? phone;

  Billing({this.firstName, this.lastName, this.company, this.address1, this.address2, this.city, this.state, this.postcode, this.country, this.email, this.phone});

  Billing.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['company'] = company;
    data['address_1'] = address1;
    data['address_2'] = address2;
    data['city'] = city;
    data['state'] = state;
    data['postcode'] = postcode;
    data['country'] = country;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}

class Shipping {
  String? firstName;
  String? lastName;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;
  String? phone;

  Shipping({this.firstName, this.lastName, this.company, this.address1, this.address2, this.city, this.state, this.postcode, this.country, this.phone});

  Shipping.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['company'] = company;
    data['address_1'] = address1;
    data['address_2'] = address2;
    data['city'] = city;
    data['state'] = state;
    data['postcode'] = postcode;
    data['country'] = country;
    data['phone'] = phone;
    return data;
  }
}

class MetaData {
  int? id;
  String? key;
  Value? value;

  MetaData({this.id, this.key, this.value});

  MetaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    value = json['value'] != null ? Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    if (value != null) {
      data['value'] = value!.toJson();
    }
    return data;
  }
}

class Value {
  USD? uSD;
  BDT? bDT;
  BDT? eUR;

  Value({this.uSD, this.bDT, this.eUR});

  Value.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
    bDT = json['BDT'] != null ? BDT.fromJson(json['BDT']) : null;
    eUR = json['EUR'] != null ? BDT.fromJson(json['EUR']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uSD != null) {
      data['USD'] = uSD!.toJson();
    }
    if (bDT != null) {
      data['BDT'] = bDT!.toJson();
    }
    if (eUR != null) {
      data['EUR'] = eUR!.toJson();
    }
    return data;
  }
}

class USD {
  String? rate;
  String? pos;
  String? decimals;
  String? custom;
  String? hide;
  int? isMain;

  USD({this.rate, this.pos, this.decimals, this.custom, this.hide, this.isMain});

  USD.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    pos = json['pos'];
    decimals = json['decimals'];
    custom = json['custom'];
    hide = json['hide'];
    isMain = json['is_main'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['pos'] = pos;
    data['decimals'] = decimals;
    data['custom'] = custom;
    data['hide'] = hide;
    data['is_main'] = isMain;
    return data;
  }
}

class BDT {
  String? rate;
  String? pos;
  String? decimals;
  String? custom;
  String? hide;

  BDT({this.rate, this.pos, this.decimals, this.custom, this.hide});

  BDT.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    pos = json['pos'];
    decimals = json['decimals'];
    custom = json['custom'];
    hide = json['hide'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['pos'] = pos;
    data['decimals'] = decimals;
    data['custom'] = custom;
    data['hide'] = hide;
    return data;
  }
}

class LineItems {
  dynamic id;
  dynamic name;
  dynamic productId;
  dynamic quantity;
  dynamic total;

  LineItems({this.id, this.name, this.productId, this.quantity, this.total});

  LineItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productId = json['product_id'];
    quantity = json['quantity'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    data['total'] = total;

    return data;
  }
}

// class LineItems {
//   LineItems({
//     required this.id,
//     required this.name,
//     required this.productId,
//     required this.variationId,
//     required this.quantity,
//     required this.subtotal,
//     required this.total,
//     required this.price,
//     required this.parentName,
//   });
//   late final int id;
//   late final String name;
//   late final int productId;
//   late final int variationId;
//   late final int quantity;
//   late final String subtotal;
//   late final String total;
//   late final int price;
//   late final String parentName;
//
//   LineItems.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     productId = json['product_id'];
//     variationId = json['variation_id'];
//     quantity = json['quantity'];
//     subtotal = json['subtotal'];
//     total = json['total'];
//     price = json['price'];
//     parentName = json['parent_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['product_id'] = productId;
//     _data['variation_id'] = variationId;
//     _data['quantity'] = quantity;
//     _data['subtotal'] = subtotal;
//     _data['total'] = total;
//     _data['price'] = price;
//     _data['parent_name'] = parentName;
//     return _data;
//   }
// }

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    return data;
  }
}
