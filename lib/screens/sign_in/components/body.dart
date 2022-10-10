import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinokhatek/components/no_account_text.dart';
import 'package:vinokhatek/components/socal_card.dart';
import 'package:vinokhatek/constants.dart';
import 'package:vinokhatek/models/services/common_data_provider.dart';
import 'package:vinokhatek/models/services/firebase_services.dart';
import '../../../size_config.dart';
import '../../home/home_screen.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text('or'),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {
                        Provider.of<CommonDataProvider>(context, listen: false)
                            .adminCheck(false);
                        //google login
                        Provider.of<GoogleSignInProvider>(context,
                                listen: false)
                            .googleLogin()
                            .then((value) {
                          print(value);
                          if (value) {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                          } else {
                            showDialog(
                                // barrierDismissible: false,
                                context: context,
                                builder: (_) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Center(
                                                  child: Text(
                                                      'Something went wrong, Please try again')),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          right: -10,
                                          top: -10,
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                  ),
                                                  child: Center(
                                                      child: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 18,
                                                  ))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }
                        });
                      },
                    ),
                    // SocalCard(
                    //   icon: "assets/icons/facebook-2.svg",
                    //   press: () {},
                    // ),
                    // SocalCard(
                    //   icon: "assets/icons/twitter.svg",
                    //   press: () {},
                    // ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
