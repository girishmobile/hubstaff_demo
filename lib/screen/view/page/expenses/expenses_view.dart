import 'package:demo/core/color.dart';
import 'package:demo/core/common/common_button_widget.dart';
import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/image_path.dart';
import 'package:demo/core/responsive.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:flutter/material.dart';

class ExpensesView extends StatelessWidget {
  const   ExpensesView(
      {super.key,
      this.title,
      this.desc,
      this.imagePath,
      required this.isButtonShow});

  final String? imagePath;
  final String? title;
  final String? desc;
  final bool isButtonShow;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isMobile = Responsive.isMobile(context);
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: ten,right: ten),
        width: size.width,
        height: size.height,
        color: colorBody,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: size.height *zero02,
            ),
            CommonTextWidget(text: title ?? expenses, fontSize: isMobile?eighteen:twentyFive,color: Colors.black,),
            SizedBox(
              height: size.height * zero02,
            ),
            CommonTextWidget(
                text: desc ??expensesDesc,
                fontSize: isMobile?twelve:fourteen,
                textAlign: TextAlign.center),
            SizedBox(
              height: size.height * zero02,
            ),
            Flexible(
                child: Image.asset(
              imagePath ?? icExpenses,

              width: isMobile ? size.width : size.width * zero3,
              height: isMobile ? size.height *zero4 : size.height * zero3,
              fit: BoxFit.fitWidth,
            )),
            isButtonShow == false
                ? const CommonTextWidget(
                    text: askDesc)
                : const CommonButtonWidget(
              top: fifty,
                    text: gotIT, color: Colors.blue, colorText: Colors.white)
          ],
        ),
      ),
    );
  }
}
