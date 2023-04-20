import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:maanstore/const/constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../Providers/language_change_provider.dart';
import '../generated/l10n.dart' as lang;
import '../widgets/buttons.dart';
import 'home_screens/home.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  Future<void> saveData(bool data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRtl', data);
  }

  List<String> languageList = [
    'English',
    'Hindi',
    'Arabic',
    'Chinese',
    'Spanish',
    'French',
    'Japanese',
    'Romanian',
    'Turkish',
    'Italian',
    'German',
  ];
  String isSelected = 'English';

  List<String> baseFlagsCode = [
    'us',
    'in',
    'sa',
    'cn',
    'es',
    'fr',
    'jp',
    'ro',
    'tr',
    'it',
    'de',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 10),
          child: Button1(
            buttonColor: primaryColor,
            buttonText: lang.S.of(context).saveButton,
            onPressFunction: () {
              saveData(!isRtl && isRtl);
              const Home().launch(context, isNewTask: true);
            },
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              const Home().launch(context, isNewTask: true);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: MyGoogleText(
            text: lang.S.of(context).language,
            fontColor: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: languageList.length,
                  itemBuilder: (_, i) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          isSelected = languageList[i];
                          isSelected == 'Hindi'
                              ? context.read<LanguageChangeProvider>().changeLocale("hi")
                              : isSelected == 'Arabic'
                                  ? context.read<LanguageChangeProvider>().changeLocale("ar")
                                  : isSelected == 'Chinese'
                                      ? context.read<LanguageChangeProvider>().changeLocale("zh")
                                      : isSelected == 'Spanish'
                                          ? context.read<LanguageChangeProvider>().changeLocale("es")
                                          : isSelected == 'French'
                                              ? context.read<LanguageChangeProvider>().changeLocale("fr")
                                              : isSelected == 'Japanese'
                                                  ? context.read<LanguageChangeProvider>().changeLocale("ja")
                                                  : isSelected == 'Romanian'
                                                      ? context.read<LanguageChangeProvider>().changeLocale("ro")
                                                      : isSelected == 'Turkish'
                                                          ? context.read<LanguageChangeProvider>().changeLocale("tr")
                                                          : isSelected == 'Italian'
                                                              ? context.read<LanguageChangeProvider>().changeLocale("it")
                                                              : isSelected == 'German'
                                                                  ? context.read<LanguageChangeProvider>().changeLocale("de")
                                                                  : context.read<LanguageChangeProvider>().changeLocale("en");

                          isSelected == 'Arabic' ? isRtl = true : isRtl = false;
                        });
                      },
                      title: Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 25,
                            child: Flag.fromString(
                              baseFlagsCode[i],
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Text(
                            languageList[i],
                          ),
                        ],
                      ),
                      trailing: isSelected == languageList[i]
                          ? const Icon(
                              Icons.check_circle,
                              color: primaryColor,
                            )
                          : const Icon(
                              Icons.circle_outlined,
                            ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
