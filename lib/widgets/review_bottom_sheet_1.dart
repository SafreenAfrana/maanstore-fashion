import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:maanstore/api_service/api_service.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
import 'package:nb_utils/nb_utils.dart';

import '../const/constants.dart';
import '../models/retrieve_customer.dart';
import 'buttons.dart';

class GivingRatingBottomSheet extends StatefulWidget {
  const GivingRatingBottomSheet({Key? key, required this.productId}) : super(key: key);

  final int productId;

  @override
  State<GivingRatingBottomSheet> createState() => _GivingRatingBottomSheetState();
}

class _GivingRatingBottomSheetState extends State<GivingRatingBottomSheet> {
  APIService? apiService;
  String reviewText = '';
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    apiService = APIService();
    super.initState();
  }

  double initialRating = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: FutureBuilder<RetrieveCustomer>(
          future: apiService!.getCustomerDetails(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyGoogleText(
                        text: lang.S.of(context).writeReview,
                        fontSize: 20,
                        fontColor: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  MyGoogleText(
                    text: lang.S.of(context).ratingText,
                    fontSize: 20,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: RatingBarWidget(
                      rating: initialRating,
                      activeColor: ratingColor,
                      inActiveColor: ratingColor,
                      size: 60,
                      onRatingChanged: (aRating) {
                        setState(() {
                          initialRating = aRating;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  MyGoogleText(
                    text: lang.S.of(context).ratingText,
                    fontSize: 20,
                    fontColor: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: globalKey,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      maxLines: 10,
                      minLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return lang.S.of(context).textFieldUserNameValidatorText1;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        reviewText = value!;
                      },
                      decoration: InputDecoration(
                        hintText: lang.S.of(context).massage,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      onChanged: (value) {
                        reviewText = value;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Button1(
                    buttonText: lang.S.of(context).apply,
                    buttonColor: primaryColor,
                    onPressFunction: () {
                      if (validateAndSave()) {
                        EasyLoading.show(status: lang.S.of(context).updateHint);
                        apiService!.createReview(reviewText, initialRating.toInt(), widget.productId, snapShot.data!.username ?? '', snapShot.data!.email ?? '').then((value) {
                          if (value) {
                            EasyLoading.showSuccess(lang.S.of(context).easyLoadingSuccess);
                            globalKey.currentState?.reset();
                            finish(context);
                          } else {
                            EasyLoading.showError(lang.S.of(context).easyLoadingError);
                            globalKey.currentState?.reset();
                          }
                        });
                      } else {
                        EasyLoading.showError(
                          lang.S.of(context).ratingError,
                        );
                      }
                      globalKey.currentState?.reset();
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate() && initialRating != 0) {
      form.save();
      return true;
    }
    return false;
  }
}

class ReviewBottomSheet extends StatefulWidget {
  const ReviewBottomSheet({Key? key}) : super(key: key);

  @override
  State<ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyGoogleText(
                  text: lang.S.of(context).writeReview,
                  fontSize: 20,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Image(
              image: AssetImage('images/review_pic.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyGoogleTextWhitAli(
                      fontSize: 26,
                      fontColor: Colors.black,
                      text: lang.S.of(context).haveNotPurchased,
                      fontWeight: FontWeight.bold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  MyGoogleTextWhitAli(
                    fontSize: 16,
                    fontColor: textColors,
                    text: lang.S.of(context).haveNotPurchased2,
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Button1(
                  buttonText: lang.S.of(context).continueShopping,
                  buttonColor: primaryColor,
                  onPressFunction: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
