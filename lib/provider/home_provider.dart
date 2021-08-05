import 'package:animation_2/screens/home/home_bloc.dart';
import 'package:flutter/material.dart';

class HomeProvider extends InheritedWidget {
  final HomeBLoC homeBLoC;
  final Widget child;

  HomeProvider({required this.homeBLoC, required this.child})
      : super(child: child);

  static HomeProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HomeProvider>();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
