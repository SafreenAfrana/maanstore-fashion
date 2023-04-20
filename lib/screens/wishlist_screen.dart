import 'package:flutter/material.dart';
import 'package:maanstore/api_service/api_service.dart';
import 'package:maanstore/models/wishlist_model.dart';
import 'package:nb_utils/nb_utils.dart';

import '../const/constants.dart';
import 'home_screens/home.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  APIService? apiService;

  @override
  void initState() {
    apiService = APIService();
    super.initState();
  }

  double initialRating = 0;
  Future<List<Wishlist>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('wishListProducts');
    final decodedData = Wishlist.decode(data!);
    setState(() {});
    return decodedData;
  }

  void removeItem(var id) async {
    wishList.removeWhere((element) => element.id == id);
    final prefs = await SharedPreferences.getInstance();
    String encodedData = Wishlist.encode(wishList);
    prefs.setString('wishListProducts', encodedData);
    setState(() {});

    return null;
  }

  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            const Home().launch(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: MyGoogleText(
          text: 'Wishlist (${wishList.length})',
          fontColor: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {},
              child: const MyGoogleText(
                text: 'Delete',
                fontColor: secondaryColor1,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 20, bottom: 20),
              width: context.width(),
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
                  FutureBuilder(
                      future: getData(),
                      builder: (_, AsyncSnapshot<List<Wishlist>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: wishList.length,
                            itemBuilder: (context, index) {
                              return Container();
                              // return FutureBuilder<List<ProductModel>>(
                              //     future: apiService!.getProductOfCategory(
                              //         snapshot.data![index].categoryId!),
                              //     builder: (context, snapData) {
                              //       if (snapData.hasData) {
                              //         return GestureDetector(
                              //           onTap: () {
                              //             ProductDetailScreen(
                              //               productModel: snapData.data![index],
                              //               categoryId: snapshot
                              //                   .data![index].categoryId!
                              //                   .toInt(),
                              //             ).launch(context);
                              //           },
                              //           child: Padding(
                              //             padding: const EdgeInsets.only(
                              //               top: 8,
                              //               right: 8,
                              //               bottom: 8,
                              //             ),
                              //             child: Container(
                              //               decoration: BoxDecoration(
                              //                 borderRadius:
                              //                     const BorderRadius.all(
                              //                         Radius.circular(15)),
                              //                 border: Border.all(
                              //                   width: 1,
                              //                   color: secondaryColor3,
                              //                 ),
                              //               ),
                              //               child: Row(
                              //                 children: [
                              //                   Padding(
                              //                     padding:
                              //                         const EdgeInsets.all(4.0),
                              //                     child: Container(
                              //                       height: 110,
                              //                       width: 110,
                              //                       decoration: BoxDecoration(
                              //                         border: Border.all(
                              //                           width: 1,
                              //                           color: secondaryColor3,
                              //                         ),
                              //                         borderRadius:
                              //                             const BorderRadius
                              //                                     .all(
                              //                                 Radius.circular(
                              //                                     15)),
                              //                         color: secondaryColor3,
                              //                         image: DecorationImage(
                              //                             image: NetworkImage(
                              //                                 snapshot
                              //                                     .data![index]
                              //                                     .img
                              //                                     .toString())),
                              //                       ),
                              //                     ),
                              //                   ),
                              //                   Column(
                              //                       crossAxisAlignment:
                              //                           CrossAxisAlignment
                              //                               .start,
                              //                       children: [
                              //                         SizedBox(
                              //                           width: context.width() /
                              //                               1.8,
                              //                           child: Row(
                              //                             mainAxisAlignment:
                              //                                 MainAxisAlignment
                              //                                     .spaceBetween,
                              //                             children: [
                              //                               SizedBox(
                              //                                 width: context
                              //                                         .width() /
                              //                                     2.2,
                              //                                 child: Padding(
                              //                                   padding:
                              //                                       const EdgeInsets
                              //                                               .all(
                              //                                           5.0),
                              //                                   child: SizedBox(
                              //                                     child: Text(
                              //                                       snapshot
                              //                                           .data![
                              //                                               index]
                              //                                           .name
                              //                                           .toString(),
                              //                                       maxLines: 1,
                              //                                       overflow:
                              //                                           TextOverflow
                              //                                               .ellipsis,
                              //                                       style: GoogleFonts.dmSans(
                              //                                           fontSize:
                              //                                               18,
                              //                                           color:
                              //                                               textColors),
                              //                                     ),
                              //                                   ),
                              //                                 ),
                              //                               ),
                              //                               GestureDetector(
                              //                                 onTap: () {
                              //                                   var id = snapshot
                              //                                       .data![
                              //                                           index]
                              //                                       .id;
                              //                                   removeItem(id);
                              //                                 },
                              //                                 child: const Icon(
                              //                                   Icons.delete,
                              //                                   color:
                              //                                       primaryColor,
                              //                                 ),
                              //                               ),
                              //                             ],
                              //                           ),
                              //                         ),
                              //                         Padding(
                              //                           padding:
                              //                               const EdgeInsets
                              //                                   .all(5),
                              //                           child: MyGoogleText(
                              //                             text:
                              //                                 '${snapshot.data![index].price}\$',
                              //                             fontSize: 16,
                              //                             fontColor:
                              //                                 Colors.black,
                              //                             fontWeight:
                              //                                 FontWeight.bold,
                              //                           ),
                              //                         ),
                              //                         SizedBox(
                              //                           width: context.width() /
                              //                               1.8,
                              //                           child: Row(
                              //                             mainAxisAlignment:
                              //                                 MainAxisAlignment
                              //                                     .spaceBetween,
                              //                             children: [
                              //                               Row(
                              //                                 children: [
                              //                                   RatingBarWidget(
                              //                                     rating:
                              //                                         initialRating,
                              //                                     activeColor:
                              //                                         ratingColor,
                              //                                     inActiveColor:
                              //                                         ratingColor,
                              //                                     size: 16,
                              //                                     onRatingChanged:
                              //                                         (aRating) {
                              //                                       setState(
                              //                                           () {
                              //                                         initialRating =
                              //                                             aRating;
                              //                                       });
                              //                                     },
                              //                                   ),
                              //                                   const SizedBox(
                              //                                       width: 5),
                              //                                   const MyGoogleText(
                              //                                     text:
                              //                                         '(22 Review)',
                              //                                     fontSize: 12,
                              //                                     fontColor:
                              //                                         textColors,
                              //                                     fontWeight:
                              //                                         FontWeight
                              //                                             .normal,
                              //                                   ),
                              //                                 ],
                              //                               ),
                              //                               Container(
                              //                                 height: 35,
                              //                                 width: 35,
                              //                                 decoration:
                              //                                     BoxDecoration(
                              //                                   color: primaryColor
                              //                                       .withOpacity(
                              //                                           0.05),
                              //                                   borderRadius:
                              //                                       const BorderRadius
                              //                                               .all(
                              //                                           Radius.circular(
                              //                                               30)),
                              //                                 ),
                              //                                 child:
                              //                                     const Center(
                              //                                         child:
                              //                                             Icon(
                              //                                   IconlyLight.bag,
                              //                                   color:
                              //                                       primaryColor,
                              //                                 )),
                              //                               ),
                              //                             ],
                              //                           ),
                              //                         ),
                              //                       ])
                              //                 ],
                              //               ),
                              //             ),
                              //           ),
                              //         );
                              //       } else {
                              //         return const CircularProgressIndicator();
                              //       }
                              //     });
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
