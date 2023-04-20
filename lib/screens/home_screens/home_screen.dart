import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maanstore/api_service/api_service.dart';

import 'package:maanstore/generated/l10n.dart' as lang;
import 'package:maanstore/screens/category_screen/category_screen.dart';
import 'package:maanstore/screens/category_screen/single_category_screen.dart';
import 'package:maanstore/screens/product_details_screen/product_detail_screen.dart';
import 'package:maanstore/screens/search_product_screen.dart';
import 'package:maanstore/widgets/banner_shimmer_widget.dart';
import 'package:maanstore/widgets/product_shimmer_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../Providers/all_repo_providers.dart';
import '../../const/constants.dart';
import '../../const/hardcoded_text.dart';
import '../../models/category_model.dart';
import '../../widgets/product_greed_view_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late APIService apiService;
  String? name;
  String? url;

  Future<void> initMessaging() async {
    await OneSignal.shared.setAppId(oneSignalAppId);
    OneSignal.shared.setInAppMessageClickedHandler((action) {
      if (action.clickName == 'successPage') {
        toast(lang.S.of(context).easyLoadingSuccess);
      }
    });
  }

  @override
  void initState() {
    apiService = APIService();
    initMessaging();
    super.initState();
  }

  int price = 0;

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 7200;
  DateTime time = DateTime.now();
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Consumer(builder: (_, ref, __) {
        final singleCategory = ref.watch(getProductOfSingleCategory(newArrive));
        final bestSellingProducts = ref.watch(getProductOfSingleCategory(bestSellingProduct));
        final specialOffers = ref.watch(getProductOfSingleCategory(flashSale));
        final allCategory = ref.watch(getAllCategories);
        final allBanner = ref.watch(getBanner);
        final allCoupons = ref.watch(getCoupon);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            titleSpacing: 0.0,
            title: MyGoogleText(
              text: lang.S.of(context).storeName,
              fontSize: 20,
              fontColor: Colors.black,
              fontWeight: FontWeight.w500,
            ),
            leading: Padding(
              padding: const EdgeInsets.all(4),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                      image: DecorationImage(image: AssetImage(HardcodedImages.appLogo))),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: secondaryColor3,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      const SearchProductScreen().launch(context);
                    },
                    icon: const Icon(
                      FeatherIcons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: secondaryColor3,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // const NotificationsScreen().launch(context);
                    },
                    icon: const Icon(
                      FeatherIcons.bell,
                      color: Colors.black,
                    ),
                  ),
                ),
              ).visible(false),
              const SizedBox(width: 8.0),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                /// Build Horizontal List widget without giving specific height to it.
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: allBanner.when(data: (snapShot) {
                    return HorizontalList(
                      padding: EdgeInsets.zero,
                      spacing: 10.0,
                      itemCount: snapShot.length,
                      itemBuilder: (_, i) {
                        return Container(
                          height: 120,
                          width: 320,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            image: DecorationImage(
                                image: NetworkImage(
                                  snapShot[i].guid!.rendered.toString(),
                                ),
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                    );
                  }, error: (e, stack) {
                    return Text(e.toString());
                  }, loading: () {
                    return const BannerShimmerWidget();
                  }),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          ///___________Category__________________________________________
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyGoogleText(
                                text: lang.S.of(context).categories,
                                fontSize: 16,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              TextButton(
                                onPressed: () {
                                  const CategoryScreen().launch(context);
                                },
                                child: MyGoogleText(
                                  text: lang.S.of(context).showAll,
                                  fontSize: 13,
                                  fontColor: textColors,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                          allCategory.when(data: (snapShot) {
                            return _buildCategoryList(snapShot);
                          }, error: (e, stack) {
                            return Text(e.toString());
                          }, loading: () {
                            return HorizontalList(
                                padding: EdgeInsets.zero,
                                spacing: 10.0,
                                itemCount: 5,
                                itemBuilder: (_, i) {
                                  return Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(left: 5.0, right: 10.0, top: 5.0, bottom: 5.0),
                                            height: 60.0,
                                            width: 60.0,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 8.0),
                                          Container(
                                            height: 12.0,
                                            width: 60.0,
                                            decoration: BoxDecoration(
                                                color: black,
                                                borderRadius: BorderRadius.circular(
                                                  30.0,
                                                )),
                                          ),
                                        ],
                                      ));
                                });
                          }),
                          const SizedBox(height: 10.0),

                          ///___________Flash_sale__________________________________________
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyGoogleText(
                                text: lang.S.of(context).specialOffer,
                                fontSize: 16,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),

                              ///____countDown_timer___________________________________
                              CountdownTimer(
                                endTime: endTime,
                                widgetBuilder: (_, time) {
                                  if (time == null) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                          lang.S.of(context).closingTime,
                                      ),
                                    );
                                  }
                                  return Row(
                                    children: [
                                      MyGoogleText(
                                        text: lang.S.of(context).closingTime,
                                        fontSize: 13,
                                        fontColor: textColors,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: const BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        child: Center(
                                          child: MyGoogleText(
                                            text: time.hours.toString(),
                                            fontSize: 14,
                                            fontColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: const BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        child: Center(
                                          child: MyGoogleText(
                                            text: time.min.toString(),
                                            fontSize: 14,
                                            fontColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Container(
                                        height: 25,
                                        width: 25,
                                        decoration: const BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        child: Center(
                                          child: MyGoogleText(
                                            text: time.sec.toString(),
                                            fontSize: 14,
                                            fontColor: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          specialOffers.when(data: (snapShot) {
                            return HorizontalList(
                              itemCount: snapShot.length,
                              spacing: 10,
                              itemBuilder: (BuildContext context, int index) {
                                final productVariation = ref.watch(getSingleProductVariation(snapShot[index].id!.toInt()));

                                return productVariation.when(data: (snapData) {
                                  if (snapShot[index].type != 'simple' && snapData.isNotEmpty) {
                                    return GestureDetector(
                                      onTap: () {
                                        ProductDetailScreen(
                                          singleProductsVariation: snapData[index],
                                          productModel: snapShot[index],
                                          categoryId: flashSale,
                                        ).launch(context);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                            width: 1,
                                            color: secondaryColor3,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 128,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    snapShot[index].images![0].src.toString(),
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: SizedBox(
                                                width: 120,
                                                child: Text(
                                                  snapShot[index].name.toString(),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.dmSans(),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 8),
                                              child: MyGoogleText(
                                                text: snapShot[index].type == 'simple' ? '\$ ${snapShot[index].salePrice}' : '\$ ${snapData[0].salePrice}',
                                                fontSize: 14,
                                                fontColor: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return GestureDetector(
                                      onTap: () {
                                        ProductDetailScreen(
                                          productModel: snapShot[index],
                                          categoryId: flashSale,
                                        ).launch(context);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                            width: 1,
                                            color: secondaryColor3,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 100,
                                              width: 128,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    snapShot[index].images![0].src.toString(),
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: SizedBox(
                                                width: 120,
                                                child: Text(
                                                  snapShot[index].name.toString(),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: GoogleFonts.dmSans(),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 8),
                                              child: MyGoogleText(
                                                text: snapShot[index].type == 'simple'
                                                    ? snapShot[index].salePrice.toInt() <= 0
                                                        ? '\$ ${snapShot[index].regularPrice}'
                                                        : '\$${snapShot[index].salePrice}'
                                                    : snapData[0].salePrice!.toInt() <= 0
                                                        ? '\$${snapData[0].regularPrice}'
                                                        : '\$${snapData[0].salePrice}',
                                                fontSize: 14,
                                                fontColor: Colors.black,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                }, error: (e, stack) {
                                  return Text(e.toString());
                                }, loading: () {
                                  return Container();
                                });
                              },
                            );
                          }, error: (e, stack) {
                            return Text(e.toString());
                          }, loading: () {
                            return const Center(child: ProductShimmerWidget());
                          }),
                          const SizedBox(height: 20),

                          ///___________Best_selling__________________________________________
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyGoogleText(
                                text:  lang.S.of(context).trendingFashion,
                                fontSize: 16,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              TextButton(
                                onPressed: () {
                                  SingleCategoryScreen(
                                    categoryId: bestSellingProduct,
                                    categoryName:  lang.S.of(context).trendingFashion,
                                    categoryList: const [],
                                    categoryModel: CategoryModel(),
                                  ).launch(context);
                                },
                                child: MyGoogleText(
                                  text: lang.S.of(context).showAll,
                                  fontSize: 13,
                                  fontColor: textColors,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                          bestSellingProducts.when(data: (snapShot) {
                            return HorizontalList(
                                spacing: 0,
                                itemCount: snapShot.length,
                                itemBuilder: (_, index) {
                                  final productVariation = ref.watch(getSingleProductVariation(snapShot[index].id!.toInt()));

                                  return productVariation.when(data: (dataSnap) {
                                    if (snapShot[index].type != 'simple' && dataSnap.isNotEmpty) {
                                      int discount = discountGenerator(dataSnap[0].regularPrice.toString(), dataSnap[0].salePrice.toString());
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 15),
                                        child: ProductGreedShow(
                                          singleProductVariations: dataSnap[0],
                                          productModel: snapShot[index],
                                          discountPercentage: discount.toString(),
                                          isSingleView: false,
                                          categoryId: newArrive,
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
                                          categoryId: newArrive,
                                        ),
                                      );
                                    }
                                  }, error: (e, stack) {
                                    return Text(e.toString());
                                  }, loading: () {
                                    return Container();
                                  });
                                });
                          }, error: (e, stack) {
                            return Text(e.toString());
                          }, loading: () {
                            return const Center(child: ProductShimmerWidget());
                          }),

                          ///___________Promo__________________________________________

                          const SizedBox(height: 10),
                          allCoupons.when(data: (snapShot) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HorizontalList(
                                padding: EdgeInsets.zero,
                                spacing: 10.0,
                                itemCount: snapShot.length,
                                itemBuilder: (_, i) {
                                  return Container(
                                    height: 130,
                                    width: context.width() / 1.2,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: AssetImage(HardcodedImages.couponBackgroundImage), fit: BoxFit.fill),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        MyGoogleText(
                                          text: '${snapShot[i].amount}% OFF',
                                          fontSize: 24,
                                          fontColor: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        const SizedBox(height: 10),
                                        MyGoogleText(
                                          text: 'USE CODE: ${snapShot[i].code.toString()}',
                                          fontSize: 16,
                                          fontColor: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          }, error: (e, stack) {
                            return Text(e.toString());
                          }, loading: () {
                            return const BannerShimmerWidget();
                          }),

                          ///___________New_Arrivals__________________________________________
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyGoogleText(
                                text: lang.S.of(context).newArrival,
                                fontSize: 16,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              TextButton(
                                onPressed: () {
                                  SingleCategoryScreen(
                                    categoryId: newArrive,
                                    categoryName: lang.S.of(context).newArrival,
                                    categoryList: const [],
                                    categoryModel: CategoryModel(),
                                  ).launch(context);
                                },
                                child: MyGoogleText(
                                  text: lang.S.of(context).showAll,
                                  fontSize: 13,
                                  fontColor: textColors,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),

                          singleCategory.when(data: (snapShot) {
                            return HorizontalList(
                                itemCount: snapShot.length,
                                spacing: 0,
                                itemBuilder: (_, index) {
                                  final productVariation = ref.watch(getSingleProductVariation(snapShot[index].id!.toInt()));

                                  return productVariation.when(data: (dataSnap) {
                                    if (snapShot[index].type != 'simple' && dataSnap.isNotEmpty) {
                                      int discount = discountGenerator(dataSnap[0].regularPrice.toString(), dataSnap[0].salePrice.toString());
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 15),
                                        child: ProductGreedShow(
                                          singleProductVariations: dataSnap[0],
                                          productModel: snapShot[index],
                                          discountPercentage: discount.toString(),
                                          isSingleView: false,
                                          categoryId: newArrive,
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
                                          categoryId: newArrive,
                                        ),
                                      );
                                    }
                                  }, error: (e, stack) {
                                    return Text(e.toString());
                                  }, loading: () {
                                    return Container();
                                  });
                                });
                          }, error: (e, stack) {
                            return Text(e.toString());
                          }, loading: () {
                            return const Center(child: ProductShimmerWidget());
                          }),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
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

  Widget _buildCategoryList(List<CategoryModel> categories) {
    final List<CategoryModel> finalList = [];
    for (var element in categories) {
      if (element.parent == 0) {
        finalList.add(element);
      }
    }
    return HorizontalList(
      itemCount: finalList.length,
      spacing: 20,
      itemBuilder: (BuildContext context, int index) {
        String? image = finalList[index].image?.src.toString();
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                SingleCategoryScreen(
                  categoryId: finalList[index].id!.toInt(),
                  categoryName: finalList[index].name.toString(),
                  categoryList: categories,
                  categoryModel: finalList[index],
                ).launch(context);
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image ?? ''),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                    width: 1,
                    color: secondaryColor3,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 80,
              child: Text(
                finalList[index].name.toString(),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.dmSans(),
              ),
            ),
          ],
        );
      },
    );
  }
}
