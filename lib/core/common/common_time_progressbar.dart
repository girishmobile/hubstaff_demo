import 'package:demo/core/constants/num_constants.dart';

import 'package:flutter/material.dart';

class CommonTimeProgressbar extends StatelessWidget {
  final String startTime;
  final String endTime;
  final bool isActive;
  final double? width;
  const CommonTimeProgressbar({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.isActive,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      // margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: isActive ? Colors.brown : Colors.brown.withOpacity(zero20),
        borderRadius: BorderRadius.circular(0),
      ),


      child: Center(
        child: Container(
          width: width,
        ),
      ),
    );
  }
}
