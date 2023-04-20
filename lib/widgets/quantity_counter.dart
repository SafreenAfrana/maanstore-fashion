
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const/constants.dart';

// ignore: must_be_immutable
class QuantityCounter extends StatefulWidget {
  QuantityCounter({Key? key, required this.initialValue, required this.sizeOfButtons}) : super(key: key);
  late int initialValue;
 final double sizeOfButtons;

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.sizeOfButtons*3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.initialValue > 1 ? widget.initialValue-- : null;
              });
            },
            child: Material(
              elevation: 4,
              color: secondaryColor3,
              borderRadius: BorderRadius.circular(30),
              child:  SizedBox(
                width: widget.sizeOfButtons,
                height: widget.sizeOfButtons,
                child:  Center(
                  child: Icon(FeatherIcons.minus, size: widget.sizeOfButtons-10, color: textColors),
                ),
              ),
            ),
          ),
          Text(
            widget.initialValue.toString(),
            style: GoogleFonts.dmSans(fontSize: 18),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.initialValue++;
              });
            },
            child: Material(
              elevation: 4,
              color: secondaryColor3,
              borderRadius: BorderRadius.circular(30),
              child:  SizedBox(
                width: widget.sizeOfButtons,
                height: widget.sizeOfButtons,
                child:  Center(
                  child: Icon(Icons.add, size: widget.sizeOfButtons-10, color: textColors),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
