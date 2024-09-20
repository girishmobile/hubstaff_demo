import 'package:demo/core/Responsive.dart';
import 'package:demo/core/color.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/image_path.dart';
import 'package:flutter/material.dart';

class CommonErrorPage extends StatelessWidget {
  const CommonErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = Responsive.isMobile(context);
    var size = MediaQuery.sizeOf(context);
    return Container(
      color: colorBody,
      child: Center(
        child: Image.asset(
          icError,
          width: isMobile ? size.width * zero7 : size.width * zero2,
        ),
      ),
    );
  }
}
