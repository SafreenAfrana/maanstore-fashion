import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'order_create_model.dart';

final cartNotifier = ChangeNotifierProvider((ref) => CartNotifier());

class CartNotifier extends ChangeNotifier {
  final cartItems = <LineItems>[];
  final coupon = <CouponLines>[];
  double promoPrice = 0;
  final cartOtherInfoList = <CartOtherInfo>[];

  void increaseQuantity(int index) {
    cartOtherInfoList[index].quantity = cartOtherInfoList[index].quantity!.toInt() + 1;
    createLineItems();
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    cartOtherInfoList[index].quantity = cartOtherInfoList[index].quantity!.toInt() - 1;
    createLineItems();
    notifyListeners();
  }

  void createLineItems() {
    cartItems.clear();
    for (var element in cartOtherInfoList) {
      cartItems.add(LineItems(
        productId: element.productId,
        quantity: element.quantity,
        variationId: element.variationId,
      ));
    }
  }

  double updatePrice(double value) {
    promoPrice = value;
    notifyListeners();
    return promoPrice;
  }

  void addCoupon(CouponLines couponLines) {
    coupon.add(couponLines);
    notifyListeners();
  }

  void addItemInfo(CartOtherInfo cart) {
    cartOtherInfoList.add(cart);
    createLineItems();
    notifyListeners();
  }

  void removeItemInfo(String name) {
    int? id;

    for (var element in cartOtherInfoList) {
      if (element.productName!.contains(name)) {
        id = element.productId;
      }
    }

    cartOtherInfoList.remove(cartOtherInfoList.firstWhere((element) => element.productName == name));
    cartItems.remove(cartItems.firstWhere((element) => element.productId == id));
    notifyListeners();
  }

  double cartTotalPriceF(quantity) {
    double cartTotalPrice = 0;
    for (var element in cartOtherInfoList) {
      cartTotalPrice = cartTotalPrice + (element.productPrice!.toDouble() * element.quantity!.toDouble());
    }
    return cartTotalPrice;
  }
}

class CartOtherInfo {
  int? variationId;
  int? productId;
  String? type;
  String? productName;
  String? productImage;
  double? productPrice;
  Color? productColor;
  String? productSize;
  int? quantity;

  List<dynamic>? attributesName;
  List<dynamic>? selectedAttributes;

  CartOtherInfo({
    this.variationId,
    this.productId,
    this.type,
    this.productName,
    this.productImage,
    this.productPrice,
    this.productColor,
    this.productSize,
    this.quantity,
    this.attributesName,
    this.selectedAttributes,
  });
}
