import 'package:flutter/material.dart';
import 'package:maanstore/widgets/rating_filter_widget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../const/constants.dart';
import '../models/category_model.dart';
import 'buttons.dart';


class Filter extends StatefulWidget {
  const Filter({Key? key, required this.colors, required this.size, required this.categoryList}) : super(key: key);

  final List<String> colors;
  final List<String> size;
  final List<CategoryModel> categoryList;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String selectedColor = 'no data';
  String selectedSize = 'no data';
  bool isCheckedMostPopular = false;
  bool isCheckedNewItem = false;
  bool isCheckedPriceHighToLow = false;
  bool isCheckedPriceLowToHigh = false;
  bool isCheckedRating = false;
  final productType = ['All', 'Dresses', 'Shoes', 'T-shirts', 'Tops', 'Pants'];
  int currentItem = 0;
  SfRangeValues _values = const SfRangeValues(20.0, 1000.0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const MyGoogleText(
                  text: 'Apply Filter',
                  fontSize: 20,
                  fontColor: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            // const SizedBox(height: 30),
            // const MyGoogleTextWhitAli(
            //   text: 'Categories',
            //   fontSize: 16,
            //   fontColor: Colors.black,
            //   fontWeight: FontWeight.normal,
            //   textAlign: TextAlign.start,
            // ),
            // HorizontalList(
            //   itemBuilder: (BuildContext context, int index) {
            //     return GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           currentItem = index;
            //         });
            //       },
            //       child: Container(
            //         padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
            //         decoration: BoxDecoration(
            //           color: currentItem == index ? secondaryColor1 : Colors.white,
            //           border: Border.all(
            //             width: 1,
            //             color: secondaryColor3,
            //           ),
            //           borderRadius: const BorderRadius.all(Radius.circular(30)),
            //         ),
            //         child: MyGoogleText(
            //           text: widget.categoryList[index].name.toString(),
            //           fontSize: 14,
            //           fontWeight: FontWeight.normal,
            //           fontColor: currentItem == index ? Colors.white : Colors.black,
            //         ),
            //       ),
            //     );
            //   },
            //   itemCount: widget.categoryList.length,
            // ),
            const SizedBox(height: 20),
            const MyGoogleTextWhitAli(
              text: 'Price Range',
              fontSize: 16,
              fontColor: Colors.black,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            SfRangeSlider(
              activeColor: secondaryColor1,
              min: 0.0.toInt(),
              max: 5000.0.toInt(),
              values: _values,
              interval: 1000,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              onChanged: (SfRangeValues values) {
                setState(() {
                  _values = values;
                });
              },
            ),
            const SizedBox(height: 20),
            const MyGoogleTextWhitAli(
              text: 'Color',
              fontSize: 16,
              fontColor: Colors.black,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: context.width(),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.colors.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = widget.colors[index].toString();
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          color: selectedColor == widget.colors[index].toString() ? secondaryColor1 : Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            style: TextStyle(color: selectedColor == widget.colors[index].toString() ? Colors.white : Colors.black),
                            widget.colors[index].toString(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const MyGoogleTextWhitAli(
              text: 'Size',
              fontSize: 16,
              fontColor: Colors.black,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 60,
              width: context.width(),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.size.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = widget.size[index];
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                          color: selectedSize == widget.size[index] ? secondaryColor1 : Colors.white,
                        ),
                        child: Center(
                            child: Text(
                          widget.size[index].toString(),
                          style: TextStyle(
                            color: selectedSize == widget.size[index] ? Colors.white : Colors.black,
                          ),
                        )),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const MyGoogleTextWhitAli(
              text: 'Star Rating',
              fontSize: 16,
              fontColor: Colors.black,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.start,
            ).visible(false),
            const SizedBox(height: 10).visible(false),
            const SizedBox(
              height: 50,
              child: StarRating(),
            ).visible(false),
            const SizedBox(height: 50).visible(false),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ButtonType2(
                    buttonText: 'Reset',
                    buttonColor: primaryColor,
                    onPressFunction: () {
                      FilterDataModel filterDataModel = FilterDataModel(
                        selectedPrice: const SfRangeValues(0, 1000000),
                        selectedSize: 'no data',
                        selectedColor: 'no data',
                        isFiltered: false,
                      );
                      Navigator.pop(
                        context,
                        filterDataModel,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Button1(
                    buttonText: 'Apply',
                    buttonColor: primaryColor,
                    onPressFunction: () {
                      FilterDataModel filterDataModel = FilterDataModel(
                        selectedColor: selectedColor,
                        selectedSize: selectedSize,
                        selectedPrice: _values,
                        isFiltered: true,
                      );

                      Navigator.pop(
                        context,
                        filterDataModel,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDataModel {
  FilterDataModel({required this.selectedPrice, required this.selectedColor, required this.selectedSize, required this.isFiltered});
  String selectedColor;
  String selectedSize;
  SfRangeValues selectedPrice;
  bool isFiltered;
}
