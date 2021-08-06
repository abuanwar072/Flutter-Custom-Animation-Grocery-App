import 'package:animation_2/components/price.dart';
import 'package:animation_2/models/ProductItem.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../home_bloc.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final HomeBLoC bloc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cart",
            style: Theme.of(context).textTheme.headline6,
          ),
          ...List.generate(
            bloc.cart.length,
            (index) => CartDetailsViewCard(productItem: bloc.cart[index]),
          ),
          const SizedBox(height: defaultPadding),
          if (bloc.cart.isNotEmpty)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Next - \$60"),
              ),
            )
        ],
      ),
    );
  }
}

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
