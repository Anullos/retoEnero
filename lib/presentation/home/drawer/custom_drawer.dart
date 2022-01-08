import 'package:flutter/material.dart';
import 'package:reto_enero/utils/animted_text.dart';
import 'package:reto_enero/utils/delayed_display.dart';

class CustomDrawerReto extends StatelessWidget {
  const CustomDrawerReto({
    Key? key,
    required this.tweenStart,
    required this.tweenOpen,
    required this.isOpen,
    required this.heightTopSelected,
    required this.heightDownSelected,
    required this.onTapText1,
    required this.isSelected1,
    required this.onTapText2,
    required this.isSelected2,
    required this.onTapText3,
    required this.isSelected3,
    required this.onTapText4,
    required this.isSelected4,
    required this.onTapText5,
    required this.isSelected5,
  }) : super(key: key);
  final Animation<double> tweenStart;
  final Animation<double> tweenOpen;
  final bool isOpen;
  final VoidCallback onTapText1;
  final VoidCallback onTapText2;
  final VoidCallback onTapText3;
  final VoidCallback onTapText4;
  final VoidCallback onTapText5;
  final bool isSelected1;
  final bool isSelected2;
  final bool isSelected3;
  final bool isSelected4;
  final bool isSelected5;
  final double heightTopSelected;
  final double heightDownSelected;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: AnimatedBuilder(
              animation: tweenOpen,
              builder: (context, child) {
                return Container(
                  height:
                      (size.height * heightTopSelected + 15) * tweenOpen.value,
                  width: size.width,
                  color: Colors.blue.shade900,
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedBuilder(
              animation: tweenOpen,
              builder: (context, child) {
                return Container(
                  height:
                      (size.height * heightDownSelected - 15) * tweenOpen.value,
                  width: size.width,
                  color: Colors.blue.shade900,
                );
              },
            ),
          ),
          isOpen
              ? Positioned(
                  top: size.height * 0.25,
                  left: 24,
                  child: SizedBox(
                    height: 30,
                    child: InkWell(
                      onTap: onTapText1,
                      child: DelayedDisplay(
                        delay: const Duration(milliseconds: 100),
                        fadingDuration: const Duration(milliseconds: 200),
                        child: AnimatedText(
                          text: '- WRIST WATCH',
                          textStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: isSelected1
                                ? Colors.white
                                : Colors.grey.shade300,
                          ),
                          durationBetweenLetters:
                              const Duration(milliseconds: 70),
                          letterExpandingDuration:
                              const Duration(milliseconds: 500),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          isOpen
              ? Positioned(
                  top: size.height * 0.35,
                  left: 24,
                  child: SizedBox(
                    height: 30,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: onTapText2,
                          child: DelayedDisplay(
                            delay: const Duration(milliseconds: 200),
                            fadingDuration: const Duration(milliseconds: 200),
                            child: AnimatedText(
                              text: '- LEATHER GOODS',
                              textStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isSelected2
                                    ? Colors.white
                                    : Colors.grey.shade300,
                              ),
                              durationBetweenLetters:
                                  const Duration(milliseconds: 70),
                              letterExpandingDuration:
                                  const Duration(milliseconds: 500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          isOpen
              ? Positioned(
                  top: size.height * 0.45,
                  left: 24,
                  child: SizedBox(
                    height: 30,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: onTapText3,
                          child: DelayedDisplay(
                            delay: const Duration(milliseconds: 300),
                            fadingDuration: const Duration(milliseconds: 200),
                            child: AnimatedText(
                              text: '- PERFUME',
                              textStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isSelected3
                                    ? Colors.white
                                    : Colors.grey.shade300,
                              ),
                              durationBetweenLetters:
                                  const Duration(milliseconds: 70),
                              letterExpandingDuration:
                                  const Duration(milliseconds: 500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          isOpen
              ? Positioned(
                  top: size.height * 0.55,
                  left: 24,
                  child: SizedBox(
                    height: 30,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: onTapText4,
                          child: DelayedDisplay(
                            delay: const Duration(milliseconds: 400),
                            fadingDuration: const Duration(milliseconds: 200),
                            child: AnimatedText(
                              text: '- JEWELLERY',
                              textStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isSelected4
                                    ? Colors.white
                                    : Colors.grey.shade300,
                              ),
                              durationBetweenLetters:
                                  const Duration(milliseconds: 70),
                              letterExpandingDuration:
                                  const Duration(milliseconds: 500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          isOpen
              ? Positioned(
                  top: size.height * 0.65,
                  left: 24,
                  child: SizedBox(
                    height: 30,
                    child: Stack(
                      children: [
                        InkWell(
                          onTap: onTapText5,
                          child: DelayedDisplay(
                            delay: const Duration(milliseconds: 500),
                            fadingDuration: const Duration(milliseconds: 200),
                            child: AnimatedText(
                              text: '- SKINCARE',
                              textStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isSelected5
                                    ? Colors.white
                                    : Colors.grey.shade300,
                              ),
                              durationBetweenLetters:
                                  const Duration(milliseconds: 70),
                              letterExpandingDuration:
                                  const Duration(milliseconds: 500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          AnimatedBuilder(
              animation: tweenStart,
              builder: (context, child) {
                return Positioned(
                  top: size.height * heightTopSelected,
                  left: (1 - tweenStart.value) * 24,
                  child: SizedBox(
                    height: 30,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 2,
                            width: size.width * tweenStart.value,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
