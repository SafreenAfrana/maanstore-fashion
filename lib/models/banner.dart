
class Banner {
  Banner({
      this.guid,
      this.altText, });

  Banner.fromJson(dynamic json) {
    guid = json['guid'] != null ? Guid.fromJson(json['guid']) : null;
    altText = json['alt_text'];
  }
  Guid? guid;
  String? altText;
Banner copyWith({
  Guid? guid,
  String? altText,
}) => Banner(
  guid: guid ?? this.guid,
  altText: altText ?? this.altText,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (guid != null) {
      map['guid'] = guid?.toJson();
    }
    map['alt_text'] = altText;
    return map;
  }

}
/// aperture : "0"
/// credit : ""
/// camera : ""
/// caption : ""
/// created_timestamp : "0"
/// copyright : ""
/// focal_length : "0"
/// iso : "0"
/// shutter_speed : "0"
/// title : ""
/// orientation : "0"
/// keywords : []

class ImageMeta {
  ImageMeta({
      this.aperture,
      this.credit,
      this.camera,
      this.caption,
      this.createdTimestamp,
      this.copyright,
      this.focalLength,
      this.iso,
      this.shutterSpeed,
      this.title,
      this.orientation,
      this.keywords,});

  ImageMeta.fromJson(dynamic json) {
    aperture = json['aperture'];
    credit = json['credit'];
    camera = json['camera'];
    caption = json['caption'];
    createdTimestamp = json['created_timestamp'];
    copyright = json['copyright'];
    focalLength = json['focal_length'];
    iso = json['iso'];
    shutterSpeed = json['shutter_speed'];
    title = json['title'];
    orientation = json['orientation'];
  }
  String? aperture;
  String? credit;
  String? camera;
  String? caption;
  String? createdTimestamp;
  String? copyright;
  String? focalLength;
  String? iso;
  String? shutterSpeed;
  String? title;
  String? orientation;
  List<dynamic>? keywords;
ImageMeta copyWith({  String? aperture,
  String? credit,
  String? camera,
  String? caption,
  String? createdTimestamp,
  String? copyright,
  String? focalLength,
  String? iso,
  String? shutterSpeed,
  String? title,
  String? orientation,
  List<dynamic>? keywords,
}) => ImageMeta(  aperture: aperture ?? this.aperture,
  credit: credit ?? this.credit,
  camera: camera ?? this.camera,
  caption: caption ?? this.caption,
  createdTimestamp: createdTimestamp ?? this.createdTimestamp,
  copyright: copyright ?? this.copyright,
  focalLength: focalLength ?? this.focalLength,
  iso: iso ?? this.iso,
  shutterSpeed: shutterSpeed ?? this.shutterSpeed,
  title: title ?? this.title,
  orientation: orientation ?? this.orientation,
  keywords: keywords ?? this.keywords,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aperture'] = aperture;
    map['credit'] = credit;
    map['camera'] = camera;
    map['caption'] = caption;
    map['created_timestamp'] = createdTimestamp;
    map['copyright'] = copyright;
    map['focal_length'] = focalLength;
    map['iso'] = iso;
    map['shutter_speed'] = shutterSpeed;
    map['title'] = title;
    map['orientation'] = orientation;
    if (keywords != null) {
      map['keywords'] = keywords?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// thumbnail : {"file":"watchbanner-150x126.png","width":150,"height":126,"mime_type":"image/png","source_url":"https://moda.maantheme.com/fashion/wp-content/uploads/sites/2/2022/07/watchbanner-150x126.png"}
/// woocommerce_gallery_thumbnail : {"file":"watchbanner-100x100.png","width":100,"height":100,"mime_type":"image/png","source_url":"https://moda.maantheme.com/fashion/wp-content/uploads/sites/2/2022/07/watchbanner-100x100.png"}
/// shop_thumbnail : {"file":"watchbanner-100x100.png","width":100,"height":100,"mime_type":"image/png","source_url":"https://moda.maantheme.com/fashion/wp-content/uploads/sites/2/2022/07/watchbanner-100x100.png"}
/// woosc-small : {"file":"watchbanner-96x96.png","width":96,"height":96,"mime_type":"image/png","source_url":"https://moda.maantheme.com/fashion/wp-content/uploads/sites/2/2022/07/watchbanner-96x96.png"}
/// full : {"file":"watchbanner.png","width":300,"height":126,"mime_type":"image/png","source_url":"https://moda.maantheme.com/fashion/wp-content/uploads/sites/2/2022/07/watchbanner.png"}

class Sizes {
  Sizes({
      this.thumbnail,
      this.woocommerceGalleryThumbnail,
      this.shopThumbnail,
      this.wooscsmall,
      this.full,});

  Sizes.fromJson(dynamic json) {
    thumbnail = json['thumbnail'] != null ? Thumbnail.fromJson(json['thumbnail']) : null;
    woocommerceGalleryThumbnail = json['woocommerce_gallery_thumbnail'] != null ? WoocommerceGalleryThumbnail.fromJson(json['woocommerce_gallery_thumbnail']) : null;
    shopThumbnail = json['shop_thumbnail'] != null ? ShopThumbnail.fromJson(json['shop_thumbnail']) : null;
    wooscsmall = json['woosc-small'] != null ? WooscSmall.fromJson(json['woosc-small']) : null;
    full = json['full'] != null ? Full.fromJson(json['full']) : null;
  }
  Thumbnail? thumbnail;
  WoocommerceGalleryThumbnail? woocommerceGalleryThumbnail;
  ShopThumbnail? shopThumbnail;
  WooscSmall? wooscsmall;
  Full? full;
Sizes copyWith({  Thumbnail? thumbnail,
  WoocommerceGalleryThumbnail? woocommerceGalleryThumbnail,
  ShopThumbnail? shopThumbnail,
  WooscSmall? wooscsmall,
  Full? full,
}) => Sizes(  thumbnail: thumbnail ?? this.thumbnail,
  woocommerceGalleryThumbnail: woocommerceGalleryThumbnail ?? this.woocommerceGalleryThumbnail,
  shopThumbnail: shopThumbnail ?? this.shopThumbnail,
  wooscsmall: wooscsmall ?? this.wooscsmall,
  full: full ?? this.full,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (thumbnail != null) {
      map['thumbnail'] = thumbnail?.toJson();
    }
    if (woocommerceGalleryThumbnail != null) {
      map['woocommerce_gallery_thumbnail'] = woocommerceGalleryThumbnail?.toJson();
    }
    if (shopThumbnail != null) {
      map['shop_thumbnail'] = shopThumbnail?.toJson();
    }
    if (wooscsmall != null) {
      map['woosc-small'] = wooscsmall?.toJson();
    }
    if (full != null) {
      map['full'] = full?.toJson();
    }
    return map;
  }

}

/// file : "watchbanner.png"
/// width : 300
/// height : 126
/// mime_type : "image/png"
/// source_url : "https://moda.maantheme.com/fashion/wp-content/uploads/sites/2/2022/07/watchbanner.png"

class Full {
  Full({
      this.file,
      this.width,
      this.height,
      this.mimeType,
      this.sourceUrl,});

  Full.fromJson(dynamic json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }
  String? file;
  int? width;
  int? height;
  String? mimeType;
  String? sourceUrl;
Full copyWith({  String? file,
  int? width,
  int? height,
  String? mimeType,
  String? sourceUrl,
}) => Full(  file: file ?? this.file,
  width: width ?? this.width,
  height: height ?? this.height,
  mimeType: mimeType ?? this.mimeType,
  sourceUrl: sourceUrl ?? this.sourceUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file'] = file;
    map['width'] = width;
    map['height'] = height;
    map['mime_type'] = mimeType;
    map['source_url'] = sourceUrl;
    return map;
  }

}

/// file : "watchbanner-96x96.png"
/// width : 96
/// height : 96
/// mime_type : "image/png"
/// source_url : "https://moda.maantheme.com/fashion/wp-content/uploads/sites/2/2022/07/watchbanner-96x96.png"

class WooscSmall {
  WooscSmall({
      this.file,
      this.width,
      this.height,
      this.mimeType,
      this.sourceUrl,});

  WooscSmall.fromJson(dynamic json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }
  String? file;
  int? width;
  int? height;
  String? mimeType;
  String? sourceUrl;
WooscSmall copyWith({  String? file,
  int? width,
  int? height,
  String? mimeType,
  String? sourceUrl,
}) => WooscSmall(  file: file ?? this.file,
  width: width ?? this.width,
  height: height ?? this.height,
  mimeType: mimeType ?? this.mimeType,
  sourceUrl: sourceUrl ?? this.sourceUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file'] = file;
    map['width'] = width;
    map['height'] = height;
    map['mime_type'] = mimeType;
    map['source_url'] = sourceUrl;
    return map;
  }

}

/// file : "watchbanner-100x100.png"
/// width : 100
/// height : 100
/// mime_type : "image/png"
/// source_url : "https://moda.maantheme.com/fashion/wp-content/uploads/sites/2/2022/07/watchbanner-100x100.png"

class ShopThumbnail {
  ShopThumbnail({
      this.file,
      this.width,
      this.height,
      this.mimeType,
      this.sourceUrl,});

  ShopThumbnail.fromJson(dynamic json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }
  String? file;
  int? width;
  int? height;
  String? mimeType;
  String? sourceUrl;
ShopThumbnail copyWith({  String? file,
  int? width,
  int? height,
  String? mimeType,
  String? sourceUrl,
}) => ShopThumbnail(  file: file ?? this.file,
  width: width ?? this.width,
  height: height ?? this.height,
  mimeType: mimeType ?? this.mimeType,
  sourceUrl: sourceUrl ?? this.sourceUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file'] = file;
    map['width'] = width;
    map['height'] = height;
    map['mime_type'] = mimeType;
    map['source_url'] = sourceUrl;
    return map;
  }

}

/// file : "watchbanner-100x100.png"
/// width : 100
/// height : 100
/// mime_type : "image/png"
/// source_url : "https://moda.maantheme.com/fashion/wp-content/uploads/sites/2/2022/07/watchbanner-100x100.png"

class WoocommerceGalleryThumbnail {
  WoocommerceGalleryThumbnail({
      this.file,
      this.width,
      this.height,
      this.mimeType,
      this.sourceUrl,});

  WoocommerceGalleryThumbnail.fromJson(dynamic json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }
  String? file;
  int? width;
  int? height;
  String? mimeType;
  String? sourceUrl;
WoocommerceGalleryThumbnail copyWith({  String? file,
  int? width,
  int? height,
  String? mimeType,
  String? sourceUrl,
}) => WoocommerceGalleryThumbnail(  file: file ?? this.file,
  width: width ?? this.width,
  height: height ?? this.height,
  mimeType: mimeType ?? this.mimeType,
  sourceUrl: sourceUrl ?? this.sourceUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file'] = file;
    map['width'] = width;
    map['height'] = height;
    map['mime_type'] = mimeType;
    map['source_url'] = sourceUrl;
    return map;
  }

}

/// file : "watchbanner-150x126.png"
/// width : 150
/// height : 126
/// mime_type : "image/png"
/// source_url : "https://moda.maantheme.com/fashion/wp-content/uploads/sites/2/2022/07/watchbanner-150x126.png"

class Thumbnail {
  Thumbnail({
      this.file,
      this.width,
      this.height,
      this.mimeType,
      this.sourceUrl,});

  Thumbnail.fromJson(dynamic json) {
    file = json['file'];
    width = json['width'];
    height = json['height'];
    mimeType = json['mime_type'];
    sourceUrl = json['source_url'];
  }
  String? file;
  int? width;
  int? height;
  String? mimeType;
  String? sourceUrl;
Thumbnail copyWith({  String? file,
  int? width,
  int? height,
  String? mimeType,
  String? sourceUrl,
}) => Thumbnail(  file: file ?? this.file,
  width: width ?? this.width,
  height: height ?? this.height,
  mimeType: mimeType ?? this.mimeType,
  sourceUrl: sourceUrl ?? this.sourceUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['file'] = file;
    map['width'] = width;
    map['height'] = height;
    map['mime_type'] = mimeType;
    map['source_url'] = sourceUrl;
    return map;
  }

}

/// rendered : ""

class Caption {
  Caption({
      this.rendered,});

  Caption.fromJson(dynamic json) {
    rendered = json['rendered'];
  }
  String? rendered;
Caption copyWith({  String? rendered,
}) => Caption(  rendered: rendered ?? this.rendered,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rendered'] = rendered;
    return map;
  }

}

/// rendered : "<p class=\"attachment\"><a href='https://moda.maantheme.com/fashion/wp-content/uploads/sites/2/2022/07/watchbanner.png'><img width=\"300\" height=\"126\" src=\"https://moda.maantheme.com/fashion/wp-content/uploads/sites/2/2022/07/watchbanner.png\" class=\"attachment-medium size-medium\" alt=\"banner\" loading=\"lazy\" /></a></p>\n"

class Description {
  Description({
      this.rendered,});

  Description.fromJson(dynamic json) {
    rendered = json['rendered'];
  }
  String? rendered;
Description copyWith({  String? rendered,
}) => Description(  rendered: rendered ?? this.rendered,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rendered'] = rendered;
    return map;
  }

}

/// rendered : "watchbanner"

class Title {
  Title({
      this.rendered,});

  Title.fromJson(dynamic json) {
    rendered = json['rendered'];
  }
  String? rendered;
Title copyWith({  String? rendered,
}) => Title(  rendered: rendered ?? this.rendered,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rendered'] = rendered;
    return map;
  }

}

/// rendered : "https://moda.maantheme.com/fashion/wp-content/uploads/sites/2/2022/07/watchbanner.png"

class Guid {
  Guid({
      this.rendered,});

  Guid.fromJson(dynamic json) {
    rendered = json['rendered'];
  }
  String? rendered;
Guid copyWith({  String? rendered,
}) => Guid(  rendered: rendered ?? this.rendered,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rendered'] = rendered;
    return map;
  }

}