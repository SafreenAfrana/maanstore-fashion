import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intl;
import 'package:maanstore/const/constants.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
import 'package:maanstore/models/product_model.dart';
import 'package:maanstore/models/single_product_variations_model.dart';
import 'package:maanstore/screens/cart_screen/cart_screen.dart';
import 'package:maanstore/widgets/buttons.dart';
import 'package:maanstore/widgets/castomar_review_commends.dart';
import 'package:maanstore/widgets/single_product_total_review.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share_plus/share_plus.dart';

import '../../Providers/all_repo_providers.dart';
import '../../api_service/api_service.dart';
import '../../config/config.dart';
import '../../models/add_to_cart_model.dart';
import '../../models/list_of_orders.dart';
import '../../models/product_review_model.dart';
import '../../widgets/order_page_shimmer.dart';
import '../../widgets/product_greed_view_widget.dart';
import '../../widgets/product_shimmer_widget.dart';
import '../../widgets/review_bottom_sheet_1.dart';
import '../../widgets/variation_product_details_shimar.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    Key? key,
    required this.productModel,
    required this.categoryId,
    this.singleProductsVariation,
  }) : super(key: key);

  final ProductModel productModel;
  final SingleProductVariations? singleProductsVariation;
  final int categoryId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late APIService apiService;
  int? simpleProductDiscount;
  int? customerId;

  Future<void> checkId() async {
    final prefs = await SharedPreferences.getInstance();
    customerId = prefs.getInt('customerId') ?? 0;
  }

  @override
  void initState() {
    checkId();
    apiService = APIService();
    simpleProductDiscount = discountGenerator(widget.productModel.regularPrice!, widget.productModel.salePrice!);
    super.initState();
  }

  PageController pageController = PageController(initialPage: 1);
  bool isItPurchased = false;
  bool isFavorite = false;
  double initialRating = 0;
  late double rating;
  bool alreadyInCart = false;

  String? selectedSize;
  Color? selectedColor;

  List<dynamic> sizeList = [];
  List<List<dynamic>> attributeList = [];
  List<dynamic> attributeNameList = [];
  List<dynamic> selectedAttributes = [];
  List<dynamic> list = [];
  List<dynamic> colorList = [];
  List<Color> finalColorList = [];
  int? finalProductVariationId;
  int simpleIntInput = 0;

  int attributesNumber = 0;
  String fistAttribute = '';

  int productQuantity = 1;
  int counter = 0;
  int counter2 = 0;

  double variationRegularPrice = 0;
  double variationSalePrice = 0;

  @override
  Widget build(BuildContext context) {
    counter++;
    counter2++;
    return Consumer(builder: (context, ref, __) {
      final singleCategory = ref.watch(getProductOfSingleCategory(widget.categoryId));
      final productVariation = ref.watch(getSingleProductVariation(widget.productModel.id!.toInt()));
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: secondaryColor3,
        body: SafeArea(
          child: SingleChildScrollView(
            child: widget.productModel.type == 'simple'
                ? Column(
                    children: [
                      ///_____________Photo & Buttons_________________________
                      Stack(
                        children: [
                          ///_______Photos____________
                          CarouselSlider.builder(
                            itemCount: widget.productModel.images!.length,
                            options: CarouselOptions(
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 5),
                              height: 300,
                              aspectRatio: 1,
                              viewportFraction: 1,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlayAnimationDuration: const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              onPageChanged: null,
                              scrollDirection: Axis.horizontal,
                            ),
                            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Container(
                              color: secondaryColor3,
                              width: double.infinity,
                              child: Image(
                                image: NetworkImage(widget.productModel.images![itemIndex].src!),
                              ),
                            ),
                          ),

                          ///_________Favorite & Share Button_________________________________________________________
                          Positioned(
                            right: 20,
                            top: 20,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1,
                                        color: primaryColor.withOpacity(0.05),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    child: isFavorite
                                        ? const Center(
                                            child: Icon(
                                              Icons.favorite,
                                              color: secondaryColor1,
                                            ),
                                          )
                                        : const Center(
                                            child: Icon(
                                            Icons.favorite_border,
                                            color: secondaryColor1,
                                          )),
                                  ).visible(false),
                                ),
                                const SizedBox(height: 15),
                                GestureDetector(
                                  onTap: () {
                                    Share.share('${widget.productModel.name}. Buy Now at: ${Config.websiteURL}?p=${widget.productModel.id}');
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1,
                                        color: primaryColor.withOpacity(0.05),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    child: const Center(
                                        child: Icon(
                                      FeatherIcons.share2,
                                      color: secondaryColor1,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          ///__________BackButton__________________________________________________
                          Positioned(
                            left: 10,
                            top: 20,
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Container(
                        padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyGoogleText(
                              text: widget.productModel.name.toString(),
                              fontSize: 20,
                              fontColor: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),

                            simpleProductDiscount != 202 || widget.productModel.salePrice!.isNotEmpty
                                ? Row(
                                    children: [
                                      MyGoogleText(
                                        text: widget.productModel.type != 'simple'
                                            ? '$currencySign${widget.productModel.salePrice}'
                                            : '$currencySign${widget.productModel.salePrice}',
                                        fontSize: 16,
                                        fontColor: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '$currencySign${widget.productModel.regularPrice}',
                                        style: GoogleFonts.dmSans(
                                          textStyle: const TextStyle(
                                            fontSize: 16,
                                            decoration: TextDecoration.lineThrough,
                                            color: textColors,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      Container(
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(width: 1, color: secondaryColor3),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                        ),
                                        child: Center(
                                          child: MyGoogleText(
                                            text: '$simpleProductDiscount %',
                                            fontSize: 14,
                                            fontColor: secondaryColor1,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      MyGoogleText(
                                        text: '$currencySign${widget.productModel.regularPrice} ',
                                        fontSize: 16,
                                        fontColor: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                RatingBarWidget(
                                  rating: initialRating,
                                  activeColor: ratingColor,
                                  inActiveColor: ratingColor,
                                  size: 22,
                                  onRatingChanged: (aRating) {
                                    setState(() {
                                      initialRating = aRating;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10),
                                MyGoogleText(
                                  text: lang.S.of(context).totalReview,
                                  fontSize: 16,
                                  fontColor: textColors,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ).visible(false),
                            const SizedBox(height: 10),

                            SizedBox(
                              width: 110,
                              child: Center(
                                child: MyGoogleText(
                                  text: lang.S.of(context).quantity,
                                  fontSize: 16,
                                  fontColor: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 110,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        productQuantity > 1 ? productQuantity-- : productQuantity = 1;
                                      });
                                    },
                                    child: Material(
                                      elevation: 4,
                                      color: secondaryColor3,
                                      borderRadius: BorderRadius.circular(30),
                                      child: const SizedBox(
                                        width: 33,
                                        height: 33,
                                        child: Center(
                                          child: Icon(FeatherIcons.minus, size: 25, color: textColors),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    productQuantity.toString(),
                                    style: GoogleFonts.dmSans(fontSize: 18),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        productQuantity++;
                                      });
                                    },
                                    child: Material(
                                      elevation: 4,
                                      color: secondaryColor3,
                                      borderRadius: BorderRadius.circular(30),
                                      child: const SizedBox(
                                        width: 33,
                                        height: 33,
                                        child: Center(
                                          child: Icon(Icons.add, size: 25, color: textColors),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ///_____________Description________________________________
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1, color: textColors),
                                ),
                              ),
                              child: ExpansionTile(
                                title: Text(
                                  lang.S.of(context).description,
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ReadMoreText(
                                      intl.Bidi.stripHtmlIfNeeded(widget.productModel.description.toString()),
                                      trimLines: 2,
                                      style: GoogleFonts.dmSans(
                                        textStyle: const TextStyle(
                                          color: textColors,
                                        ),
                                      ),
                                      colorClickableText: secondaryColor1,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: lang.S.of(context).showMore,
                                      trimExpandedText: lang.S.of(context).showLess,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ///____________Reviews_______________________________
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1, color: textColors),
                                ),
                              ),
                              child: ExpansionTile(
                                title: Text(
                                  lang.S.of(context).review,
                                ),
                                children: <Widget>[
                                  ///________TotalReview_________________________________

                                  Column(
                                    children: [
                                      FutureBuilder<List<ProductReviewModel>>(
                                          future: apiService.getRetrieveAllReview(widget.productModel.id!.toInt()),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              if (snapshot.data!.isNotEmpty) {
                                                return Column(
                                                  children: [
                                                    SingleProductTotalReview(productReviewModel: snapshot.data),
                                                    CustomerReviewCommends(productReviewModel: snapshot.data),
                                                    const SizedBox(height: 5),
                                                  ],
                                                );
                                              } else {
                                                return Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    lang.S.of(context).noReview,
                                                  ),
                                                );
                                              }
                                            } else {
                                              return const ReviewShimmer();
                                            }
                                          }),
                                      const SizedBox(height: 10),
                                      FutureBuilder<List<ListOfOrders>>(
                                          future: apiService.getListOfOrder(),
                                          builder: (context, snapShot) {
                                            if (snapShot.hasData) {
                                              for (var element in snapShot.data!) {
                                                for (var elementLine in element.lineItems!) {
                                                  if (elementLine.productId == widget.productModel.id) {
                                                    isItPurchased = true;
                                                  }
                                                }
                                              }
                                              if (isItPurchased) {
                                                return ButtonType2(
                                                  buttonText: lang.S.of(context).writeReview,
                                                  buttonColor: primaryColor,
                                                  onPressFunction: () {
                                                    showModalBottomSheet(
                                                      shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(30),
                                                          topRight: Radius.circular(30),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (context) => GivingRatingBottomSheet(
                                                        productId: widget.productModel.id!.toInt(),
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                return ButtonType2(
                                                  buttonText: lang.S.of(context).writeReview,
                                                  buttonColor: primaryColor,
                                                  onPressFunction: () {
                                                    showModalBottomSheet(
                                                      shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(30),
                                                          topRight: Radius.circular(30),
                                                        ),
                                                      ),
                                                      context: context,
                                                      builder: (context) => const ReviewBottomSheet(),
                                                    );
                                                  },
                                                );
                                              }
                                            } else {
                                              return Center(
                                                child: Container(),
                                              );
                                            }
                                          }).visible(customerId != 0),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),

                            ///_____________Delivery & Services__________________________
                            MyGoogleText(
                              text: lang.S.of(context).deliveryAndSer,
                              fontSize: 16,
                              fontColor: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                            const SizedBox(height: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: secondaryColor1.withOpacity(.20),
                                        ),
                                        child: const Center(
                                            child: Icon(
                                          FeatherIcons.truck,
                                          size: 18,
                                        )),
                                      ),
                                      const SizedBox(width: 8),
                                      MyGoogleText(
                                        text: lang.S.of(context).freeDelivery,
                                        fontSize: 16,
                                        fontColor: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: secondaryColor1.withOpacity(.20),
                                        ),
                                        child: const Center(
                                            child: Icon(
                                          FeatherIcons.creditCard,
                                          size: 18,
                                        )),
                                      ),
                                      const SizedBox(width: 8),
                                      MyGoogleText(
                                        text: lang.S.of(context).payOnDelivery,
                                        fontSize: 16,
                                        fontColor: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                                          color: secondaryColor1.withOpacity(.20),
                                        ),
                                        child: const Center(
                                            child: Icon(
                                          FeatherIcons.repeat,
                                          size: 18,
                                        )),
                                      ),
                                      const SizedBox(width: 8),
                                      SizedBox(
                                        width: context.width() / 1.4,
                                        child: Text(
                                          lang.S.of(context).returnDay,
                                          style: GoogleFonts.dmSans(
                                            textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            ///__________________Related Products____________________________
                            const SizedBox(height: 15),
                            singleCategory.when(data: (snapShot) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: MyGoogleText(
                                      text: lang.S.of(context).relatedProducts,
                                      fontSize: 16,
                                      fontColor: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  HorizontalList(
                                      itemCount: snapShot.length,
                                      itemBuilder: (_, index) {
                                        final productVariation = ref.watch(getSingleProductVariation(snapShot[index].id!.toInt()));
                                        return widget.productModel.id != snapShot[index].id
                                            ? productVariation.when(data: (dataSnap) {
                                                if (snapShot[index].type != 'simple') {
                                                  int discount = discountGenerator(dataSnap[0].regularPrice.toString(), dataSnap[0].salePrice.toString());
                                                  return Padding(
                                                    padding: const EdgeInsets.only(right: 15),
                                                    child: ProductGreedShow(
                                                      singleProductVariations: dataSnap[0],
                                                      productModel: snapShot[index],
                                                      discountPercentage: discount.toString(),
                                                      isSingleView: false,
                                                      categoryId: widget.categoryId,
                                                    ),
                                                  );
                                                } else {
                                                  int discount = discountGenerator(snapShot[index].regularPrice.toString(), snapShot[index].salePrice.toString());
                                                  return Padding(
                                                    padding: const EdgeInsets.only(right: 15),
                                                    child: ProductGreedShow(
                                                      productModel: snapShot[index],
                                                      discountPercentage: discount.toString(),
                                                      isSingleView: false,
                                                      categoryId: widget.categoryId,
                                                    ),
                                                  );
                                                }
                                              }, error: (e, stack) {
                                                return Text(e.toString());
                                              }, loading: () {
                                                return Container();
                                              })
                                            : Container();
                                      }),
                                ],
                              );
                            }, error: (e, stack) {
                              return Text(e.toString());
                            }, loading: () {
                              return const ProductShimmerWidget();
                            }),
                          ],
                        ),
                      ),
                    ],
                  )
                : productVariation.when(data: (snapShot) {
                    ///__________Select_Size & Color Logic________________________________________
                    if (counter <= 1) {
                      for (int i = 0; i < snapShot[0].attributes!.length; i++) {
                        List<String> demoList = [];
                        for (var element in snapShot) {
                          demoList.add(element.attributes![i].option.toString());
                        }
                        demoList = demoList.toSet().toList();
                        attributeList.add(demoList);
                      }

                      for (var element in snapShot[0].attributes!) {
                        attributeNameList.add(element.name);
                        selectedAttributes.add('null');
                      }

                      for (int i = 0; i < selectedAttributes.length; i++) {
                        selectedAttributes[i] = attributeList[i][0];
                      }
                      attributeList = attributeList.toSet().toList();
                    }
                    if (counter2 <= 1) {
                      getSingleProductVariations(
                        productID: widget.productModel.id!.toInt(),
                        selectedAttributes: selectedAttributes,
                      );
                    }

                    ///___________WishList Logic_____________________________________________
                    int discount = 0;
                    if (variationRegularPrice != 0 || variationSalePrice != 0) {
                      discount = discountGenerator(
                        variationRegularPrice.toString(),
                        variationSalePrice.toString(),
                      );
                    }

                    return Column(
                      children: [
                        ///_____________Photo & Buttons_________________________
                        Stack(
                          children: [
                            ///_______Photos____________
                            CarouselSlider.builder(
                              itemCount: widget.productModel.images!.length,
                              options: CarouselOptions(
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 5),
                                height: 300,
                                aspectRatio: 1,
                                viewportFraction: 1,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                onPageChanged: null,
                                scrollDirection: Axis.horizontal,
                              ),
                              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Container(
                                color: secondaryColor3,
                                width: double.infinity,
                                child: Image(
                                  image: NetworkImage(widget.productModel.images![itemIndex].src!),
                                ),
                              ),
                            ),

                            ///_________Favorite & Share Button_________________________________________________________
                            Positioned(
                              right: 20,
                              top: 20,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isFavorite = !isFavorite;
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 1,
                                          color: primaryColor.withOpacity(0.05),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                      ),
                                      child: isFavorite
                                          ? const Center(
                                              child: Icon(
                                                Icons.favorite,
                                                color: secondaryColor1,
                                              ),
                                            )
                                          : const Center(
                                              child: Icon(
                                              Icons.favorite_border,
                                              color: secondaryColor1,
                                            )),
                                    ).visible(false),
                                  ),
                                  const SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () {
                                      Share.share('${widget.productModel.name}. Buy Now at: https://www.indikeon.com/?p=${widget.productModel.id}');
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 1,
                                          color: primaryColor.withOpacity(0.05),
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(30),
                                        ),
                                      ),
                                      child: const Center(
                                          child: Icon(
                                        FeatherIcons.share2,
                                        color: secondaryColor1,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ///__________BackButton__________________________________________________
                            Positioned(
                              left: 10,
                              top: 20,
                              child: Center(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Container(
                          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyGoogleText(
                                text: widget.productModel.name.toString(),
                                fontSize: 20,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              variationSalePrice > 0
                                  ? Row(
                                      children: [
                                        MyGoogleText(
                                          text: widget.productModel.type != 'simple' ? '$currencySign$variationSalePrice ' : '$currencySign${widget.productModel.salePrice}',
                                          fontSize: 16,
                                          fontColor: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          '$currencySign$variationRegularPrice ',
                                          style: GoogleFonts.dmSans(
                                            textStyle: const TextStyle(
                                              fontSize: 16,
                                              decoration: TextDecoration.lineThrough,
                                              color: textColors,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 30,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(width: 1, color: secondaryColor3),
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          child: Center(
                                            child: MyGoogleText(
                                              text: '$discount %',
                                              fontSize: 14,
                                              fontColor: secondaryColor1,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        MyGoogleText(
                                          text: '$currencySign$variationRegularPrice ',
                                          fontSize: 16,
                                          fontColor: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ],
                                    ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  RatingBarWidget(
                                    rating: initialRating,
                                    activeColor: ratingColor,
                                    inActiveColor: ratingColor,
                                    size: 22,
                                    onRatingChanged: (aRating) {
                                      setState(() {
                                        initialRating = aRating;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  MyGoogleText(
                                    text: lang.S.of(context).totalReview,
                                    fontSize: 16,
                                    fontColor: textColors,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ],
                              ).visible(false),
                              const SizedBox(height: 30),

                              SizedBox(
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: attributeList.length,
                                  itemBuilder: (context, i) => Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MyGoogleText(
                                        text: 'Select ${attributeNameList[i]}',
                                        fontSize: 20,
                                        fontColor: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      SizedBox(
                                        height: 55,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: attributeList[i].length,
                                          itemBuilder: (context, index) => GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                counter2 = 0;
                                                selectedAttributes[i] = attributeList[i][index];
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                                                  color: selectedAttributes[i] == attributeList[i][index] ? secondaryColor1 : Colors.grey.shade300,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: MyGoogleText(
                                                      text: attributeList[i][index],
                                                      fontSize: 18,
                                                      fontColor: selectedAttributes[i] == attributeList[i][index] ? Colors.white : Colors.black,
                                                      fontWeight: FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              ///__________Select Color Buttons & Quantity button______________________________
                              const SizedBox(height: 8),

                              SizedBox(
                                width: 110,
                                child: Center(
                                  child: MyGoogleText(
                                    text: lang.S.of(context).quantity,
                                    fontSize: 16,
                                    fontColor: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: 110,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          productQuantity > 1 ? productQuantity-- : productQuantity = 1;
                                        });
                                      },
                                      child: Material(
                                        elevation: 4,
                                        color: secondaryColor3,
                                        borderRadius: BorderRadius.circular(30),
                                        child: const SizedBox(
                                          width: 33,
                                          height: 33,
                                          child: Center(
                                            child: Icon(FeatherIcons.minus, size: 25, color: textColors),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      productQuantity.toString(),
                                      style: GoogleFonts.dmSans(fontSize: 18),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          productQuantity++;
                                        });
                                      },
                                      child: Material(
                                        elevation: 4,
                                        color: secondaryColor3,
                                        borderRadius: BorderRadius.circular(30),
                                        child: const SizedBox(
                                          width: 33,
                                          height: 33,
                                          child: Center(
                                            child: Icon(Icons.add, size: 25, color: textColors),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              ///_____________Description________________________________
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 1, color: textColors),
                                  ),
                                ),
                                child: ExpansionTile(
                                  title: Text(
                                    lang.S.of(context).description,
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: ReadMoreText(
                                        intl.Bidi.stripHtmlIfNeeded(widget.productModel.description.toString()),
                                        trimLines: 2,
                                        style: GoogleFonts.dmSans(
                                          textStyle: const TextStyle(
                                            color: textColors,
                                          ),
                                        ),
                                        colorClickableText: secondaryColor1,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: lang.S.of(context).showMore,
                                        trimExpandedText: lang.S.of(context).showLess,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              ///____________Reviews_______________________________
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(width: 1, color: textColors),
                                  ),
                                ),
                                child: ExpansionTile(
                                  title: Text(
                                    lang.S.of(context).review,
                                  ),
                                  children: <Widget>[
                                    ///________TotalReview_________________________________

                                    Column(
                                      children: [
                                        FutureBuilder<List<ProductReviewModel>>(
                                            future: apiService.getRetrieveAllReview(widget.productModel.id!.toInt()),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                if (snapshot.data!.isNotEmpty) {
                                                  return Column(
                                                    children: [
                                                      SingleProductTotalReview(
                                                        productReviewModel: snapshot.data,
                                                      ),
                                                      CustomerReviewCommends(
                                                        productReviewModel: snapshot.data,
                                                      ),
                                                      const SizedBox(height: 5),
                                                    ],
                                                  );
                                                } else {
                                                  return Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      lang.S.of(context).noReview,
                                                    ),
                                                  );
                                                }
                                              } else {
                                                return const ReviewShimmer();
                                              }
                                            }),
                                        const SizedBox(height: 10),
                                        FutureBuilder<List<ListOfOrders>>(
                                            future: apiService.getListOfOrder(),
                                            builder: (context, snapShot) {
                                              if (snapShot.hasData) {
                                                for (var element in snapShot.data!) {
                                                  for (var elementLine in element.lineItems!) {
                                                    if (elementLine.productId == widget.productModel.id) {
                                                      isItPurchased = true;
                                                    }
                                                  }
                                                }
                                                if (isItPurchased) {
                                                  return ButtonType2(
                                                    buttonText: lang.S.of(context).writeReview,
                                                    buttonColor: primaryColor,
                                                    onPressFunction: () {
                                                      showModalBottomSheet(
                                                        shape: const RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(30),
                                                            topRight: Radius.circular(30),
                                                          ),
                                                        ),
                                                        context: context,
                                                        builder: (context) => GivingRatingBottomSheet(
                                                          productId: widget.productModel.id!.toInt(),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  return ButtonType2(
                                                    buttonText: lang.S.of(context).writeReview,
                                                    buttonColor: primaryColor,
                                                    onPressFunction: () {
                                                      showModalBottomSheet(
                                                        shape: const RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(30),
                                                            topRight: Radius.circular(30),
                                                          ),
                                                        ),
                                                        context: context,
                                                        builder: (context) => const ReviewBottomSheet(),
                                                      );
                                                    },
                                                  );
                                                }
                                              } else {
                                                return Center(
                                                  child: Container(),
                                                );
                                              }
                                            }),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),

                              ///_____________Delivery & Services__________________________
                              MyGoogleText(
                                text: lang.S.of(context).deliveryAndSer,
                                fontSize: 16,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(height: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                                            color: secondaryColor1.withOpacity(.20),
                                          ),
                                          child: const Center(
                                              child: Icon(
                                            FeatherIcons.truck,
                                            size: 18,
                                          )),
                                        ),
                                        const SizedBox(width: 8),
                                        MyGoogleText(
                                          text: lang.S.of(context).freeDelivery,
                                          fontSize: 16,
                                          fontColor: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                                            color: secondaryColor1.withOpacity(.20),
                                          ),
                                          child: const Center(
                                              child: Icon(
                                            FeatherIcons.creditCard,
                                            size: 18,
                                          )),
                                        ),
                                        const SizedBox(width: 8),
                                        MyGoogleText(
                                          text: lang.S.of(context).payOnDelivery,
                                          fontSize: 16,
                                          fontColor: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                                            color: secondaryColor1.withOpacity(.20),
                                          ),
                                          child: const Center(
                                              child: Icon(
                                            FeatherIcons.repeat,
                                            size: 18,
                                          )),
                                        ),
                                        const SizedBox(width: 8),
                                        SizedBox(
                                          width: context.width() / 1.4,
                                          child: Text(
                                            lang.S.of(context).returnDay,
                                            style: GoogleFonts.dmSans(
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.black,
                                              ),
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              ///__________________Related Products____________________________
                              const SizedBox(height: 15),
                              singleCategory.when(data: (snapShot) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: MyGoogleText(
                                        text: lang.S.of(context).relatedProducts,
                                        fontSize: 16,
                                        fontColor: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    HorizontalList(
                                        itemCount: snapShot.length,
                                        itemBuilder: (_, index) {
                                          final productVariation = ref.watch(getSingleProductVariation(snapShot[index].id!.toInt()));
                                          return widget.productModel.id != snapShot[index].id
                                              ? productVariation.when(data: (dataSnap) {
                                                  if (snapShot[index].type != 'simple') {
                                                    int discount = discountGenerator(dataSnap[0].regularPrice.toString(), dataSnap[0].salePrice.toString());
                                                    return Padding(
                                                      padding: const EdgeInsets.only(right: 15),
                                                      child: ProductGreedShow(
                                                        singleProductVariations: dataSnap[0],
                                                        productModel: snapShot[index],
                                                        discountPercentage: discount.toString(),
                                                        isSingleView: false,
                                                        categoryId: widget.categoryId,
                                                      ),
                                                    );
                                                  } else {
                                                    int discount = discountGenerator(snapShot[index].regularPrice.toString(), snapShot[index].salePrice.toString());
                                                    return Padding(
                                                      padding: const EdgeInsets.only(right: 15),
                                                      child: ProductGreedShow(
                                                        productModel: snapShot[index],
                                                        discountPercentage: discount.toString(),
                                                        isSingleView: false,
                                                        categoryId: widget.categoryId,
                                                      ),
                                                    );
                                                  }
                                                }, error: (e, stack) {
                                                  return Text(e.toString());
                                                }, loading: () {
                                                  return Container();
                                                })
                                              : Container();
                                        }),
                                  ],
                                );
                              }, error: (e, stack) {
                                return Text(e.toString());
                              }, loading: () {
                                return const ProductShimmerWidget();
                              }),
                            ],
                          ),
                        ),
                      ],
                    );
                  }, error: (e, stack) {
                    return Text(e.toString());
                  }, loading: () {
                    return const VariationProductDetailsShimmer();
                  }),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: secondaryColor3,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 30, left: 15, right: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Consumer(builder: (_, ref, child) {
                    final cart = ref.watch(cartNotifier);

                    if (widget.productModel.type == 'simple') {
                      for (var element in cart.cartItems) {
                        if (element.productId == widget.productModel.id) {
                          alreadyInCart = true;
                        }
                      }
                    } else {
                      for (var element in cart.cartItems) {
                        if (element.variationId == finalProductVariationId) {
                          alreadyInCart = true;
                          break;
                        } else {
                          alreadyInCart = false;
                        }
                      }
                    }

                    return Expanded(
                      child: Button1(
                          buttonText: lang.S.of(context).buyNowButton,
                          buttonColor: primaryColor,
                          onPressFunction: () {
                            if (alreadyInCart == false) {
                              cart.addItemInfo(CartOtherInfo(
                                variationId: finalProductVariationId ?? 0,
                                productId: widget.productModel.id,
                                quantity: productQuantity,
                                type: widget.productModel.type,
                                productName: widget.productModel.name,
                                productImage: widget.productModel.images![0].src,
                                productPrice: widget.productModel.type != 'simple'
                                    ? variationSalePrice.toDouble() <= 0
                                        ? variationRegularPrice.toDouble()
                                        : variationSalePrice.toDouble()
                                    : widget.productModel.salePrice.toDouble() <= 0
                                        ? widget.productModel.regularPrice.toDouble()
                                        : widget.productModel.salePrice.toDouble(),
                                attributesName: widget.productModel.type != 'simple' ? attributeNameList : [],
                                selectedAttributes: widget.productModel.type != 'simple' ? selectedAttributes : [],
                              ));
                              const CartScreen().launch(context);
                            } else {
                              const CartScreen().launch(context);
                            }
                            setState(() {
                              alreadyInCart = true;
                            });
                          }),
                    );
                  }),
                  const SizedBox(width: 10),
                  Consumer(builder: (_, ref, child) {
                    final cart = ref.watch(cartNotifier);

                    if (widget.productModel.type == 'simple') {
                      for (var element in cart.cartItems) {
                        if (element.productId == widget.productModel.id) {
                          alreadyInCart = true;
                        }
                      }
                    }

                    return Expanded(
                      child: ButtonType2(
                          buttonText: alreadyInCart ? lang.S.of(context).goToCartButton : lang.S.of(context).addToCartButton,
                          buttonColor: primaryColor,
                          onPressFunction: () {
                            if (!alreadyInCart) {
                              cart.addItemInfo(CartOtherInfo(
                                variationId: finalProductVariationId ?? 0,
                                productId: widget.productModel.id,
                                quantity: productQuantity,
                                type: widget.productModel.type,
                                productName: widget.productModel.name,
                                productImage: widget.productModel.images![0].src,
                                productPrice: widget.productModel.type != 'simple'
                                    ? variationSalePrice.toDouble() <= 0
                                        ? variationRegularPrice.toDouble()
                                        : variationSalePrice.toDouble()
                                    : widget.productModel.salePrice.toDouble() <= 0
                                        ? widget.productModel.regularPrice.toDouble()
                                        : widget.productModel.salePrice.toDouble(),
                                attributesName: widget.productModel.type != 'simple' ? attributeNameList : [],
                                selectedAttributes: widget.productModel.type != 'simple' ? selectedAttributes : [],
                              ));
                              setState(() {
                                alreadyInCart = true;
                              });
                            } else {
                              const CartScreen().launch(context);
                            }
                          }),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  int discountGenerator(String regularPrice, String sellingPrice) {
    double discount;

    if (regularPrice.isEmpty || sellingPrice.isEmpty) {
      return 202;
    } else {
      discount = ((double.parse(sellingPrice) * 100) / double.parse(regularPrice)) - 100;
    }

    return discount.toInt();
  }

  void getSingleProductVariations({required int productID, required List<dynamic> selectedAttributes}) async {
    EasyLoading.show(status: 'loading');
    List<SingleProductVariations> productVariation = [];

    String url = '${Config.url}products/$productID/variations?consumer_key=${Config.key}&consumer_secret=${Config.secret}&per_page=50';
    var response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        productVariation.add(SingleProductVariations.fromJson(i));
      }

      for (var element in productVariation) {
        int numberOfTrue = 0;

        for (int j = 0; j < element.attributes!.length; j++) {
          if (element.attributes![j].option == selectedAttributes[j]) {
            numberOfTrue++;
          }
        }
        if (numberOfTrue == selectedAttributes.length) {
          setState(() {
            variationSalePrice = element.salePrice.toDouble();
            variationRegularPrice = element.regularPrice.toDouble();
            finalProductVariationId = element.id!.toInt();
          });
        }
        EasyLoading.dismiss();
      }
    }
  }
}
