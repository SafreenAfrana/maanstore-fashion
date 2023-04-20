// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maanstore/api_service/api_service.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
import 'package:maanstore/screens/home_screens/home.dart';
import 'package:maanstore/screens/order_screen/my_order.dart';
import 'package:maanstore/widgets/buttons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Providers/all_repo_providers.dart';
import '../../const/constants.dart';
import '../../models/list_of_orders.dart';
import 'check_out_screen.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key, required this.order, required this.orderId}) : super(key: key);
  final ListOfOrders order;

  final int? orderId;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  APIService? apiService;
  String? reason;
  int orderStatus = 0;

  @override
  void initState() {
    apiService = APIService();
    super.initState();
    if (widget.order.status == 'pending') {
      orderStatus = 1;
    } else if (widget.order.status == 'processing') {
      orderStatus = 2;
    } else if (widget.order.status == 'completed') {
      orderStatus = 3;
    } else if (widget.order.status == 'delivered') {
      orderStatus = 4;
    } else if (widget.order.status == 'cancelled') {
      orderStatus = 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, __) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: MyGoogleText(
            text: lang.S.of(context).orderDetailsScreenName,
            fontColor: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 70,
                width: 350,
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Icon(orderStatus >= 1 ? Icons.check_circle : Icons.radio_button_off_sharp, size: 30, color: secondaryColor1),
                            ),
                            Container(height: 2, width: 70, decoration: const BoxDecoration(color: secondaryColor1)),
                            SizedBox(
                              child: Icon(orderStatus >= 2 ? Icons.check_circle : Icons.radio_button_off_sharp, size: 30, color: secondaryColor1),
                            ),
                            Container(height: 2, width: 70, decoration: const BoxDecoration(color: secondaryColor1)),
                            SizedBox(
                              child: Icon(orderStatus >= 3 ? Icons.check_circle : Icons.radio_button_off_sharp, size: 30, color: secondaryColor1),
                            ),
                            Container(height: 2, width: 70, decoration: const BoxDecoration(color: secondaryColor1)),
                            orderStatus == 5
                                ? SizedBox(
                                    child: Icon(orderStatus == 5 ? Icons.check_circle : Icons.radio_button_off_sharp, size: 30, color: secondaryColor1),
                                  )
                                : SizedBox(
                                    child: Icon(orderStatus == 4 ? Icons.check_circle : Icons.radio_button_off_sharp, size: 30, color: secondaryColor1),
                                  )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Pending'),
                          const Text('Processing'),
                          const Text('Completed'),
                          orderStatus == 5 ? const Text('Cancelled') : const Text('Delivered'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyGoogleText(
                            text: '${lang.S.of(context).orderId}${widget.order.id.toString()}',
                            fontSize: 18,
                            fontColor: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                          MyGoogleText(
                            text: widget.order.dateCreated.toString(),
                            fontSize: 16,
                            fontColor: textColors,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    MyGoogleText(
                      text: '${lang.S.of(context).cartItems} (${widget.order.lineItems!.length})',
                      fontSize: 18,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    SizedBox(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.order.lineItems!.length,
                        itemBuilder: (BuildContext ctx, index) {
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 5),
                                    child: MyGoogleText(
                                      text: widget.order.lineItems![index].name.toString(),
                                      fontSize: 16,
                                      fontColor: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20, left: 20, top: 8, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyGoogleText(
                                            text: '${lang.S.of(context).price} $currencySign${widget.order.lineItems![index].total}',
                                            fontSize: 14,
                                            fontColor: Colors.black,
                                            fontWeight: FontWeight.normal,
                                          ),
                                          MyGoogleText(
                                            text: '${lang.S.of(context).quantity} ${widget.order.lineItems![index].quantity}',
                                            fontSize: 14,
                                            fontColor: Colors.black,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
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
                              MyGoogleText(
                                text: '$currencySign${widget.order.total.toString()}',
                                fontSize: 18,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
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
                              MyGoogleText(
                                text: '$currencySign${widget.order.total}',
                                fontSize: 20,
                                fontColor: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyGoogleText(
                          text: lang.S.of(context).paymentMethod,
                          fontSize: 18,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        const SizedBox(height: 10),
                        MyGoogleText(
                          text: widget.order.paymentMethodTitle.toString(),
                          fontSize: 16,
                          fontColor: textColors,
                          fontWeight: FontWeight.normal,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 1,
                            color: secondaryColor3,
                          )),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyGoogleText(
                          text: lang.S.of(context).shippingAddress,
                          fontSize: 18,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        const SizedBox(height: 10),
                        Flexible(
                            child: Text(
                          '${widget.order.shipping!.address1}, ${widget.order.shipping!.address2}, ${widget.order.shipping!.city}, ${widget.order.shipping!.state}, ${widget.order.shipping!.postcode}, ${widget.order.shipping!.country}, ${lang.S.of(context).phone} ${widget.order.shipping!.phone}.',
                          maxLines: 3,
                        )),
                        const SizedBox(height: 10),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 1,
                            color: secondaryColor3,
                          )),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: widget.order.status == 'pending'
                    ? Button1(
                        buttonText: lang.S.of(context).payNowButton,
                        buttonColor: primaryColor,
                        onPressFunction: () {
                          MyWebView(
                            url: widget.order.paymentUrl,
                            id: widget.order.id.toString(),
                          ).launch(context);
                        })
                    : Button1(
                        buttonText: lang.S.of(context).goToHomeButton,
                        buttonColor: primaryColor,
                        onPressFunction: () {
                          const Home().launch(context, isNewTask: true);
                        }),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ButtonType2(
                    buttonText: lang.S.of(context).cancelOrderButton,
                    buttonColor: primaryColor,
                    onPressFunction: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 600,
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        MyGoogleText(text: lang.S.of(context).cancelingOrder, fontSize: 16, fontColor: textColors, fontWeight: FontWeight.normal),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(Icons.cancel_outlined))
                                      ],
                                    ),
                                  ),
                                  TextField(
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      hintText: lang.S.of(context).cancelingOrderHintText,
                                    ),
                                    maxLines: 3,
                                    onChanged: (value) {
                                      reason = value;
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                  Button1(
                                      buttonText: lang.S.of(context).cancelOrderButton,
                                      buttonColor: primaryColor,
                                      onPressFunction: () {
                                        EasyLoading.show(status: lang.S.of(context).easyLoadingCancelingOrder);
                                        apiService!.updateOrder(widget.orderId!.toInt(), reason.toString()).then((value) {
                                          if (value) {
                                            ref.refresh(getOrders);
                                            EasyLoading.showSuccess(lang.S.of(context).easyLoadingSuccess);

                                            const MyOrderScreen().launch(context, isNewTask: true);
                                          } else {
                                            EasyLoading.showError(lang.S.of(context).easyLoadingError);
                                          }
                                        });
                                      })
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ).visible(orderStatus < 3),
            ],
          ),
        ),
      );
    });
  }
}
