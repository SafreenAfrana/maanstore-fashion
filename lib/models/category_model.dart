/// id : 15
/// name : "Backpack"
/// slug : "backpack"
/// parent : 0
/// description : ""
/// display : "default"
/// image : {"id":809,"date_created":"2021-10-28T04:47:23","date_created_gmt":"2021-10-28T04:47:23","date_modified":"2021-10-28T04:47:23","date_modified_gmt":"2021-10-28T04:47:23","src":"https://livetutorial.net/wp-content/uploads/2021/10/backpack.svg","title":"backpack","alt":""}
/// menu_order : 0
/// count : 6
/// _links : {"self":[{"href":"https://livetutorial.net/index.php/wp-json/wc/v2/products/categories/15"}],"collection":[{"href":"https://livetutorial.net/index.php/wp-json/wc/v2/products/categories"}]}

class CategoryModel {
  CategoryModel({
    int? id,
    String? name,
    String? slug,
    int? parent,
    String? description,
    String? display,
    Imagec? image,
    int? menuOrder,
    int? count,
    Links? links,
  }) {
    _id = id;
    _name = name;
    _slug = slug;
    _parent = parent;
    _description = description;
    _display = display;
    _image = image;
    _menuOrder = menuOrder;
    _count = count;
    _links = links;
  }

  CategoryModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _parent = json['parent'];
    _description = json['description'];
    _display = json['display'];
    _image = json['image'] != null ? Imagec.fromJson(json['image']) : null;
    _menuOrder = json['menu_order'];
    _count = json['count'];
    _links = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }
  int? _id;
  String? _name;
  String? _slug;
  int? _parent;
  String? _description;
  String? _display;
  Imagec? _image;
  int? _menuOrder;
  int? _count;
  Links? _links;

  int? get id => _id;
  String? get name => _name;
  String? get slug => _slug;
  int? get parent => _parent;
  String? get description => _description;
  String? get display => _display;
  Imagec? get image => _image;
  int? get menuOrder => _menuOrder;
  int? get count => _count;
  Links? get links => _links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['parent'] = _parent;
    map['description'] = _description;
    map['display'] = _display;
    if (_image != null) {
      map['image'] = _image?.toJson();
    }
    map['menu_order'] = _menuOrder;
    map['count'] = _count;
    if (_links != null) {
      map['_links'] = _links?.toJson();
    }
    return map;
  }
}

/// self : [{"href":"https://livetutorial.net/index.php/wp-json/wc/v2/products/categories/15"}]
/// collection : [{"href":"https://livetutorial.net/index.php/wp-json/wc/v2/products/categories"}]

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

/// href : "https://livetutorial.net/index.php/wp-json/wc/v2/products/categories"

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

/// href : "https://livetutorial.net/index.php/wp-json/wc/v2/products/categories/15"

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

/// id : 809
/// date_created : "2021-10-28T04:47:23"
/// date_created_gmt : "2021-10-28T04:47:23"
/// date_modified : "2021-10-28T04:47:23"
/// date_modified_gmt : "2021-10-28T04:47:23"
/// src : "https://livetutorial.net/wp-content/uploads/2021/10/backpack.svg"
/// title : "backpack"
/// alt : ""

class Imagec {
  Imagec({
    int? id,
    String? dateCreated,
    String? dateCreatedGmt,
    String? dateModified,
    String? dateModifiedGmt,
    String? src,
    String? title,
    String? alt,
  }) {
    _id = id;
    _dateCreated = dateCreated;
    _dateCreatedGmt = dateCreatedGmt;
    _dateModified = dateModified;
    _dateModifiedGmt = dateModifiedGmt;
    _src = src;
    _title = title;
    _alt = alt;
  }

  Imagec.fromJson(dynamic json) {
    _id = json['id'];
    _dateCreated = json['date_created'];
    _dateCreatedGmt = json['date_created_gmt'];
    _dateModified = json['date_modified'];
    _dateModifiedGmt = json['date_modified_gmt'];
    _src = json['src'];
    _title = json['title'];
    _alt = json['alt'];
  }
  int? _id;
  String? _dateCreated;
  String? _dateCreatedGmt;
  String? _dateModified;
  String? _dateModifiedGmt;
  String? _src;
  String? _title;
  String? _alt;

  int? get id => _id;
  String? get dateCreated => _dateCreated;
  String? get dateCreatedGmt => _dateCreatedGmt;
  String? get dateModified => _dateModified;
  String? get dateModifiedGmt => _dateModifiedGmt;
  String? get src => _src;
  String? get title => _title;
  String? get alt => _alt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['date_created'] = _dateCreated;
    map['date_created_gmt'] = _dateCreatedGmt;
    map['date_modified'] = _dateModified;
    map['date_modified_gmt'] = _dateModifiedGmt;
    map['src'] = _src;
    map['title'] = _title;
    map['alt'] = _alt;
    return map;
  }
}
