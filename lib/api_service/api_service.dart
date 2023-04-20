import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:maanstore/models/category_model.dart';
import 'package:maanstore/models/customer.dart';
import 'package:maanstore/models/product_review_model.dart';
import 'package:maanstore/models/single_product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/config.dart';
import '../models/banner.dart';
import '../models/list_of_orders.dart';
import '../models/order_create_model.dart' as order_create;
import '../models/product_model.dart';
import '../models/retrieve_an_order.dart';
import '../models/retrieve_coupon.dart';
import '../models/retrieve_customer.dart';
import '../models/single_product_variations_model.dart';

class APIService {
  Future<bool> createCustomer(CustomerModel model) async {
    final prefs = await SharedPreferences.getInstance();

    var authToken = base64Encode(
      utf8.encode('${Config.key}:${Config.secret}'),
    );
    bool ret = false;
    try {
      var response = await Dio().post(
        Config.url + Config.customerURL,
        data: model.toJson(),
        options: Options(headers: {HttpHeaders.authorizationHeader: 'Basic $authToken', HttpHeaders.contentTypeHeader: 'application/json'}),
      );
      if (response.statusCode == 201) {
        ret = true;
        await prefs.setInt('customerId', response.data['id']);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  Future<bool> loginCustomer(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    bool ret = false;

    try {
      var response = await Dio().post(Config.tokenURL,
          data: {
            'username': email,
            'password': password,
          },
          options: Options(headers: {HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'}));

      if (response.statusCode == 200) {
        await prefs.setInt('customerId', response.data['data']['id']);
        await prefs.setString('token', response.data['data']['token'].toString());

        ret = true;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  Future<List<CategoryModel>> getCategory() async {
    List<CategoryModel> category = [];
    String url = '${Config.url}${Config.categoryURL}?consumer_key=${Config.key}&consumer_secret=${Config.secret}&per_page=100';
    var response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        category.add(CategoryModel.fromJson(i));
      }
      return category;
    } else {
      return category;
    }
  }

  Future<List<ProductModel>> getProductOfCategory(int categoryId) async {
    List<ProductModel> productsOfCategory = [];
    String url = '${Config.url}${Config.productsURL}?category=$categoryId&consumer_key=${Config.key}&consumer_secret=${Config.secret}&per_page=100';
    var response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        productsOfCategory.add(ProductModel.fromJson(i));
      }
      return productsOfCategory;
    } else {
      return productsOfCategory;
    }
  }

  Future<SingleProductModel> getSingleProduct(int productId) async {
    String url = '${Config.url}${Config.singleProductsURL}$productId?consumer_key=${Config.key}&consumer_secret=${Config.secret}';
    var response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return SingleProductModel.fromJson(data);
    } else {
      return SingleProductModel.fromJson(data);
    }
  }

  Future<List<SingleProductVariations>> getSingleProductVariation(int productID) async {
    List<SingleProductVariations> productVariation = [];
    String url = '${Config.url}products/$productID/variations?consumer_key=${Config.key}&consumer_secret=${Config.secret}&per_page=50';
    var response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        productVariation.add(SingleProductVariations.fromJson(i));
      }
      return productVariation;
    }
    return productVariation;
  }

  Future<bool> createOrder(
    RetrieveCustomer retrieveCustomer,
    List<order_create.LineItems> lineItems,
    String paymentName,
    bool setPaid,
    List<order_create.CouponLines> coupons,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final int? customerId = prefs.getInt('customerId');
    var authToken = base64Encode(
      utf8.encode('${Config.key}:${Config.secret}'),
    );
    bool ret = false;
    try {
      var response = await Dio().post(
        Config.url + Config.createOrderUrl,
        data: {
          "payment_method": paymentName,
          "payment_method_title": paymentName,
          "customer_id": customerId,
          "set_paid": setPaid,
          "billing": {"phone": retrieveCustomer.billing!.phone},
          "shipping": retrieveCustomer.shipping,
          "line_items": lineItems,
          "coupon_lines": coupons
        },
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Basic $authToken',
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
      );
      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  Future<RetrieveCustomer> getCustomerDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final int? customerId = prefs.getInt('customerId');

    String url = '${Config.url}${Config.customerDetails}$customerId?consumer_key=${Config.key}&consumer_secret=${Config.secret}';
    var response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return RetrieveCustomer.fromJson(data);
    } else {
      return RetrieveCustomer.fromJson(data);
    }
  }

  Future<bool> updateShippingAddress(RetrieveCustomer retrieveCustomer) async {
    final prefs = await SharedPreferences.getInstance();
    final int? customerId = prefs.getInt('customerId');
    String url = '${Config.url}${Config.customerDetails}$customerId';
    var authToken = base64Encode(
      utf8.encode('${Config.key}:${Config.secret}'),
    );
    bool ret = false;
    try {
      var response = await Dio().put(
        url,
        data: {
          "first_name": retrieveCustomer.shipping!.firstName,
          "last_name": retrieveCustomer.shipping!.lastName,
          "billing": {
            "phone": retrieveCustomer.billing?.phone,
          },
          "shipping": {
            "first_name": retrieveCustomer.shipping!.firstName,
            "last_name": retrieveCustomer.shipping!.lastName,
            "address_1": retrieveCustomer.shipping!.address1,
            "address_2": retrieveCustomer.shipping!.address2,
            "city": retrieveCustomer.shipping!.city,
            "state": retrieveCustomer.shipping!.state,
            "postcode": retrieveCustomer.shipping!.postcode,
            "country": retrieveCustomer.shipping!.country
          }
        },
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Basic $authToken',
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
      );
      if (response.statusCode == 200) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  Future<bool> updateProfile(RetrieveCustomer retrieveCustomer, String phoneNumber) async {
    final prefs = await SharedPreferences.getInstance();
    final int? customerId = prefs.getInt('customerId');
    String url = '${Config.url}${Config.customerDetails}$customerId';
    var authToken = base64Encode(
      utf8.encode('${Config.key}:${Config.secret}'),
    );
    bool ret = false;
    try {
      var response = await Dio().put(
        url,
        data: {
          "first_name": retrieveCustomer.firstName,
          "last_name": retrieveCustomer.lastName,
          "email": retrieveCustomer.email,
          "billing": {
            "phone": phoneNumber,
          }
        },
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Basic $authToken',
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
      );
      if (response.statusCode == 200) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  Future<List<ListOfOrders>> getListOfOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final int? customerId = prefs.getInt('customerId');

    List<ListOfOrders>? listOfOrders = [];

    String url = '${Config.url}orders?consumer_key=${Config.key}&consumer_secret=${Config.secret}';
    var response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        if (i['customer_id'] == customerId) {
          listOfOrders.add(ListOfOrders.fromJson(i));
        }
      }

      return listOfOrders;
    }
    return listOfOrders;
  }

  Future<RetrieveAnOrder> getAnOrder(int id) async {
    String url = '${Config.url}${Config.anOrderUrl}$id?consumer_key=${Config.key}&consumer_secret=${Config.secret}';
    var response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return RetrieveAnOrder.fromJson(data);
    } else {
      return RetrieveAnOrder.fromJson(data);
    }
  }

  Future<bool> updateOrder(int orderId, String reason) async {
    String url = '${Config.url}${Config.anOrderUrl}$orderId';
    var authToken = base64Encode(
      utf8.encode('${Config.key}:${Config.secret}'),
    );
    bool ret = false;
    try {
      var response = await Dio().put(
        url,
        data: {
          "status": "cancelled",
          "customer_note": reason,
        },
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Basic $authToken',
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
      );
      if (response.statusCode == 200) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  Future<List<ProductModel>> getProductBySearch(String name) async {
    List<ProductModel> products = [];
    String url = '${Config.url}${Config.productsURL}?search=$name&consumer_key=${Config.key}&consumer_secret=${Config.secret}';
    var response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        products.add(ProductModel.fromJson(i));
      }
      return products;
    } else {
      return products;
    }
  }

  Future<double> retrieveCoupon(String couponCode, double totalAmount) async {
    RetrieveCoupon coupons = RetrieveCoupon();

    double amount = 0;
    String url = '${Config.url}${Config.coupons}?consumer_key=${Config.key}&consumer_secret=${Config.secret}&code=$couponCode';
    var response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (Map i in data) {
        coupons = RetrieveCoupon.fromJson(i);
      }
      if (coupons.discountType == 'percent') {
        amount = ((totalAmount * double.parse(coupons.amount.toString()) / 100));
      } else if (coupons.discountType == 'fixed_cart') {
        amount = double.parse(coupons.amount.toString());
      }
      return amount;
    } else {
      return amount;
    }
  }

  Future<List<Banner>> getBanner() async {
    List<Banner> banner = [];
    String url = Config.media;
    var response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        if (i["alt_text"] == "banner") {
          banner.add(Banner.fromJson(i));
        }
      }
      return banner;
    } else {
      return banner;
    }
  }

  Future<List<RetrieveCoupon>> retrieveAllCoupon() async {
    List<RetrieveCoupon> coupons = [];
    String url = '${Config.url}${Config.coupons}?consumer_key=${Config.key}&consumer_secret=${Config.secret}';
    var response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (Map i in data) {
        coupons.add(RetrieveCoupon.fromJson(i));
      }
      return coupons;
    } else {
      return coupons;
    }
  }

  Future<bool> createReview(String review, int rating, int productId, String reviewer, String reviewerEmail) async {
    var authToken = base64Encode(
      utf8.encode('${Config.key}:${Config.secret}'),
    );
    bool ret = false;
    try {
      var response = await Dio().post(
        Config.url + Config.createReviewUrl,
        data: {
          "product_id": productId,
          "review": review,
          "reviewer": reviewer,
          "reviewer_email": reviewerEmail,
          "rating": rating,
        },
        options: Options(headers: {
          HttpHeaders.authorizationHeader: 'Basic $authToken',
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
      );
      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  Future<List<ProductReviewModel>> getRetrieveAllReview(int productId) async {
    List<ProductReviewModel> review = [];
    String url = '${Config.url}${Config.createReviewUrl}?consumer_key=${Config.key}&consumer_secret=${Config.secret}&product=$productId';
    var response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        review.add(ProductReviewModel.fromJson(i));
      }
      return review;
    } else {
      return review;
    }
  }
}
