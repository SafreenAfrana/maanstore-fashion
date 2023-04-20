
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:maanstore/generated/l10n.dart' as lang;
import 'package:nb_utils/nb_utils.dart';

import '../../api_service/api_service.dart';
import '../../const/constants.dart';
import '../../models/retrieve_customer.dart';
import '../../widgets/buttons.dart';
import 'check_out_screen.dart';

class AddNewAddressTwo extends StatefulWidget {
  const AddNewAddressTwo({Key? key, this.initShipping, this.initBilling}) : super(key: key);
  final Shipping? initShipping;
  final Billing? initBilling;

  @override
  State<AddNewAddressTwo> createState() => _AddNewAddressTwoState();
}

class _AddNewAddressTwoState extends State<AddNewAddressTwo> {
  late APIService apiService;
  RetrieveCustomer retrieveCustomer = RetrieveCustomer();
  Shipping shipping = Shipping();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool addressSwitch = false;

  @override
  void initState() {
    apiService = APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyGoogleText(
                          text: lang.S.of(context).addNewAddressScreenName,
                          fontSize: 20,
                          fontColor: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        // IconButton(
                        //   onPressed: () {
                        //     Navigator.of(context).pop();
                        //   },
                        //   icon: const Icon(Icons.close),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Form(
                      key: globalKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: lang.S.of(context).fastNameTextFieldLabel,
                              hintText: lang.S.of(context).fastNameTextFieldHint,
                            ),
                            initialValue: widget.initShipping?.firstName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return lang.S.of(context).fastNameTextFieldValidator;
                              } else if (value.length < 2) {
                                return lang.S.of(context).fastNameTextFieldValidator;
                              }
                              return null;
                            },
                            onSaved: (value) {
                              shipping.firstName = value!;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: lang.S.of(context).lastNameTextFieldLabel,
                              hintText: lang.S.of(context).lastNameTextFieldHint,
                            ),
                            initialValue: widget.initShipping?.lastName,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return lang.S.of(context).lastNameTextFieldValidator;
                              } else if (value.length < 2) {
                                return lang.S.of(context).lastNameTextFieldValidator;
                              }
                              return null;
                            },
                            onSaved: (value) {
                              shipping.lastName = value!;
                            },
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                width: 1,
                                color: textColors,
                              ),
                            ),
                            // child: CountryCodePicker(
                            //   onInit: (value) {
                            //     shipping.country = value?.code.toString();
                            //   },
                            //
                            //   onChanged: (value) {
                            //     shipping.country = value.code.toString();
                            //   },
                            //   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            //   initialSelection: 'BD',
                            //   favorite: const ['+880', 'BD'],
                            //   // optional. Shows only country name and flag
                            //   showCountryOnly: true,
                            //   // optional. Shows only country name and flag when popup is closed.
                            //   showOnlyCountryWhenClosed: true,
                            //   // optional. aligns the flag and the Text left
                            //   alignLeft: false,
                            // ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: lang.S.of(context).strAddress1Text,
                              hintText: lang.S.of(context).strAddress1TextHint,
                            ),
                            initialValue: widget.initShipping?.address1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return lang.S.of(context).strAddress1TextValid;
                              }
                              return null;
                            },
                            onSaved: (value) {
                              shipping.address1 = value!;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: lang.S.of(context).strAddress2Text,
                              hintText: lang.S.of(context).strAddress1TextHint,
                            ),
                            initialValue: widget.initShipping?.address2,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return lang.S.of(context).strAddress1TextValid;
                              }
                              return null;
                            },
                            onSaved: (value) {
                              shipping.address2 = value!;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: lang.S.of(context).cityTown,
                              hintText: lang.S.of(context).cityTownHint,
                            ),
                            initialValue: widget.initShipping?.city,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return lang.S.of(context).cityTownValid;
                              }
                              return null;
                            },
                            onSaved: (value) {
                              shipping.city = value!;
                            },
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: lang.S.of(context).postcode,
                                    hintText: lang.S.of(context).postcodeHint,
                                  ),
                                  initialValue: widget.initShipping?.postcode,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return lang.S.of(context).postcodeValid;
                                    } else if (value.length < 4) {
                                      return lang.S.of(context).postcodeValid;
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    shipping.postcode = value!;
                                  },
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: lang.S.of(context).state,
                                    hintText: lang.S.of(context).stateHint,
                                  ),
                                  initialValue: widget.initShipping?.state,
                                  validator: (value) {
                                    return null;
                                  },
                                  onSaved: (value) {
                                    shipping.state = value!;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: lang.S.of(context).textFieldPhoneLabel,
                              hintText: lang.S.of(context).textFieldPhoneHint,
                            ),
                            initialValue: widget.initBilling?.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return lang.S.of(context).textFieldPhoneValidator;
                              }
                              return null;
                            },
                            onSaved: (value) {
                              shipping.phone = value.toString();
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Button1(
                        buttonText: lang.S.of(context).saveButton,
                        buttonColor: primaryColor,
                        onPressFunction: () {
                          if (validateAndSave()) {
                            EasyLoading.show(
                              status: lang.S.of(context).updateHint,
                            );
                            retrieveCustomer.billing = Billing(
                              firstName: shipping.firstName ?? '',
                              lastName: shipping.lastName ?? '',
                              company: ' ',
                              address1: shipping.address1 ?? '',
                              address2: shipping.address2 ?? '',
                              city: shipping.city ?? '',
                              postcode: shipping.postcode ?? '',
                              country: shipping.country ?? '',
                              phone: shipping.phone ?? '',
                              email: ' ',
                              state: shipping.state ?? '',
                            );

                            retrieveCustomer.shipping = Shipping(
                              firstName: shipping.firstName ?? '',
                              lastName: shipping.lastName ?? '',
                              company: ' ',
                              address1: shipping.address1 ?? '',
                              address2: shipping.address2 ?? '',
                              city: shipping.city ?? '',
                              postcode: shipping.postcode ?? '',
                              country: shipping.country ?? '',
                              state: shipping.state ?? '',
                            );
                            apiService.updateShippingAddress(retrieveCustomer).then((ret) {
                              if (ret) {
                                const CheckOutScreen().launch(context, isNewTask: true);
                                EasyLoading.showSuccess(lang.S.of(context).easyLoadingSuccess);
                              } else {
                                EasyLoading.showError(lang.S.of(context).easyLoadingError);
                              }
                            });
                          }
                        }),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateAndSave() {
    FormState form = globalKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
