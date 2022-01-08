import 'package:flutter/material.dart';
import 'package:reto_enero/presentation/home/widgets/custom_appbar.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({
    Key? key,
    required this.animationIconController,
    required this.onDrawerTap,
    required this.titlePage,
  }) : super(key: key);
  final AnimationController animationIconController;
  final VoidCallback onDrawerTap;
  final String titlePage;

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
        Text(
          titlePage,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 26,
            color: Color(0xFFFB3F01),
          ),
        ),
      ],
    );
  }
}
