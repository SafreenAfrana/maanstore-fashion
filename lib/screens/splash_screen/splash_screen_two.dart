import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:maanstore/const/constants.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
import 'package:maanstore/screens/Auth_Screen/auth_screen_1.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../const/hardcoded_text.dart';
import '../home_screens/home.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({Key? key}) : super(key: key);

  @override
  State<SplashScreenTwo> createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  double progressBur = 0.3333;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () {
                const Home().launch(
                  context,
                  isNewTask: true,
                );
              },
              child: Text(
                lang.S.of(context).skipText,
                style: kTextStyle,
              ),
            ),
          ],
        ),
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          itemCount: HardcodedImages.splashScreenImages.length,
          itemBuilder: (context, position) {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image(
                      image: AssetImage(HardcodedImages.splashScreenImages[position]),
                      height: size.height / 2,
                    ),
                    Stack(
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Image(
                            image: AssetImage('images/rectangle_1.png'),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20.0),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              GestureDetector(
                                child: CircularPercentIndicator(
                                  radius: 30.0,
                                  lineWidth: 4.0,
                                  percent: progressBur,
                                  center: const Icon(
                                    FeatherIcons.chevronsRight,
                                    color: Colors.red,
                                  ),
                                  progressColor: Colors.red,
                                ),
                                onTap: () {
                                  if (progressBur < 0.70) {
                                    setState(() {
                                      progressBur = progressBur + 0.3333;
                                    });
                                  } else {
                                    const AuthScreen().launch(context, isNewTask: true);
                                  }
                                  pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                position == 0
                                    ? lang.S.of(context).splashScreenTwoHeadlines1
                                    : position == 1
                                        ? lang.S.of(context).splashScreenTwoHeadlines2
                                        : lang.S.of(context).splashScreenTwoHeadlines3,
                                style: GoogleFonts.dmSans(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                position == 0
                                    ? lang.S.of(context).splashScreenTwoSubTitles1
                                    : position == 1
                                        ? lang.S.of(context).splashScreenTwoSubTitles2
                                        : lang.S.of(context).splashScreenTwoSubTitles3,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.dmSans(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: textColors,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
