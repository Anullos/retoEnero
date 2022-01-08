import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reto_enero/domain/models/product_model.dart';
import 'package:reto_enero/utils/delayed_display.dart';

class ItemProduct extends StatefulWidget {
  const ItemProduct({
    Key? key,
    required this.product,
    required this.duration,
    required this.index,
  }) : super(key: key);
  final ProductModel product;
  final Duration duration;
  final int index;

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct>
    with SingleTickerProviderStateMixin {
  late AnimationController _itemsController;
  late Animation<double> _itemsAnimation;

  @override
  void initState() {
    _itemsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _itemsAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _itemsController,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
    _itemsController.forward();
  }

  @override
  void dispose() {
    _itemsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          AnimatedBuilder(
              animation: _itemsAnimation,
              builder: (context, child) {
                var value = lerpDouble(0, 0.5, _itemsAnimation.value);
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY((-value! * pi)),
                  child: Container(
                    height: 220,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20,
                          left: 0,
                          right: 0,
                          child: Image.asset(
                            widget.product.urlPicture,
                            fit: BoxFit.fitHeight,
                            height: 140,
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade100,
                            child: const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          const SizedBox(height: 8),
          DelayedDisplay(
            delay: widget.duration,
            child: Text(
              widget.product.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          DelayedDisplay(
            delay: widget.duration,
            child: Text(
              '${widget.product.price.toString()} USD',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
