import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/routes/app_pages.dart';
import 'package:get/get.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen>
    with SingleTickerProviderStateMixin {
  static const double _iconSize = 50;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2300),
    );

    _animationController
        .forward()
        .whenComplete(() => Get.offNamed(Routes.HOME));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: FlutterLogo(size: MediaQuery.of(context).size.height - 100));
  }
}
