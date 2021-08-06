import 'package:animation_2/constants.dart';
import 'package:animation_2/models/Product.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';
import 'components/product_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Color(0xFFEAEAEA),
          child: Column(
            children: [
              HomeHeader(),
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(defaultPadding * 1.5),
                      bottomRight: Radius.circular(defaultPadding * 1.5),
                    ),
                  ),
                  child: GridView.builder(
                    itemCount: demo_products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: defaultPadding,
                      crossAxisSpacing: defaultPadding,
                    ),
                    itemBuilder: (context, index) => ProductCard(
                      product: demo_products[index],
                      press: () {},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: cartBarHeight,
              )
            ],
          ),
        ),
      ),
    );
  }
}
