import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vinokhatek/models/Cart.dart';

import '../../../models/services/common_data_provider.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
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
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: _commonDataProvider!.addedGarments?.length ?? 0,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: _commonDataProvider!.addedGarments != null ||
                  _commonDataProvider!.addedGarments!
                      .contains(demoCarts[index].product.id)
              ? Dismissible(
                  key: Key(demoCarts[index].product.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    _commonDataProvider
                        ?.removeSelectedGarments(demoCarts[index].product.id);
                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: CartCard(cart: demoCarts[index]),
                )
              : SizedBox(),
        ),
      ),
    );
  }
}
