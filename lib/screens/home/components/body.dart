import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinokhatek/models/services/common_data_provider.dart';
import 'package:vinokhatek/screens/home/components/location_details.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CommonDataProvider? _commonDataProvider;
    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _commonDataProvider = Provider.of<CommonDataProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            
            SizedBox(height: getProportionateScreenWidth(10)),
            _commonDataProvider!.isAdmin!
                ? Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text('Logged in as Admin',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 20),),
                    ),
                  ],
                )
                :SizedBox(), SizedBox(height: getProportionateScreenHeight(10)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
            LocationDetails(),
            SizedBox(height: getProportionateScreenWidth(10)),
            DiscountBanner(),
            // Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}