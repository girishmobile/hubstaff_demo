
import 'package:flutter/material.dart';

import '../constants/num_constants.dart';
import 'common_text_widget.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({super.key,this.text,this.color,this.onTap,this.colorText,this.horizontal,this.vertical,this.top,this.bottom,this.left,this.right,this.height,this.width});
  final String ?text;
  final Color? color;
  final Color? colorText;
  final double? horizontal;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  final  double? vertical;
  final  double? width;
  final  double? height;
  final VoidCallback ?onTap;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(left:left??zero ,right:right??zero ,bottom: bottom??zero,top:top??zero ),
      child: ElevatedButton(
        onPressed: onTap,

        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: color??Colors.blue,
          disabledForegroundColor: color??Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(five), // <-- Radius
          ),
          elevation: zero,

          backgroundColor:color?? Colors.blue, // background
          foregroundColor: color??Colors.blue, // foreground
        ),
        child:  Padding(
          padding:
          EdgeInsets.symmetric(horizontal: horizontal??twentyFour, vertical: vertical??twelve),
          child: CommonTextWidget(text:text??'Press me!',color: colorText),
        ),
      ),
    );
  }
}
