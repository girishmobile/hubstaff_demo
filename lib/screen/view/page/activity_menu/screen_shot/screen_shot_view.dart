import 'package:demo/core/color.dart';
import 'package:demo/core/image_path.dart';
import 'package:flutter/material.dart';

class  ScreenShotView extends StatelessWidget {
    ScreenShotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBody,
      child: Center(
        child:Image.asset(icError),
      ),
    );
  }
}
