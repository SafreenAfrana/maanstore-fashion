import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
import 'package:maanstore/models/retrieve_customer.dart';
import 'package:maanstore/widgets/buttons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../api_service/api_service.dart';
import '../../const/constants.dart';
import '../../models/add_to_cart_model.dart';
import '../../models/order_create_model.dart' as lee;
import '../../widgets/order_page_shimmer.dart';
import 'check_out_screen.dart';

class ConfirmOrderScreen extends StatefulWidget {
  const ConfirmOrderScreen({
    Key? key,
    this.couponPrice,
  }) : super(key: key);

  final double? couponPrice;

  @override
  State<ConfirmOrderScreen> createState() => _ConfirmOrderScreenState();
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  double totalAmount = 0;
  APIService? apiService;
  int initialValue = 1;
  RetrieveCustomer? retrieveCustomer;
  List<lee.LineItems> lineItems = <lee.LineItems>[];

  @override
  void initState() {
    apiService = APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
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
            text: lang.S.of(context).confirmOrderScreenName,
            fontColor: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///___________Items_view_________________________________
                    Consumer(builder: (context, ref, child) {
                      final cart = ref.watch(cartNotifier);
                      lineItems = cart.cartItems;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyGoogleText(
                            text: '${lang.S.of(context).totalItems} ${cart.cartOtherInfoList.length}',
                            fontSize: 18,
                            fontColor: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          SizedBox(
                            height: 130,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    right: 8,
                                    bottom: 8,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                                        border: Border.all(
                                          width: 1,
                                          color: secondaryColor3,
                                        )),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            height: 110,
                                            width: 110,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: secondaryColor3,
                                              ),
                                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                                              color: secondaryColor3,
                                              image: DecorationImage(image: NetworkImage(cart.cartOtherInfoList[index].productImage.toString())),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: MyGoogleText(
                                                text: cart.cartOtherInfoList[index].productName.toString(),
                                                fontSize: 16,
                                                fontColor: Colors.black,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.width() / 2.3,
                                              child: Padding(
                                                padding: const EdgeInsets.all(5),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    MyGoogleText(
                                                      text: '${cart.cartOtherInfoList[index].productPrice}\$',
                                                      fontSize: 16,
                                                      fontColor: Colors.black,
                                                      fontWeight: FontWeight.normal,
                                                    ),

                                                    ///_____________________quantity_____________________
                                                    Row(
                                                      children: [
                                                        MyGoogleText(
                                                          text: lang.S.of(context).quantity,
                                                          fontSize: 13,
                                                          fontColor: textColors,
                                                          fontWeight: FontWeight.normal,
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        MyGoogleText(
                                                          text: cart.cartOtherInfoList[index].quantity.toString(),
                                                          fontSize: 13,
                                                          fontColor: textColors,
                                                          fontWeight: FontWeight.normal,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: cart.cartOtherInfoList.length,
                            ),
                          ),
                        ],
                      );
                    }),

                    ///____________Shipping_address__________________________
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            MyGoogleText(
                              text: lang.S.of(context).shippingAddress,
                              fontSize: 18,
                              fontColor: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.check_circle,
                              color: primaryColor,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        FutureBuilder<RetrieveCustomer>(
                            future: apiService!.getCustomerDetails(),
                            builder: (context, snapShot) {
                              if (snapShot.hasData) {
                                retrieveCustomer = snapShot.data;
                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: secondaryColor3),
                                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MyGoogleText(
                                        text: '${snapShot.data!.shipping!.firstName} ${snapShot.data!.shipping!.lastName}',
                                        fontSize: 16,
                                        fontColor: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      Flexible(
                                        child: Text(
                                          '${snapShot.data!.shipping!.address1}, ${snapShot.data!.shipping!.address2}, ${snapShot.data!.shipping!.city}, ${snapShot.data!.shipping!.state}, ${snapShot.data!.shipping!.postcode}, ${snapShot.data!.shipping!.country}, ${snapShot.data!.billing!.phone}',
                                          maxLines: 3,
                                          style: GoogleFonts.dmSans(
                                            textStyle: const TextStyle(),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return const ShippingAddressShimmer();
                              }
                            }),
                        const SizedBox(height: 10),
                      ],
                    ),
                    const SizedBox(height: 160),

                    ///_____Cost_Section_____________
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyGoogleText(
                          text: lang.S.of(context).yourOrder,
                          fontSize: 18,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(8.00),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyGoogleText(
                                text: lang.S.of(context).subtotal,
                                fontSize: 16,
                                fontColor: textColors,
                                fontWeight: FontWeight.normal,
                              ),
                              Consumer(builder: (_, ref, __) {
                                final price = ref.watch(cartNotifier);
                                totalAmount = price.cartTotalPriceF(initialValue).toDouble() - price.promoPrice.toDouble();
                                return MyGoogleText(
                                  text: widget.couponPrice == null ? '\$${price.cartTotalPriceF(initialValue)}' : '\$${price.cartTotalPriceF(initialValue) - price.promoPrice}',
                                  fontSize: 20,
                                  fontColor: Colors.black,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: textColors,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.00),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyGoogleText(
                                text: lang.S.of(context).totalAmount,
                                fontSize: 18,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              Consumer(builder: (_, ref, __) {
                                final price = ref.watch(cartNotifier);

                                return MyGoogleText(
                                  text: widget.couponPrice == null ? '\$${price.cartTotalPriceF(initialValue)}' : '\$${price.cartTotalPriceF(initialValue) - price.promoPrice}',
                                  fontSize: 20,
                                  fontColor: Colors.black,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer(builder: (context, ref, child) {
            final cart = ref.read(cartNotifier);

            return Button1(
                buttonText: lang.S.of(context).payWithWebCheckoutButton,
                buttonColor: primaryColor,
                onPressFunction: () {
                  EasyLoading.show(
                    status: lang.S.of(context).easyLoadingCreatingOrder,
                  );
                  apiService?.createOrder(retrieveCustomer!, lineItems, 'Cash on Delivery', false, cart.coupon).then((value) async {
                    if (value) {
                      var snap = await apiService!.getListOfOrder();
                      if (snap.isNotEmpty) {
                        // ignore: use_build_context_synchronously
                        MyWebView(
                          url: snap[0].paymentUrl,
                          id: snap[0].id.toString(),
                        ).launch(context);
                      }

                      EasyLoading.dismiss(animation: true);
                      cart.cartOtherInfoList.clear();
                      cart.cartItems.clear();
                      cart.coupon.clear();
                    } else {
                      EasyLoading.showError(lang.S.of(context).easyLoadingError);
                    }
                  });
                });
          }),
        ),
      ),
    );
  }
}
