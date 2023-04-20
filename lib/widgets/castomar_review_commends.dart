// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../const/constants.dart';
import '../models/product_review_model.dart';
import 'package:intl/intl.dart' as intl;

class CustomerReviewCommends extends StatefulWidget {
  CustomerReviewCommends({Key? key, this.productReviewModel}) : super(key: key);

  List<ProductReviewModel>? productReviewModel = [];

  @override
  State<CustomerReviewCommends> createState() => _CustomerReviewCommendsState();
}

class _CustomerReviewCommendsState extends State<CustomerReviewCommends> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.productReviewModel!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(width: 1, color: secondaryColor3),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        image: DecorationImage(
                            image: AssetImage('images/profile_image.png'),
                            fit: BoxFit.fitWidth),
                      ),
                    ),
                    title: MyGoogleText(
                      text: widget.productReviewModel![index].reviewer ?? '',
                      fontSize: 18,
                      fontColor: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    subtitle: RatingBarWidget(
                      rating:
                          widget.productReviewModel![index].rating!.toDouble(),
                      activeColor: ratingColor,
                      inActiveColor: ratingColor,
                      size: 18,
                      onRatingChanged: (aRating) {},
                    ),
                    trailing: MyGoogleText(
                      text: widget
                          .productReviewModel![index].dateCreated!.timeAgo,
                      fontSize: 12,
                      fontColor: textColors,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 75),
                    child: MyGoogleText(
                      text: intl.Bidi.stripHtmlIfNeeded(
                          widget.productReviewModel![index].review ?? ''),
                      fontSize: 16,
                      fontColor: textColors,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
