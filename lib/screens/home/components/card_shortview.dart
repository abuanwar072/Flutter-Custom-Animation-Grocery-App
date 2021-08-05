import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../home_bloc.dart';

class CartShortView extends StatelessWidget {
  const CartShortView({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final HomeBLoC bloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Cart",
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(width: defaultPadding),
        ...List.generate(
          bloc.cart.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: defaultPadding / 2),
            child: Hero(
              tag: bloc.cart[index].product!.title! + '_cart',
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(
                  bloc.cart[index].product!.image!,
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            bloc.totalCartElements().toString(),
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
