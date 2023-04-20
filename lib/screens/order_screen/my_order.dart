import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maanstore/api_service/api_service.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
import 'package:maanstore/screens/order_screen/order_details.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Providers/all_repo_providers.dart';
import '../../const/constants.dart';
import '../../widgets/order_page_shimmer.dart';
import '../home_screens/home.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  APIService? apiService;

  int customerId = 0;

  @override
  void initState() {
    getCustomerId();

    apiService = APIService();
    super.initState();
  }

  Future<void> getCustomerId() async {
    final prefs = await SharedPreferences.getInstance();
    customerId = prefs.getInt('customerId')!;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, __) {
      final getAllOrders = ref.watch(getOrders);
      return Directionality(
        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: GestureDetector(
              onTap: () {
                const Home().launch(context, isNewTask: true);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: MyGoogleText(
              text: lang.S.of(context).myOrderScreenName,
              fontColor: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
          body: SingleChildScrollView(
            child: getAllOrders.when(data: (snapShot) {
              if (snapShot.isNotEmpty) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: context.width(),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                      ),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapShot.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: GestureDetector(
                              onTap: () {
                                OrderDetailsScreen(
                                  order: snapShot[index],
                                  orderId: snapShot[index].id,
                                ).launch(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(15),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(width: 1, color: secondaryColor3),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyGoogleText(
                                      text: '${lang.S.of(context).orderId}${snapShot[index].id}',
                                      fontSize: 16,
                                      fontColor: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      height: 20,
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyGoogleText(
                                            text: '${lang.S.of(context).cartItems} (${snapShot[index].lineItems!.length})',
                                            fontSize: 16,
                                            fontColor: textColors,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          MyGoogleText(
                                            text: '${lang.S.of(context).totalAmount} \$${snapShot[index].total}',
                                            fontSize: 14,
                                            fontColor: textColors,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      height: 20,
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyGoogleText(
                                            text: snapShot[index].dateCreated.toString(),
                                            fontSize: 16,
                                            fontColor: textColors,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          MyGoogleText(
                                            text: snapShot[index].status.toString(),
                                            fontSize: 14,
                                            fontColor: Colors.green,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: MyGoogleText(text: lang.S.of(context).noOrder, fontSize: 16, fontColor: Colors.black, fontWeight: FontWeight.normal),
                );
              }
            }, error: (e, stack) {
              return Text(e.toString());
            }, loading: () {
              return const OrderPageShimmer();
            }),
            // FutureBuilder<List<ListOfOrders>>(
            //     future: apiService!.getListOfOrder(),
            //     builder: (context, snapShot) {
            //       if (snapShot.hasData) {
            //         if (snapShot.data!.isNotEmpty) {
            //           return Column(
            //             children: [
            //               const SizedBox(height: 20),
            //               Container(
            //                 padding: const EdgeInsets.all(20),
            //                 width: context.width(),
            //                 decoration: const BoxDecoration(
            //                   color: Colors.white,
            //                   borderRadius: BorderRadius.only(
            //                     topRight: Radius.circular(30),
            //                     topLeft: Radius.circular(30),
            //                   ),
            //                 ),
            //                 child: ListView.builder(
            //                   physics: const NeverScrollableScrollPhysics(),
            //                   shrinkWrap: true,
            //                   itemCount: snapShot.data!.length,
            //                   itemBuilder: (context, index) {
            //                     return Padding(
            //                       padding: const EdgeInsets.only(bottom: 20),
            //                       child: GestureDetector(
            //                         onTap: () {
            //                           OrderDetailsScreen(
            //                             order: snapShot.data![index],
            //                             orderId: snapShot.data![index].id,
            //                           ).launch(context);
            //                         },
            //                         child: Container(
            //                           padding: const EdgeInsets.all(15),
            //                           width: double.infinity,
            //                           decoration: BoxDecoration(
            //                             borderRadius: const BorderRadius.all(Radius.circular(10)),
            //                             border: Border.all(width: 1, color: secondaryColor3),
            //                           ),
            //                           child: Column(
            //                             crossAxisAlignment: CrossAxisAlignment.start,
            //                             children: [
            //                               MyGoogleText(
            //                                 text: '${isRtl ? HardcodedTextArabic.orderId : HardcodedTextEng.orderId}${snapShot.data![index].id}',
            //                                 fontSize: 16,
            //                                 fontColor: Colors.black,
            //                                 fontWeight: FontWeight.bold,
            //                               ),
            //                               const SizedBox(height: 8),
            //                               SizedBox(
            //                                 height: 20,
            //                                 width: double.infinity,
            //                                 child: Row(
            //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                                   children: [
            //                                     MyGoogleText(
            //                                       text:
            //                                           '${isRtl ? HardcodedTextArabic.cartItems : HardcodedTextEng.cartItems} (${snapShot.data![index].lineItems!.length})',
            //                                       fontSize: 16,
            //                                       fontColor: textColors,
            //                                       fontWeight: FontWeight.normal,
            //                                     ),
            //                                     MyGoogleText(
            //                                       text:
            //                                           '${isRtl ? HardcodedTextArabic.totalAmount : HardcodedTextEng.totalAmount} \$${snapShot.data![index].total}',
            //                                       fontSize: 14,
            //                                       fontColor: textColors,
            //                                       fontWeight: FontWeight.normal,
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ),
            //                               const SizedBox(height: 8),
            //                               SizedBox(
            //                                 height: 20,
            //                                 width: double.infinity,
            //                                 child: Row(
            //                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                                   children: [
            //                                     MyGoogleText(
            //                                       text: snapShot.data![index].dateCreated.toString(),
            //                                       fontSize: 16,
            //                                       fontColor: textColors,
            //                                       fontWeight: FontWeight.normal,
            //                                     ),
            //                                     MyGoogleText(
            //                                       text: snapShot.data![index].status.toString(),
            //                                       fontSize: 14,
            //                                       fontColor: Colors.green,
            //                                       fontWeight: FontWeight.normal,
            //                                     ),
            //                                   ],
            //                                 ),
            //                               ),
            //                               const SizedBox(height: 8),
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                 ),
            //               ),
            //             ],
            //           );
            //         } else {
            //           return Center(
            //             child: MyGoogleText(
            //                 text: isRtl ? HardcodedTextArabic.noOrder : HardcodedTextEng.noOrder,
            //                 fontSize: 16,
            //                 fontColor: Colors.black,
            //                 fontWeight: FontWeight.normal),
            //           );
            //         }
            //       } else {
            //         return const OrderPageShimmer();
            //       }
            //     }),
          ),
        ),
      );
    });
  }
}
