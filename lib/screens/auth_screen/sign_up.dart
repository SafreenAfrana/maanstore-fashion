import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:maanstore/api_service/api_service.dart';
import 'package:maanstore/const/constants.dart';
import 'package:maanstore/const/hardcoded_text.dart';
import 'package:maanstore/models/customer.dart';
import 'package:maanstore/widgets/add_new_address.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
import '../../widgets/buttons.dart';
import '../../widgets/social_media_button.dart';
import 'log_in_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  late APIService apiService;
  CustomerModel model = CustomerModel(email: '', userName: '', password: '');
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;

  @override
  initState() {
    apiService = APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              finish(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                    width: 1,
                    color: textColors,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage(HardcodedImages.appLogo)),
                const SizedBox(height: 20),
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
                    children: <Widget>[
                      Form(
                        key: globalKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText: lang.S.of(context).textFieldUserNameLabelText,
                                hintText:lang.S.of(context).textFieldUserNameHintText,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return lang.S.of(context).textFieldUserNameValidatorText1;
                                } else if (value.length < 4) {
                                  return lang.S.of(context).textFieldUserNameValidatorText2;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                model.userName = value!;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText:lang.S.of(context).textFieldEmailLabelText,
                                hintText:lang.S.of(context).textFieldEmailHintText,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return lang.S.of(context).textFieldEmailValidatorText1;
                                } else if (!value.contains('@')) {
                                  return lang.S.of(context).textFieldEmailValidatorText2;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                model.email = value!;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              obscureText: hidePassword,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                labelText:
                                lang.S.of(context).textFieldPassLabelText,
                                hintText:
                                lang.S.of(context).textFieldPassHintText,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  icon: Icon(hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return lang.S.of(context).textFieldPassValidatorText1;
                                } else if (value.length < 4) {
                                  return lang.S.of(context).textFieldPassValidatorText2;
                                }
                                return null;
                              },
                              onSaved: (value) {
                                model.password = value!;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Button1(
                          buttonText: lang.S.of(context).registerButtonText,
                          buttonColor: primaryColor,
                          onPressFunction: () async {
                            if (validateAndSave()) {
                              EasyLoading.show(
                                  status:lang.S.of(context).easyLoadingRegister);

                              apiService.createCustomer(model).then((ret) {
                                globalKey.currentState?.reset();

                                if (ret) {
                                  EasyLoading.showSuccess(
                                      lang.S.of(context).easyLoadingSuccess);

                                  const AddNewAddress().launch(context);
                                } else {
                                  EasyLoading.showError(lang.S.of(context).easyLoadingError);
                                }
                              });
                            }
                          }),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyGoogleText(
                            fontSize: 16,
                            fontColor: textColors,
                            text: lang.S.of(context).alreadyAccount,
                            fontWeight: FontWeight.w500,
                          ),
                          TextButton(
                            onPressed: () {
                              const LogInScreen().launch(
                                context,
                                //pageRouteAnimation: PageRouteAnimation.Fade,
                              );
                            },
                            child: MyGoogleText(
                              text: lang.S.of(context).signInButtonText,
                              fontSize: 16,
                              fontColor: secondaryColor1,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      const SocialMediaButtons().visible(false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
