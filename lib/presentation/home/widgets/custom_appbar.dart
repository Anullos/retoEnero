import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.animationIconController,
    required this.onTap,
  }) : super(key: key);
  final AnimationController animationIconController;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onTap,
              child: AnimatedIcon(
                icon: AnimatedIcons.menu_close,
                progress: animationIconController,
              ),
            ),
            Row(
              children: const [
                Text(
                  'ALL PRODUCTS',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.black,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.shade900,
              ),
              child: IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: const Icon(Icons.search),
                splashRadius: 28,
              ),
            )
          ],
        ),
      ),
    );
  }
}
