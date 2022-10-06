import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:vinokhatek/constants.dart';

import 'package:vinokhatek/size_config.dart';

import '../../../models/services/common_data_provider.dart';

class LocationDetails extends StatelessWidget {
  LocationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.location_on_outlined),
              SizedBox(width: getProportionateScreenWidth(10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Provider.of<CommonDataProvider>(context, listen: false)
                          .placemarks
                          ?.first
                          ?.street ??
                      ''),
                  Text(Provider.of<CommonDataProvider>(context, listen: false)
                          .placemarks
                          ?.first
                          ?.locality ??
                      'Network not available'),
                  Text(Provider.of<CommonDataProvider>(context, listen: false)
                          .placemarks
                          ?.first
                          ?.country ??
                      '')
                ],
              ),
              Spacer(),
              Provider.of<CommonDataProvider>(context, listen: false)
                          .placemarks
                          ?.first
                          ?.postalCode !=
                      null
                  ? Expanded(
                      child: Card(
                        color: kPrimaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Delivery available to ${Provider.of<CommonDataProvider>(context, listen: false).placemarks?.first?.postalCode}',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
