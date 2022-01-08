import 'package:flutter/material.dart';
import 'package:reto_enero/presentation/home/drawer/custom_drawer.dart';
import 'package:reto_enero/presentation/home/others/other_page.dart';
import 'package:reto_enero/presentation/home/perfume/perfume_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // Anim Drawer
  late AnimationController _animationIconController;
  late Animation<double> _tween;
  bool isOpen = false;

  // Anim SelectedDrawer
  late AnimationController _selectedController;
  late Animation<double> _tweenSelected;
  late AnimationController _openController;
  late Animation<double> _tweenOpen;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  bool isSelected5 = false;

  double _heightTopSelected = 1.0;
  double _heightDownSelected = 1.0;

  int pageIndex = 3;

  // Anim PerfumePage
  late AnimationController _perfumeController;
  bool isReady = true;

  @override
  void initState() {
    _animationIconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _tween = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _animationIconController,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        if (_tween.value > 0.1 && isOpen) {
          setState(() {
            isOpen = false;
          });
        }
        if (_tween.value < 0.9 && !isOpen) {
          setState(() {
            isOpen = true;
          });
        }
        setState(() {});
      });

    _selectedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _tweenSelected = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _selectedController,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {});

    _openController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _tweenOpen = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _openController,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {});

    _perfumeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _perfumeController.forward();

    super.initState();

    _selectedController.addListener(() {
      if (_selectedController.isCompleted) {
        setState(() {
          isSelected1 = false;
          isSelected2 = false;
          isSelected3 = false;
          isSelected4 = false;
          isSelected5 = false;
          isReady = false;
        });
        _selectedController.reset();
        _perfumeController.reset();
        _openController.forward();
      }
    });

    _openController.addListener(() {
      if (_openController.isCompleted) {
        setState(() {
          isSelected1 = false;
          isSelected2 = false;
          isSelected3 = false;
          isSelected4 = false;
          isSelected5 = false;
        });
        _animationIconController.reset();
        _openController.reset();
        if (pageIndex == 3) {
          _perfumeController.forward();
          setState(() {
            isReady = true;
          });
        } else {
          setState(() {
            isReady = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _animationIconController.dispose();
    _selectedController.dispose();
    _openController.dispose();
    _perfumeController.dispose();
    super.dispose();
  }

  void tapDrawer() {
    if (_animationIconController.isCompleted) {
      _animationIconController.reverse();
    } else {
      _animationIconController.forward();
    }
  }

  void selectPartDrawer(int posText) {
    switch (posText) {
      case 1:
        _heightTopSelected = 0.25;
        _heightDownSelected = 0.75;
        break;
      case 2:
        _heightTopSelected = 0.35;
        _heightDownSelected = 0.65;
        break;
      case 3:
        _heightTopSelected = 0.45;
        _heightDownSelected = 0.55;
        break;
      case 4:
        _heightTopSelected = 0.55;
        _heightDownSelected = 0.45;
        break;
      case 5:
        _heightTopSelected = 0.65;
        _heightDownSelected = 0.35;
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: [
          // Page type
          pageIndex == 3
              ? SafeArea(
                  child: Container(
                    color: Colors.grey.shade300,
                    height: size.height,
                    width: size.width,
                    child: PerfumePage(
                      animationIconController: _animationIconController,
                      onDrawerTap: tapDrawer,
                      isReady: isReady,
                    ),
                  ),
                )
              : SafeArea(
                  child: Container(
                    color: Colors.grey.shade300,
                    height: size.height,
                    width: size.width,
                    child: OtherPage(
                      animationIconController: _animationIconController,
                      onDrawerTap: tapDrawer,
                      titlePage: 'Other page',
                    ),
                  ),
                ),
          // Custom Drawer
          AnimatedBuilder(
            animation: _tween,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(-_tween.value * size.width, 0),
                child: CustomDrawerReto(
                  tweenStart: _tweenSelected,
                  tweenOpen: _tweenOpen,
                  isOpen: isOpen,
                  heightTopSelected: _heightTopSelected,
                  heightDownSelected: _heightDownSelected,
                  isSelected1: isSelected1,
                  isSelected2: isSelected2,
                  isSelected3: isSelected3,
                  isSelected4: isSelected4,
                  isSelected5: isSelected5,
                  onTapText1: () {
                    selectPartDrawer(1);
                    _selectedController.forward();
                    setState(() {
                      isSelected1 = true;
                      pageIndex = 1;
                    });
                  },
                  onTapText2: () {
                    selectPartDrawer(2);
                    _selectedController.forward();
                    setState(() {
                      isSelected2 = true;
                      pageIndex = 2;
                    });
                  },
                  onTapText3: () {
                    selectPartDrawer(3);
                    _selectedController.forward();
                    setState(() {
                      isSelected3 = true;
                      pageIndex = 3;
                    });
                  },
                  onTapText4: () {
                    selectPartDrawer(4);
                    _selectedController.forward();
                    setState(() {
                      isSelected4 = true;
                      pageIndex = 4;
                    });
                  },
                  onTapText5: () {
                    selectPartDrawer(5);
                    _selectedController.forward();
                    setState(() {
                      isSelected5 = true;
                      pageIndex = 5;
                    });
                  },
                ),
              );
            },
          ),
          //Buttom close of custom drawer
          Visibility(
            visible: isOpen,
            child: SafeArea(
              child: SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: tapDrawer,
                        child: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          color: Colors.white,
                          progress: _animationIconController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
