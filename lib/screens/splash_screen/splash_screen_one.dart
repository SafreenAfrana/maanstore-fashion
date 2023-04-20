import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maanstore/const/constants.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
import 'package:maanstore/language_screen_starting.dart';
import 'package:maanstore/screens/home_screens/home.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../const/hardcoded_text.dart';

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({Key? key}) : super(key: key);

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  Future<void> pageNavigation() async {
    final prefs = await SharedPreferences.getInstance();
    final int? customerId = prefs.getInt('customerId');
    isRtl = prefs.getBool('isRtl') ?? false;
    await Future.delayed(
      const Duration(seconds: 3),
    );
    if (customerId != null) {
      if (!mounted) return;
      const Home().launch(context, isNewTask: true);
    } else {
      if (!mounted) return;
      const LanguageScreenTwo().launch(context, isNewTask: true);
    }
  }

  @override
  void initState() {
    pageNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: size.height / 3),
              Container(
                height: 210,
                width: 210,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(180),
                ),
                child: Image(
                  image: AssetImage(
                    HardcodedImages.appLogo,
                  ),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    lang.S.of(context).splashScreenOneAppName,
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Text(
                    lang.S.of(context).splashScreenOneAppVersion,
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
    );
  }
}
