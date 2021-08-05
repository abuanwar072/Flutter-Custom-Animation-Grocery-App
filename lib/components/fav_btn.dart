import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavBtn extends StatelessWidget {
  const FavBtn({
    Key? key,
    this.radius = 12,
  }) : super(key: key);

  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Color(0xFFE3E2E3),
      child: SvgPicture.asset("assets/icons/heart.svg"),
    );
  }
}
