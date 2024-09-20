import 'package:demo/core/color.dart';
import 'package:demo/core/image_path.dart';
import 'package:flutter/cupertino.dart';

class InsightsView extends StatelessWidget {
  const InsightsView({super.key});

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
