import 'package:flutter/material.dart';
import 'package:maanstore/const/constants.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../models/product_review_model.dart';

class SingleProductTotalReview extends StatefulWidget {
  const SingleProductTotalReview({
    Key? key,
    required this.productReviewModel,
  }) : super(key: key);
  final List<ProductReviewModel>? productReviewModel;

  @override
  State<SingleProductTotalReview> createState() => _SingleProductTotalReviewState();
}

class _SingleProductTotalReviewState extends State<SingleProductTotalReview> {
  double avgRating(List<ProductReviewModel>? productReviewModel) {
    int totalRating = 0;
    for (var element in productReviewModel!) {
      totalRating = totalRating + element.rating!.toInt();
    }
    return totalRating / productReviewModel.length;
  }

  int fiveStarRating(List<ProductReviewModel>? productReviewModel) {
    int totalFiveStarRating = 0;
    for (var element in productReviewModel!) {
      if (element.rating == 5) {
        totalFiveStarRating += 1;
      }
    }
    return totalFiveStarRating;
  }

  int fourStarRating(List<ProductReviewModel>? productReviewModel) {
    int totalFourStarRating = 0;
    for (var element in productReviewModel!) {
      if (element.rating == 4) {
        totalFourStarRating += 1;
      }
    }
    return totalFourStarRating;
  }

  int threeStarRating(List<ProductReviewModel>? productReviewModel) {
    int totalThreeStarRating = 0;
    for (var element in productReviewModel!) {
      if (element.rating == 3) {
        totalThreeStarRating += 1;
      }
    }
    return totalThreeStarRating;
  }

  int twoStarRating(List<ProductReviewModel>? productReviewModel) {
    int totalTwoStarRating = 0;
    for (var element in productReviewModel!) {
      if (element.rating == 2) {
        totalTwoStarRating += 1;
      }
    }
    return totalTwoStarRating;
  }

  int oneStarRating(List<ProductReviewModel>? productReviewModel) {
    int totalOneStarRating = 0;
    for (var element in productReviewModel!) {
      if (element.rating == 2) {
        totalOneStarRating += 1;
      }
    }
    return totalOneStarRating;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    border: Border.all(width: 2, color: primaryColor),
                  ),
                  child: Center(
                    child: MyGoogleText(
                      text: avgRating(widget.productReviewModel).toString(),
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      fontColor: secondaryColor1,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                MyGoogleText(
                  text: '${lang.S.of(context).totalReviews}${widget.productReviewModel!.length}',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontColor: Colors.black,
                ),
              ],
            ),
            isRtl
                ? Positioned(
                    left: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            LinearPercentIndicator(
                              width: 130,
                              lineHeight: 8.0,
                              percent: ((fiveStarRating(widget.productReviewModel) * 100) / widget.productReviewModel!.length.toInt()) / 100,
                              progressColor: secondaryColor1,
                              backgroundColor: secondaryColor3,
                              barRadius: const Radius.circular(15),
                            ),
                            SizedBox(
                                width: 30,
                                child: Center(
                                    child: Text(
                                  fiveStarRating(widget.productReviewModel).toString(),
                                ))),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            LinearPercentIndicator(
                              width: 130,
                              lineHeight: 8.0,
                              percent: ((fourStarRating(widget.productReviewModel) * 100) / widget.productReviewModel!.length.toInt()) / 100,
                              progressColor: secondaryColor1,
                              backgroundColor: secondaryColor3,
                              barRadius: const Radius.circular(15),
                            ),
                            SizedBox(width: 30, child: Center(child: Text(fourStarRating(widget.productReviewModel).toString()))),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            LinearPercentIndicator(
                              width: 130,
                              lineHeight: 8.0,
                              percent: ((threeStarRating(widget.productReviewModel) * 100) / widget.productReviewModel!.length.toInt()) / 100,
                              progressColor: secondaryColor1,
                              backgroundColor: secondaryColor3,
                              barRadius: const Radius.circular(15),
                            ),
                            SizedBox(width: 30, child: Center(child: Text(threeStarRating(widget.productReviewModel).toString()))),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            LinearPercentIndicator(
                              width: 130,
                              lineHeight: 8.0,
                              percent: ((twoStarRating(widget.productReviewModel) * 100) / widget.productReviewModel!.length.toInt()) / 100,
                              progressColor: secondaryColor1,
                              backgroundColor: secondaryColor3,
                              barRadius: const Radius.circular(15),
                            ),
                            SizedBox(width: 30, child: Center(child: Text(twoStarRating(widget.productReviewModel).toString()))),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            LinearPercentIndicator(
                              width: 130,
                              lineHeight: 8.0,
                              percent: ((oneStarRating(widget.productReviewModel) * 100) / widget.productReviewModel!.length.toInt()) / 100,
                              progressColor: secondaryColor1,
                              backgroundColor: secondaryColor3,
                              barRadius: const Radius.circular(15),
                            ),
                            SizedBox(width: 30, child: Center(child: Text(oneStarRating(widget.productReviewModel).toString()))),
                          ],
                        ),
                      ],
                    ),
                  )
                : Positioned(
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            LinearPercentIndicator(
                              width: 130,
                              lineHeight: 8.0,
                              percent: ((fiveStarRating(widget.productReviewModel) * 100) / widget.productReviewModel!.length.toInt()) / 100,
                              progressColor: secondaryColor1,
                              backgroundColor: secondaryColor3,
                              barRadius: const Radius.circular(15),
                            ),
                            SizedBox(
                                width: 30,
                                child: Center(
                                    child: Text(
                                  fiveStarRating(widget.productReviewModel).toString(),
                                ))),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            LinearPercentIndicator(
                              width: 130,
                              lineHeight: 8.0,
                              percent: ((fourStarRating(widget.productReviewModel) * 100) / widget.productReviewModel!.length.toInt()) / 100,
                              progressColor: secondaryColor1,
                              backgroundColor: secondaryColor3,
                              barRadius: const Radius.circular(15),
                            ),
                            SizedBox(width: 30, child: Center(child: Text(fourStarRating(widget.productReviewModel).toString()))),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            LinearPercentIndicator(
                              width: 130,
                              lineHeight: 8.0,
                              percent: ((threeStarRating(widget.productReviewModel) * 100) / widget.productReviewModel!.length.toInt()) / 100,
                              progressColor: secondaryColor1,
                              backgroundColor: secondaryColor3,
                              barRadius: const Radius.circular(15),
                            ),
                            SizedBox(width: 30, child: Center(child: Text(threeStarRating(widget.productReviewModel).toString()))),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            LinearPercentIndicator(
                              width: 130,
                              lineHeight: 8.0,
                              percent: ((twoStarRating(widget.productReviewModel) * 100) / widget.productReviewModel!.length.toInt()) / 100,
                              progressColor: secondaryColor1,
                              backgroundColor: secondaryColor3,
                              barRadius: const Radius.circular(15),
                            ),
                            SizedBox(width: 30, child: Center(child: Text(twoStarRating(widget.productReviewModel).toString()))),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 18, color: ratingColor),
                            LinearPercentIndicator(
                              width: 130,
                              lineHeight: 8.0,
                              percent: ((oneStarRating(widget.productReviewModel) * 100) / widget.productReviewModel!.length.toInt()) / 100,
                              progressColor: secondaryColor1,
                              backgroundColor: secondaryColor3,
                              barRadius: const Radius.circular(15),
                            ),
                            SizedBox(width: 30, child: Center(child: Text(oneStarRating(widget.productReviewModel).toString()))),
                          ],
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
