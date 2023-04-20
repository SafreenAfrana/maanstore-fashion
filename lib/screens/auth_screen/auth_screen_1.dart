import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maanstore/const/hardcoded_text.dart';
import 'package:maanstore/screens/auth_screen/log_in_screen.dart';
import 'package:maanstore/screens/auth_screen/sign_up.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../const/constants.dart';
import '../../widgets/buttons.dart';
import '../home_screens/home.dart';
import 'package:maanstore/generated/l10n.dart' as lang;

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFE5E5E5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () {
                const Home().launch(context, isNewTask: true);
              },
              child: Text(
                lang.S.of(context).skipText,
                style: kTextStyle,
              ),
            ),
          ],
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image(image: AssetImage(HardcodedImages.appLogo)),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    lang.S.of(context).authScreenWelcomeText,
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    lang.S.of(context).storeName,
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(
                        color: secondaryColor1,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    lang.S.of(context).authScreenSubTitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                      textStyle: const TextStyle(
                        color: textColors,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Button1(
                    buttonColor: primaryColor,
                    buttonText: lang.S.of(context).registerButtonText,
                    onPressFunction: () {
                      const SignUp().launch(
                        context,
                        //pageRouteAnimation: PageRouteAnimation.Fade,
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  ButtonType2(
                    buttonColor: primaryColor,
                    buttonText: lang.S.of(context).signInButtonText,
                    onPressFunction: () {
                      const LogInScreen().launch(
                        context,
                        //pageRouteAnimation: PageRouteAnimation.Fade,
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
