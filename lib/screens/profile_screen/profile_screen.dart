import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:maanstore/api_service/api_service.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
import 'package:maanstore/screens/auth_screen/change_pass_screen.dart';
import 'package:maanstore/screens/notification_screen/notificition_screen.dart';
import 'package:maanstore/screens/order_screen/my_order.dart';
import 'package:maanstore/screens/order_screen/payment_method_screen.dart';
import 'package:maanstore/screens/search_product_screen.dart';
import 'package:maanstore/screens/splash_screen/splash_screen_one.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Providers/all_repo_providers.dart';
import '../../const/constants.dart';
import '../../widgets/profile_shimmer_widget.dart';
import '../home_screens/home.dart';
import '../language_screen.dart';
import 'my_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  APIService? apiService;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void getCustomerData(String name, String url) async {
    SharedPreferences preferences = await _prefs;
    preferences.setString('name', name);
    preferences.setString('url', url);
  }

  @override
  initState() {
    apiService = APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, __) {
      final customerDetails = ref.watch(getCustomerDetails);
      return Directionality(
        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
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
            title: Text(
              lang.S.of(context).profileScreenName,
              style: kTextStyle.copyWith(color: Colors.black, fontSize: 20.0),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: secondaryColor3,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      const SearchProductScreen().launch(context);
                    },
                    icon: const Icon(
                      FeatherIcons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: secondaryColor3,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // const NotificationsScreen().launch(context);
                    },
                    icon: const Icon(
                      FeatherIcons.bell,
                      color: Colors.black,
                    ),
                  ),
                ),
              ).visible(false),
            ],
          ),
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: customerDetails.when(data: (snapShot) {
              String name = snapShot.firstName.toString() + snapShot.lastName.toString();
              getCustomerData(name, snapShot.avatarUrl.toString());
              return Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 30, top: 30, bottom: 20),
                    width: context.width(),
                    height: context.height(),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(50)),
                                image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage(snapShot.avatarUrl.toString()),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyGoogleText(text: '${snapShot.firstName} ${snapShot.lastName}', fontSize: 24, fontColor: Colors.black, fontWeight: FontWeight.normal),
                                  const SizedBox(height: 8),
                                  MyGoogleText(text: snapShot.email.toString(), fontSize: 14, fontColor: textColors, fontWeight: FontWeight.normal),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        ///_____My_profile_____________________________
                        Container(
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: secondaryColor3))),
                          child: ListTile(
                            onTap: () {
                              MyProfileScreen(
                                retrieveCustomer: snapShot,
                              ).launch(context);
                            },
                            shape: const Border(bottom: BorderSide(width: 1, color: textColors)),
                            leading: const Icon(IconlyLight.profile),
                            title: MyGoogleText(text: lang.S.of(context).myProfile, fontSize: 16, fontColor: Colors.black, fontWeight: FontWeight.normal),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ),
                        ),

                        ///_____Change_password_____________________________
                        Container(
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: secondaryColor3))),
                          child: ListTile(
                            onTap: () {
                              const ChangePassScreen().launch(context);
                            },
                            shape: const Border(bottom: BorderSide(width: 1, color: textColors)),
                            leading: const Icon(IconlyLight.password),
                            title: const MyGoogleText(text: 'Change Password', fontSize: 16, fontColor: Colors.black, fontWeight: FontWeight.normal),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ),
                        ).visible(false),

                        ///_____My_Order____________________________
                        Container(
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: secondaryColor3))),
                          child: ListTile(
                            onTap: () {
                              const MyOrderScreen().launch(context);
                            },
                            shape: const Border(bottom: BorderSide(width: 1, color: textColors)),
                            leading: const Icon(IconlyLight.document),
                            title: MyGoogleText(text: lang.S.of(context).myOrderScreenName, fontSize: 16, fontColor: Colors.black, fontWeight: FontWeight.normal),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ),
                        ),

                        ///__________payment_method______________________-
                        Container(
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: secondaryColor3))),
                          child: ListTile(
                            onTap: () {
                              const PaymentMethodScreen().launch(context);
                            },
                            shape: const Border(bottom: BorderSide(width: 1, color: textColors)),
                            leading: const Icon(IconlyLight.wallet),
                            title: const MyGoogleText(text: 'Payment Method', fontSize: 16, fontColor: Colors.black, fontWeight: FontWeight.normal),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ),
                        ).visible(false),

                        ///_________Notification___________________________
                        Container(
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: secondaryColor3))),
                          child: ListTile(
                            onTap: () {
                              const NotificationsScreen().launch(context);
                            },
                            shape: const Border(bottom: BorderSide(width: 1, color: textColors)),
                            leading: const Icon(IconlyLight.notification),
                            title: const MyGoogleText(text: 'Notification', fontSize: 16, fontColor: Colors.black, fontWeight: FontWeight.normal),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ),
                        ).visible(false),

                        ///_____________Language________________________
                        Container(
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: secondaryColor3))),
                          child: ListTile(
                            onTap: () {
                              const LanguageScreen().launch(context);
                            },
                            shape: const Border(bottom: BorderSide(width: 1, color: textColors)),
                            leading: const Icon(IconlyLight.location),
                            title: MyGoogleText(text: lang.S.of(context).language, fontSize: 16, fontColor: Colors.black, fontWeight: FontWeight.normal),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ),
                        ),

                        ///___________________Help___________________________
                        Container(
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: secondaryColor3))),
                          child: const ListTile(
                            onTap: null,
                            shape: Border(bottom: BorderSide(width: 1, color: textColors)),
                            leading: Icon(IconlyLight.danger),
                            title: MyGoogleText(text: 'Help & Info', fontSize: 16, fontColor: Colors.black, fontWeight: FontWeight.normal),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ),
                        ).visible(false),

                        ///______________SignOut_________________________
                        Container(
                          decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: secondaryColor3))),
                          child: ListTile(
                            onTap: () async {
                              final prefs = await SharedPreferences.getInstance();
                              await prefs.remove('customerId');
                              if (!mounted) return;
                              const SplashScreenOne().launch(context, isNewTask: true);
                            },
                            shape: const Border(bottom: BorderSide(width: 1, color: textColors)),
                            leading: const Icon(IconlyLight.logout),
                            title: MyGoogleText(text: lang.S.of(context).signOut, fontSize: 16, fontColor: Colors.black, fontWeight: FontWeight.normal),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }, error: (e, stack) {
              return Text(e.toString());
            }, loading: () {
              return const ProfileShimmerWidget();
            }),
          ),
        ),
      );
    });
  }
}
