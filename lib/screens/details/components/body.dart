import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinokhatek/components/default_button.dart';
import 'package:vinokhatek/models/Product.dart';
import 'package:vinokhatek/size_config.dart';

import '../../../models/services/common_data_provider.dart';
import '../../cart/cart_screen.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

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
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: widget.product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: _commonDataProvider!.addedGarments == null
                              ? "Add To Cart"
                              : _commonDataProvider!.addedGarments!
                                      .contains(widget.product.id)
                                  ? 'Go to Cart'
                                  : "Add To Cart",
                          press: _commonDataProvider!.addedGarments == null
                              ? () { _commonDataProvider!.addSelectedGarments(
                                          widget.product.id);

                              }
                              : _commonDataProvider!.addedGarments!
                                      .contains(widget.product.id)
                                  ? () {
                                     
                                      Navigator.pushNamed(
                                          context, CartScreen.routeName);
                                    }
                                  : () { _commonDataProvider!.addSelectedGarments(
                                          widget.product.id);},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
