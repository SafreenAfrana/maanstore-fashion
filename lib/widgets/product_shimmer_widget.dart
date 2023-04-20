import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerWidget extends StatelessWidget {
  const ProductShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HorizontalList(
        itemCount: 10,
        itemBuilder: (_, i) {
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
                      height: 100.0,
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
                    const SizedBox(
                      height: 4.0,
                    ),
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
}


class ProductGridShimmerWidget extends StatelessWidget {
  const ProductGridShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics:
        const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.7,
        ),
        itemCount: 10,
        itemBuilder: (_, i) {
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
                    const SizedBox(
                      height: 4.0,
                    ),
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
}