import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final Duration letterExpandingDuration;
  final Duration durationBetweenLetters;
  final TextStyle textStyle;
  const AnimatedText({
    Key? key,
    required this.text,
    required this.letterExpandingDuration,
    required this.durationBetweenLetters,
    required this.textStyle,
  }) : super(key: key);

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  final List<Widget> _listLetters = [];
  Timer? _timer;
  int? totalTextLength;
  List<Widget> rowWidgets = [];
  AnimationController? animationController;

  @override
  void initState() {
    totalTextLength = widget.text.length;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    for (String s in widget.text.split('')) {
      _listLetters.add(
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 6, end: widget.textStyle.fontSize),
          duration: widget.letterExpandingDuration,
          curve: Curves.easeInOut,
          builder: (BuildContext context, double size, Widget? child) {
            return Text(
              s,
              style: TextStyle(
                  fontSize: size,
                  color: widget.textStyle.color,
                  fontWeight: widget.textStyle.fontWeight,
                  fontFamily: widget.textStyle.fontFamily),
            );
          },
        ),
      );
    }

    _timer = Timer.periodic(widget.durationBetweenLetters, (Timer t) {
      if (_timer!.tick <= totalTextLength!) {
        setState(() {
          // just build again. Compulsory.
        });
      } else {
        _timer?.cancel();
      }
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.end,
      children: _getRowItems(),
    );
  }

  _getRowItems() {
    if (_timer!.tick <= totalTextLength!) {
      rowWidgets.clear();
      for (var i = 0; i < _timer!.tick; i++) {
        rowWidgets.add(_listLetters[i]);
      }
    }
    return rowWidgets;
  }
}
