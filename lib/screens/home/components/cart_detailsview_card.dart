import 'package:animation_2/components/price.dart';
import 'package:animation_2/models/ProductItem.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CartDetailsViewCard extends StatelessWidget {
  const CartDetailsViewCard({
    Key? key,
    required this.productItem,
  }) : super(key: key);

  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(productItem.product!.image!),
      ),
      title: Text(
        productItem.product!.title!,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            Price(amount: "20"),
            Text(
              "  x ${productItem.quantity}",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
