import 'package:flutter/material.dart';
import 'package:reto_enero/data/products_data.dart';
import 'package:reto_enero/presentation/home/perfume/item_product.dart';
import 'package:reto_enero/presentation/home/widgets/custom_appbar.dart';

class PerfumePage extends StatelessWidget {
  const PerfumePage({
    Key? key,
    required this.animationIconController,
    required this.onDrawerTap,
    required this.isReady,
  }) : super(key: key);
  final AnimationController animationIconController;
  final VoidCallback onDrawerTap;
  final bool isReady;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomAppBar(
          animationIconController: animationIconController,
          onTap: onDrawerTap,
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: isReady,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return FutureBuilder(
                      future:
                          Future.delayed(Duration(milliseconds: 300 * index)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ItemProduct(
                            product: product,
                            duration: Duration(milliseconds: index * 300),
                            index: index,
                          );
                        } else {
                          return Container();
                        }
                      });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
