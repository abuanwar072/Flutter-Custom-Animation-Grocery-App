import 'package:animation_2/constants.dart';
import 'package:animation_2/models/Product.dart';
import 'package:animation_2/screens/deatils/details_screen.dart';
import 'package:animation_2/screens/home/home_bloc.dart';
import 'package:flutter/material.dart';

import 'components/card_shortview.dart';
import 'components/cart_detailsview.dart';
import 'components/header.dart';
import 'components/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bloc = HomeBLoC();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -7.0) {
      bloc.changeToCart();
    } else if (details.primaryDelta! > 12) {
      bloc.changeToNormal();
    }
  }

  double _getTopForWhitePanel(HomeState state, double maxHeight) {
    if (state == HomeState.normal)
      return headerHeight;
    else if (state == HomeState.cart)
      return -(maxHeight - cartBarHeight * 2 - headerHeight);
    return 0;
  }

  double _getTopForCartPanel(HomeState state, double maxHeight) {
    if (state == HomeState.normal)
      return cartBarHeight;
    else if (state == HomeState.cart) return maxHeight - cartBarHeight;
    return 0;
  }

  double _headerPosition(HomeState state) {
    if (state == HomeState.normal)
      return 0;
    else if (state == HomeState.cart) return -headerHeight;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: bloc,
        builder: (context, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              bottom: false,
              child: Container(
                color: Color(0xFFEAEAEA),
                child: Column(
                  children: [
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, BoxConstraints constraints) {
                          return Stack(
                            children: [
                              // Cart
                              AnimatedPositioned(
                                duration: panelTransition,
                                curve: Curves.decelerate,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                height: _getTopForCartPanel(
                                    bloc.homeState, constraints.maxHeight),
                                child: GestureDetector(
                                  onVerticalDragUpdate: _onVerticalGesture,
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    color: Color(0xFFEAEAEA),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(defaultPadding),
                                      child: AnimatedSwitcher(
                                        duration: panelTransition,
                                        child:
                                            bloc.homeState == HomeState.normal
                                                ? CartShortView(bloc: bloc)
                                                : CartDetailsView(bloc: bloc),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: panelTransition,
                                curve: Curves.decelerate,
                                top: _getTopForWhitePanel(
                                    bloc.homeState, constraints.maxHeight),
                                left: 0,
                                right: 0,
                                height: constraints.maxHeight -
                                    cartBarHeight -
                                    headerHeight,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: defaultPadding),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft:
                                          Radius.circular(defaultPadding * 1.5),
                                      bottomRight:
                                          Radius.circular(defaultPadding * 1.5),
                                    ),
                                  ),
                                  child: GridView.builder(
                                    itemCount: demo_products.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.75,
                                      mainAxisSpacing: defaultPadding,
                                      crossAxisSpacing: defaultPadding,
                                    ),
                                    itemBuilder: (context, index) =>
                                        ProductCard(
                                      product: demo_products[index],
                                      press: () {
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            transitionDuration: const Duration(
                                                milliseconds: 500),
                                            reverseTransitionDuration:
                                                const Duration(
                                                    milliseconds: 600),
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                FadeTransition(
                                              opacity: animation,
                                              child: DetailsScreen(
                                                product: demo_products[index],
                                                onProductAdd: () {
                                                  bloc.addProductToCart(
                                                      demo_products[index]);
                                                },
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: panelTransition,
                                top: _headerPosition(bloc.homeState),
                                left: 0,
                                right: 0,
                                child: HomeHeader(),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
