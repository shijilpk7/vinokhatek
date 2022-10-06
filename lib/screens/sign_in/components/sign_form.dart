import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:vinokhatek/components/custom_surfix_icon.dart';
import 'package:vinokhatek/components/form_error.dart';
import 'package:vinokhatek/helper/keyboard.dart';
import 'package:vinokhatek/models/services/location_services.dart';
import 'package:vinokhatek/screens/forgot_password/forgot_password_screen.dart';
import 'package:vinokhatek/screens/home/home_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../models/services/common_data_provider.dart';
import '../../../size_config.dart';
import 'package:geolocator/geolocator.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];
  Position? currentLocation;
  CommonDataProvider? _commonDataProvider;

  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  _getLocation() async {
    currentLocation = await LocationService.getLocation();
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLocation!.latitude, currentLocation!.longitude);
    Provider.of<CommonDataProvider>(context, listen: false)
        .addPlacemark(placemarks);
    if (currentLocation == null) {
      return;
    }
  }

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _commonDataProvider = Provider.of<CommonDataProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: _commonDataProvider?.isRemember ?? false,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  _commonDataProvider?.isremember();
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_commonDataProvider?.emailID == 'admin@gmail.com') {
                _commonDataProvider?.adminCheck(true);
              }else{
                 _commonDataProvider?.adminCheck(false);
              }
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          _commonDataProvider?.addpassword(value);
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          _commonDataProvider?.addEmailID(value);
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
