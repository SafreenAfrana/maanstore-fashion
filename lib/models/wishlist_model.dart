import 'dart:convert';

class Wishlist {
  final int? id, price, categoryId;
  final String? name, img;

  Wishlist({this.categoryId, this.id, this.name, this.img, this.price});

  factory Wishlist.fromJson(Map<String, dynamic> jsonData) {
    return Wishlist(
      id: jsonData['id'],
      name: jsonData['name'],
      img: jsonData['img'],
      price: jsonData['price'],
      categoryId: jsonData['categoryId'],

    );
  }

  static Map<String, dynamic> toMap(Wishlist wishlist) => {
        'id': wishlist.id,
        'name': wishlist.name,
        'img': wishlist.img,
        'price': wishlist.price,
        'categoryId': wishlist.categoryId,
      };

  static String encode(List<Wishlist> wishlist) => json.encode(
        wishlist
            .map<Map<String, dynamic>>((wishlist) => Wishlist.toMap(wishlist))
            .toList(),
      );

  static List<Wishlist> decode(String wishlist) =>
      (json.decode(wishlist) as List<dynamic>)
          .map<Wishlist>((item) => Wishlist.fromJson(item))
          .toList();
}
