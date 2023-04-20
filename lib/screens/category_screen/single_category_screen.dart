import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:maanstore/models/product_model.dart';
import 'package:maanstore/screens/search_product_screen.dart';
import 'package:maanstore/widgets/product_greed_view_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../const/constants.dart';
import '../../Providers/all_repo_providers.dart';
import '../../api_service/api_service.dart';
import '../../models/category_model.dart';
import '../../widgets/filter_widget.dart';
import '../../widgets/product_shimmer_widget.dart';

class SingleCategoryScreen extends StatefulWidget {
  const SingleCategoryScreen({Key? key, required this.categoryId, required this.categoryName, required this.categoryList, required this.categoryModel})
      : super(key: key);

  final int categoryId;
  final CategoryModel categoryModel;
  final String categoryName;
  final List<CategoryModel> categoryList;

  @override
  State<SingleCategoryScreen> createState() => _SingleCategoryScreenState();
}

class _SingleCategoryScreenState extends State<SingleCategoryScreen> {
  APIService apiService = APIService();
  bool isSingleView = false;

  int subCategoryId = 0;

  FilterDataModel filterDataModel =
      FilterDataModel(selectedPrice: const SfRangeValues(0, 1000000), selectedSize: 'no data', selectedColor: 'no data', isFiltered: false);

  List<int> priceList = [];
  List<ProductModel> filteredProduct = [];
  List<CategoryModel> categoryList = [];
  List<ProductModel> sortedProduct = [];
  List<String> variationsColor = [];
  List<String> variationsSize = [];
  String? sortValue;

  @override
  void initState() {
    categoryList.add(widget.categoryModel);
    for (var element in widget.categoryList) {
      if (element.parent == widget.categoryId) {
        categoryList.add(element);
      }
    }
    super.initState();
    subCategoryId = widget.categoryId;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final allProducts = ref.watch(getProductOfSingleCategory(subCategoryId));
      return Scaffold(
        //backgroundColor: primaryColor.withOpacity(0.05),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
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
          ],
          leading: GestureDetector(
            onTap: () {
              finish(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: MyGoogleText(
            text: widget.categoryName,
            fontColor: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  ///____________Sort Section________________________________________________
                  // TextButton(
                  //   onPressed: () {
                  //     showMaterialModalBottomSheet(
                  //         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                  //         context: context,
                  //         builder: (context) => const Sort()).then((value) async{
                  //          setState(() {
                  //            sortValue = value;
                  //          });
                  //     });
                  //   },
                  //   child: Row(
                  //     children: const [
                  //       Icon(
                  //         FeatherIcons.sliders,
                  //         color: Colors.black,
                  //       ),
                  //       SizedBox(width: 5),
                  //       MyGoogleText(
                  //         text: 'Sort',
                  //         fontSize: 16,
                  //         fontColor: Colors.black,
                  //         fontWeight: FontWeight.normal,
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  ///____________Filter Section____________________________________________
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                        context: context,
                        builder: (context) => Filter(colors: variationsColor, size: variationsSize, categoryList: categoryList),
                      ).then((value) {
                        setState(() {
                          filterDataModel = value;
                        });
                      });
                    },
                    child: Row(
                      children: const [
                        Icon(
                          IconlyLight.filter,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5),
                        MyGoogleText(
                          text: 'Filter',
                          fontSize: 16,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ],
                    ),
                  ).visible(false),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isSingleView = false;
                          });
                        },
                        icon: isSingleView
                            ? const Icon(
                                IconlyLight.category,
                                color: textColors,
                              )
                            : const Icon(
                                IconlyLight.category,
                                color: Colors.black,
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isSingleView = true;
                          });
                        },
                        icon: isSingleView
                            ? const Icon(
                                Icons.rectangle_outlined,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.rectangle_outlined,
                                color: textColors,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
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
                      HorizontalList(
                          itemCount: categoryList.length,
                          itemBuilder: (_, i) {
                            return categoryList[i].parent == widget.categoryId
                                ? GestureDetector(
                                    onTap: () {
                                      EasyLoading.show(status: 'Loading');
                                      setState(() {
                                        subCategoryId = categoryList[i].id!.toInt();
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                          border: Border.all(color: titleColors),
                                          color: subCategoryId == categoryList[i].id!.toInt() ? secondaryColor1 : white),
                                      child: Text(
                                        categoryList[i].name ?? '',
                                        style: kTextStyle.copyWith(color: subCategoryId == categoryList[i].id!.toInt() ? white : titleColors),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      EasyLoading.show(status: 'Loading');
                                      setState(() {
                                        subCategoryId = widget.categoryId.toInt();
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0, bottom: 8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                          border: Border.all(color: titleColors),
                                          color: subCategoryId == categoryList[i].id!.toInt() ? secondaryColor1 : white),
                                      child: Text(
                                        'All',
                                        style: kTextStyle.copyWith(color: subCategoryId == categoryList[i].id!.toInt() ? white : titleColors),
                                      ),
                                    ),
                                  );
                          }).visible(categoryList.length > 1),
                      Container(
                        padding: isSingleView ? const EdgeInsets.all(40) : const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                        child: allProducts.when(data: (snapshot) {
                          if (snapshot.isNotEmpty) {
                            EasyLoading.dismiss();

                            if (filterDataModel.isFiltered) {
                              final List<ProductModel> filteredProducts = [];

                              for (var elementSnapShot in snapshot) {
                                final allVariationProducts = ref.watch(getSingleProductVariation(elementSnapShot.id!.toInt()));
                                allVariationProducts.when(data: (snapData) {
                                  for (var element in snapData) {
                                    for (var elementAtt in element.attributes!) {
                                      if (elementAtt.name?.toUpperCase() == 'COLOR') {
                                        if (!variationsColor.contains(elementAtt.option)) {
                                          variationsColor.add(elementAtt.option.toString());
                                        }
                                      }
                                      if (elementAtt.name?.toUpperCase() == 'SIZE') {
                                        if (!variationsSize.contains(elementAtt.option)) {
                                          variationsSize.add(elementAtt.option.toString());
                                        }
                                      }
                                    }
                                  }
                                  if (elementSnapShot.type != 'simple') {
                                    bool showVariationProduct = false;
                                    for (var element in snapData) {
                                      int numberOfTrue = 0;
                                      for (var elementAtt in element.attributes!) {
                                        if (elementAtt.option == filterDataModel.selectedColor) numberOfTrue++;
                                        if (elementAtt.option == filterDataModel.selectedSize) numberOfTrue++;
                                      }
                                      if (filterDataModel.selectedColor != 'no data' && filterDataModel.selectedSize != 'no data' && numberOfTrue == 2) {
                                        showVariationProduct = true;
                                      } else if (filterDataModel.selectedColor == 'no data' && filterDataModel.selectedSize == 'no data') {
                                        showVariationProduct = true;
                                      }
                                    }
                                    if (snapData[0].salePrice.toInt().isBetween(filterDataModel.selectedPrice.start, filterDataModel.selectedPrice.end) &&
                                        (filterDataModel.isFiltered ? showVariationProduct : true)) {
                                      filteredProducts.add(elementSnapShot);
                                    }
                                  } else {
                                    if (elementSnapShot.salePrice.toInt().isBetween(filterDataModel.selectedPrice.start, filterDataModel.selectedPrice.end) &&
                                        filterDataModel.selectedColor == 'no data' &&
                                        filterDataModel.selectedSize == 'no data') {
                                      filteredProducts.add(elementSnapShot);
                                    }
                                  }
                                }, error: (e, stack) {
                                  return Text(e.toString());
                                }, loading: () {
                                  return Shimmer.fromColors(
                                      baseColor: Colors.grey.shade300,
                                      highlightColor: Colors.grey.shade100,
                                      child: Container(
                                        height: context.width() / 2,
                                        width: context.width() / 2.2,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), border: Border.all(color: white)),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 150.0,
                                              width: context.width() / 2,
                                              decoration: const BoxDecoration(
                                                color: white,
                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Container(
                                              height: 18,
                                              width: 150,
                                              decoration: const BoxDecoration(
                                                color: white,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4.0,
                                            ),
                                            Container(
                                              height: 14,
                                              width: 130,
                                              decoration: const BoxDecoration(
                                                color: white,
                                              ),
                                            ),
                                            const SizedBox(height: 4.0),
                                            Container(
                                              height: 14,
                                              width: 100,
                                              decoration: const BoxDecoration(
                                                color: white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ));
                                });
                              }
                              if (filteredProducts.isNotEmpty) {
                                return GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: isSingleView ? 1 : 2,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio: isSingleView ? 0.87 : 0.52,
                                  ),
                                  itemCount: filteredProducts.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return ProductGreedShow(
                                      productModel: filteredProducts[index],
                                      discountPercentage: 0.toString(),
                                      isSingleView: isSingleView,
                                      categoryId: widget.categoryId,
                                    );
                                  },
                                );
                              } else {
                                return const Center(child: Text('No Product Found'));
                              }
                            } else {
                              return GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isSingleView ? 1 : 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: isSingleView ? 0.87 : 0.52,
                                ),
                                itemCount: snapshot.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  final allVariationProducts = ref.watch(getSingleProductVariation(snapshot[index].id!.toInt()));
                                  return allVariationProducts.when(data: (snapData) {
                                    for (var element in snapData) {
                                      for (var elementAtt in element.attributes!) {
                                        if (elementAtt.name?.toUpperCase() == 'COLOR') {
                                          if (!variationsColor.contains(elementAtt.option)) {
                                            variationsColor.add(elementAtt.option.toString());
                                          }
                                        }
                                        if (elementAtt.name?.toUpperCase() == 'SIZE') {
                                          if (!variationsSize.contains(elementAtt.option)) {
                                            variationsSize.add(elementAtt.option.toString());
                                          }
                                        }
                                      }
                                    }
                                    if (snapshot[index].type != 'simple' && snapData.isNotEmpty) {
                                      for (var element in snapData) {
                                        int numberOfTrue = 0;
                                        for (var elementAtt in element.attributes!) {
                                          if (elementAtt.option == filterDataModel.selectedColor) numberOfTrue++;
                                          if (elementAtt.option == filterDataModel.selectedSize) numberOfTrue++;
                                        }
                                        if (filterDataModel.selectedColor != 'no data' && filterDataModel.selectedSize != 'no data' && numberOfTrue == 2) {
                                        } else if (filterDataModel.selectedColor == 'no data' && filterDataModel.selectedSize == 'no data') {
                                        }
                                      }
                                      int discount = discountGenerator(snapData[0].regularPrice.toString(), snapData[0].salePrice.toString());
                                      return ProductGreedShow(
                                        singleProductVariations: snapData[0],
                                        productModel: snapshot[index],
                                        discountPercentage: discount.toString(),
                                        isSingleView: isSingleView,
                                        categoryId: widget.categoryId,
                                      );
                                    } else {
                                      int discount = discountGenerator(snapshot[index].regularPrice.toString(), snapshot[index].salePrice.toString());
                                      return ProductGreedShow(
                                        productModel: snapshot[index],
                                        discountPercentage: discount.toString(),
                                        isSingleView: isSingleView,
                                        categoryId: widget.categoryId,
                                      );
                                    }
                                  }, error: (e, stack) {
                                    return Text(e.toString());
                                  }, loading: () {
                                    return Shimmer.fromColors(
                                        baseColor: Colors.grey.shade300,
                                        highlightColor: Colors.grey.shade100,
                                        child: Container(
                                          height: context.width() / 2,
                                          width: context.width() / 2.2,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), border: Border.all(color: white)),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 150.0,
                                                width: context.width() / 2,
                                                decoration: const BoxDecoration(
                                                  color: white,
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10.0,
                                              ),
                                              Container(
                                                height: 18,
                                                width: 150,
                                                decoration: const BoxDecoration(
                                                  color: white,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 4.0,
                                              ),
                                              Container(
                                                height: 14,
                                                width: 130,
                                                decoration: const BoxDecoration(
                                                  color: white,
                                                ),
                                              ),
                                              const SizedBox(height: 4.0),
                                              Container(
                                                height: 14,
                                                width: 100,
                                                decoration: const BoxDecoration(
                                                  color: white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ));
                                  });
                                },
                              );
                            }
                          } else {
                            EasyLoading.dismiss();
                            return const Center(child: Text('No Product Found'));
                          }
                        }, error: (e, stack) {
                          return Text(e.toString());
                        }, loading: () {
                          return const ProductGridShimmerWidget();
                        }),
                      ),
                    ],
                  )),
            ],
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
}
