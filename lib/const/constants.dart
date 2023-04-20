import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/wishlist_model.dart';

bool isRtl = false;

//Select Gateways
const bool usePaypal = true;
const bool usePaystack = true;
const bool usePaytm = true;
const bool useRazorpay = true;
const bool useFlutterwave = true;
const bool useStripe = true;
const bool useWebview = true;
const bool useCashOnDelivery = true;


//Paypal Settings
const String paypalClientId = 'ATKxCBB49G3rPw4DG_0vDmygbZeFKubzub7jGWpeUW5jzfElK9qOzqJOfrBTYvS7RuIhoPdWHB4DIdLJ';
const String paypalClientSecret = 'EIDqVfraXlxDBMnswmhqP2qYv6rr_KPDgK269T-q1K9tB455OpPL_fc65irFiPBpiVXcoOQwpKqU3PAu';
const bool sandbox = true;
const String paypalCurrency = 'USD';

//Razorpay Settings
const String razorpayid = 'rzp_test_ok0kwBL8IaZKjs';
const String razorpayCurrency = 'USD';

//Paystack Settings
const String paystackPublicId = 'pk_test_a0cb8b9116b87e71390dfa0a390492a6beea4097';
const String paystackSecretId = 'sk_test_83c739c2a0c8848f8b3f769ba7a3b74e0c24459f';
const String payStackCurrency = 'ZAR';

//Flutterwave Settings
const String flutterwavePublicKey = 'FLWPUBK_TEST-4732c2ce170b45e83b30bc30ea5d9385-X';
const String flutterwaveSecretKey = 'FLWSECK_TEST-9f5e80c70de84afa41bd6bba7626d897-X';
const String flutterwaveEncryptionKey = 'FLWSECK_TEST6bc8eaceedfa';
const String flutterwaveCurrency = 'ZAR';

//Stripe Settings
const String stripePublishableKey = 'pk_test_zOmNeUO71xTTP3jVPVcaQrsO';
const String stripeSecretKey = 'sk_test_MGyxDcHhKWRCAooZv4366wK1';
const String stripeCurrency = 'USD';



const String currency = 'USD';

//Onesignal Settings
const String oneSignalAppId = '5991efe6-21f5-4900-b8ba-2cf0e25f10e3';

const int bestSellingProduct = 29;
const int flashSale = 30;
const int newArrive = 31;
const String currencySign = '\$';
const String shippingCountry = 'India';



const primaryColor = Color(0xFFFF7F00);
const secondaryColor1 = Color(0xFFE2396C);
const secondaryColor2 = Color(0xFFFBFBFB);
const secondaryColor3 = Color(0xFFE5E5E5);
const titleColors = Color(0xFF1A1A1A);
const textColors = Color(0xFF828282);
const ratingColor = Color(0xFFFFB03A);

const categoryColor1 = Color(0xFFFCF3D7);
const categoryColor2 = Color(0xFFDCF7E3);
List<Wishlist> wishList = [];
int? wishListItems;
Future<void> addToWishList(Wishlist wishLists) async {
  wishList.add(wishLists);
  String encodedData = Wishlist.encode(wishList);
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('wishListProducts', encodedData);
  //final getData = prefs.getString('wishListProducts');
  //final decodedData = Wishlist.decode(getData!);
}

final TextStyle kTextStyle = GoogleFonts.dmSans(
  textStyle: const TextStyle(
    color: textColors,
    fontSize: 16,
  ),
);

class MyGoogleText extends StatelessWidget {
  const MyGoogleText(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.fontColor,
      required this.fontWeight})
      : super(key: key);
  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.dmSans(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
        ),
      ),
      maxLines: 1,
    );
  }
}

class MyGoogleTextWhitAli extends StatelessWidget {
  const MyGoogleTextWhitAli({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontColor,
    required this.fontWeight,
    required this.textAlign,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.dmSans(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor,
        ),
      ),
    );
  }
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: secondaryColor1),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);
