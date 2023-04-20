import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maanstore/api_service/api_service.dart';
import '../../models/banner.dart' as banner;

import '../models/category_model.dart';
import '../models/list_of_orders.dart';
import '../models/product_model.dart';
import '../models/retrieve_coupon.dart';
import '../models/retrieve_customer.dart';
import '../models/single_product_variations_model.dart';

APIService apiService = APIService();

final getProductOfSingleCategory = FutureProvider.family<List<ProductModel>, int>((ref, id) {
  return apiService.getProductOfCategory(id);
});

///__________Single_Product_variation_________________________________________________________
final getSingleProductVariation = FutureProvider.family<List<SingleProductVariations>, int>((ref, id) {
  return apiService.getSingleProductVariation(id);
});

///___________All_Category_____________________________________________________
final getAllCategories = FutureProvider<List<CategoryModel>>((ref) {
  return apiService.getCategory();
});

///___________Banner________________________________________________________________
final getBanner = FutureProvider<List<banner.Banner>>((ref) {
  return apiService.getBanner();
});

///___________Coupon________________________________________________________________
final getCoupon = FutureProvider<List<RetrieveCoupon>>((ref) {
  return apiService.retrieveAllCoupon();
});

///___________Order_______________________________________________________________
final getOrders = FutureProvider<List<ListOfOrders>>((ref) {
  return apiService.getListOfOrder();
});

///___________CustomerDetails_______________________________________________________________
final getCustomerDetails = FutureProvider<RetrieveCustomer>((ref) {
  return apiService.getCustomerDetails();
});

///___________SearchProduct_______________________________________________________________
final getProductBySearch = FutureProvider.family<List<ProductModel>, String>((ref, name) {
  return apiService.getProductBySearch(name);
});
