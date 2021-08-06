import 'package:animation_2/components/fav_btn.dart';
import 'package:animation_2/components/price.dart';
import 'package:animation_2/constants.dart';
import 'package:animation_2/models/Product.dart';
import 'package:flutter/material.dart';

import 'components/cart_counter.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: Color(0xFFF8F8F8),
                  child: Image.asset(widget.product.image!),
                ),
                Positioned(
                  bottom: -20,
                  child: CartCounter(),
                )
              ],
            ),
          ),
          SizedBox(height: defaultPadding * 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.product.title!,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Price(amount: "20.00"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "Cabbage (comprising several cultivars of Brassica oleracea) is a leafy green, red (purple), or white (pale green) biennial plant grown as an annual vegetable crop for its dense-leaved heads. It is descended from the wild cabbage (B. oleracea var. oleracea), and belongs to the cole crops or brassicas, meaning it is closely related to broccoli and cauliflower (var. botrytis); Brussels sprouts (var. gemmifera); and Savoy cabbage (var. sabauda).",
              style: TextStyle(
                color: Color(0xFFBDBDBD),
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: BackButton(
        color: Colors.black,
      ),
      backgroundColor: Color(0xFFF8F8F8),
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Fruits",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        FavBtn(radius: 20),
        SizedBox(width: defaultPadding),
      ],
    );
  }
}
