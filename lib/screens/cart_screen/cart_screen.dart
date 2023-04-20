// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maanstore/api_service/api_service.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
import 'package:maanstore/models/order_create_model.dart';
import 'package:maanstore/screens/order_screen/check_out_screen.dart';
import 'package:maanstore/widgets/buttons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../const/constants.dart';
import '../../models/add_to_cart_model.dart';
import '../Auth_Screen/auth_screen_1.dart';
import '../home_screens/home.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int cartItems = 0;
  APIService? apiService;
  int initialValueFromText = 0;
  int initialValue = 1;
  bool isCouponApply = false;
  String inputCoupon = '';
  late TextEditingController _controller;
  String finalInputCoupon = '';

  @override
  void initState() {
    apiService = APIService();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            Consumer(builder: (_, ref, child) {
              final cart = ref.watch(cartNotifier);
              cartItems = cart.cartItems.length;
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Center(
                  child: MyGoogleText(
                    text: '${cart.cartOtherInfoList.length} ${lang.S.of(context).cartItems}',
                    fontSize: 16,
                    fontColor: textColors,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              );
            }),
          ],
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
            text: lang.S.of(context).cartScreenName,
            fontColor: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                width: context.width(),
                height: context.height(),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        final cart = ref.watch(cartNotifier);
                        if (cart.cartOtherInfoList.isEmpty) {
                          return Center(
                            child: MyGoogleText(text: lang.S.of(context).ifNoItems, fontSize: 20, fontColor: textColors, fontWeight: FontWeight.bold),
                          );
                        } else {
                          return SizedBox(
                            height: context.height() / 2,
                            child: ListView.builder(
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
                                      mainAxisSize: MainAxisSize.min,
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
                                          children: [
                                            SizedBox(
                                              width: context.width() / 2.3,
                                              child: Text(
                                                cart.cartOtherInfoList[index].productName.toString(),
                                                style: kTextStyle.copyWith(
                                                  color: Colors.black,
                                                ),
                                                maxLines: 2,
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.width() / 2.3,
                                              child: GridView.builder(
                                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisExtent: 20,
                                                ),
                                                itemCount: cart.cartOtherInfoList[index].attributesName!.length,
                                                itemBuilder: (context, i) {
                                                  return Row(
                                                    children: [
                                                      MyGoogleText(
                                                        text: '${cart.cartOtherInfoList[index].attributesName![i]} :',
                                                        // text: isRtl ? HardcodedTextArabic.color : HardcodedTextEng.color,
                                                        fontSize: 12,
                                                        fontColor: Colors.black,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Container(
                                                        decoration: const BoxDecoration(
                                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                                        ),
                                                        child: Text(cart.cartOtherInfoList[index].selectedAttributes![i].toString()),
                                                      ),
                                                    ],
                                                  );
                                                },
                                                shrinkWrap: true,
                                                physics: const NeverScrollableScrollPhysics(),
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
                                                    SizedBox(
                                                      width: 60,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                if (cart.cartOtherInfoList[index].quantity! != 1) {
                                                                  isCouponApply = false;
                                                                }
                                                                cart.cartOtherInfoList[index].quantity! > 1
                                                                    ? cart.decreaseQuantity(index)
                                                                    : cart.cartOtherInfoList[index].quantity = 1;
                                                              });
                                                            },
                                                            child: Material(
                                                              elevation: 4,
                                                              color: secondaryColor3,
                                                              borderRadius: BorderRadius.circular(30),
                                                              child: const SizedBox(
                                                                width: 20,
                                                                height: 20,
                                                                child: Center(
                                                                  child: Icon(FeatherIcons.minus, size: 10, color: textColors),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            cart.cartOtherInfoList[index].quantity.toString(),
                                                            style: GoogleFonts.dmSans(fontSize: 18),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                isCouponApply = false;
                                                                cart.coupon.clear();
                                                                cart.increaseQuantity(index);
                                                              });
                                                            },
                                                            child: Material(
                                                              elevation: 4,
                                                              color: secondaryColor3,
                                                              borderRadius: BorderRadius.circular(30),
                                                              child: const SizedBox(
                                                                width: 20,
                                                                height: 20,
                                                                child: Center(
                                                                  child: Icon(Icons.add, size: 10, color: textColors),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              cart.removeItemInfo(cart.cartOtherInfoList[index].productName.toString());
                                              cart.coupon.clear();
                                              setState(() {
                                                isCouponApply = false;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: secondaryColor1,
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: cart.cartOtherInfoList.length,
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      border: Border.all(width: 1, color: textColors),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          width: 60,
                          decoration: const BoxDecoration(
                            border: Border(right: BorderSide(width: 1, color: textColors)),
                          ),
                          child: const Center(
                              child: Icon(
                            Icons.percent,
                            color: textColors,
                          )),
                        ),
                        SizedBox(
                            width: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value) {
                                  inputCoupon = value;
                                },
                                controller: _controller,
                                cursorColor: textColors,
                                decoration: InputDecoration(
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                  border: InputBorder.none,
                                  label: MyGoogleText(
                                    text: lang.S.of(context).coupon,
                                    fontColor: textColors,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            )),
                        Consumer(builder: (_, ref, __) {
                          final price = ref.watch(cartNotifier);
                          final double totalPrice = price.cartTotalPriceF(initialValue);
                          return GestureDetector(
                            onTap: () async {
                              try {
                                if (inputCoupon == '') {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                      lang.S.of(context).enterCoupon,
                                    ),
                                  ));
                                } else {
                                  EasyLoading.show(status: lang.S.of(context).easyLoadingApplying);
                                  setState(() {
                                    finalInputCoupon = inputCoupon;
                                    _controller.text = finalInputCoupon;
                                  });
                                  CouponLines coupon = CouponLines(code: inputCoupon);
                                  price.addCoupon(coupon);
                                  var promoPrice = await apiService?.retrieveCoupon(finalInputCoupon, totalPrice);
                                  if (promoPrice! > 0.0) {
                                    price.updatePrice(promoPrice);
                                    setState(() {
                                      isCouponApply = true;
                                    });
                                    EasyLoading.showSuccess(lang.S.of(context).easyLoadingSuccessApplied);
                                  } else {
                                    EasyLoading.showError(lang.S.of(context).easyLoadingError);
                                  }
                                }
                              } catch (e) {
                                EasyLoading.showError(e.toString());
                              }
                            },
                            child: Container(
                              height: 60,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: isRtl
                                      ? const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
                                      : const BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                                  color: secondaryColor1),
                              child: Center(
                                child: MyGoogleText(
                                  text: lang.S.of(context).couponApply,
                                  fontSize: 14,
                                  fontColor: Colors.white,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
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
                          return MyGoogleText(
                            text: '\$${price.cartTotalPriceF(initialValue)}',
                            fontSize: 20,
                            fontColor: Colors.black,
                            fontWeight: FontWeight.normal,
                          );
                        }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyGoogleText(
                          text: lang.S.of(context).discount,
                          fontSize: 16,
                          fontColor: textColors,
                          fontWeight: FontWeight.normal,
                        ),
                        Consumer(builder: (_, ref, __) {
                          final price = ref.watch(cartNotifier);
                          return MyGoogleText(
                            text: '\$${price.promoPrice}',
                            fontSize: 20,
                            fontColor: Colors.black,
                            fontWeight: FontWeight.normal,
                          );
                        }),
                      ],
                    ),
                  ).visible(isCouponApply),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      width: 1,
                      color: textColors,
                    ))),
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
                        !isCouponApply
                            ? Consumer(builder: (_, ref, __) {
                                final price = ref.watch(cartNotifier);
                                return MyGoogleText(
                                  text: '\$${price.cartTotalPriceF(initialValue)}',
                                  fontSize: 20,
                                  fontColor: Colors.black,
                                  fontWeight: FontWeight.normal,
                                );
                              })
                            : Consumer(builder: (_, ref, __) {
                                final price = ref.watch(cartNotifier);
                                return MyGoogleText(
                                  text: '\$${price.cartTotalPriceF(initialValue) - price.promoPrice}',
                                  fontSize: 20,
                                  fontColor: Colors.black,
                                  fontWeight: FontWeight.normal,
                                );
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Consumer(
                builder: (_, ref, __) {
                  final cart = ref.watch(cartNotifier);
                  return cart.cartItems.isNotEmpty
                      ? Button1(
                          buttonText: lang.S.of(context).checkOutButton,
                          buttonColor: primaryColor,
                          onPressFunction: () async {
                            final prefs = await SharedPreferences.getInstance();
                            final int? customerId = prefs.getInt('customerId');
                            if (customerId == null) {
                              if (!mounted) return;
                              const AuthScreen().launch(context, isNewTask: true);
                            } else {
                              if (!mounted) return;
                              isCouponApply
                                  ? CheckOutScreen(
                                      couponPrice: cart.promoPrice,
                                    ).launch(context)
                                  : const CheckOutScreen().launch(context);
                            }
                          })
                      : Button1(
                          buttonText: lang.S.of(context).checkOutButton,
                          buttonColor: primaryColor,
                          onPressFunction: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(milliseconds: 700),
                                content: Text(lang.S.of(context).addProductFirst),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
