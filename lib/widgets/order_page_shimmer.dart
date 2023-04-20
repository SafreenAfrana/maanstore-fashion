import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

class OrderPageShimmer extends StatelessWidget {
  const OrderPageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                width: context.width(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16.0,
                      width: context.width() / 2,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 12.0,
                          width: 80.0,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        Container(
                          height: 12.0,
                          width: 120.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 12.0,
                          width: 120.0,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        Container(
                          height: 12.0,
                          width: 60.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class CategoryPageShimmer extends StatelessWidget {
  const CategoryPageShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                width: context.width(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16.0,
                      width: context.width() / 2,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      height: 12.0,
                      width: 80.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class ReviewShimmer extends StatelessWidget {
  const ReviewShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                width: context.width(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16.0,
                      width: context.width() / 2,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 12.0,
                          width: 80.0,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        Container(
                          height: 12.0,
                          width: 120.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 12.0,
                          width: 120.0,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        Container(
                          height: 12.0,
                          width: 60.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class ShippingAddressShimmer extends StatelessWidget {
  const ShippingAddressShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: context.width(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.white),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 16.0,
                width: context.width() / 2,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    height: 12.0,
                    width: 80.0,
                    color: Colors.white,
                  ),
                  const Spacer(),
                  Container(
                    height: 12.0,
                    width: 120.0,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Container(
                    height: 12.0,
                    width: 120.0,
                    color: Colors.white,
                  ),
                  const Spacer(),
                  Container(
                    height: 12.0,
                    width: 60.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
