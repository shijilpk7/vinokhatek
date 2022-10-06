import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinokhatek/models/Cart.dart';

import '../../models/services/common_data_provider.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CommonDataProvider? _commonDataProvider;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _commonDataProvider = Provider.of<CommonDataProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${_commonDataProvider!.addedGarments?.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
