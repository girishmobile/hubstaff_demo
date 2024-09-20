import 'package:demo/core/Responsive.dart';
import 'package:demo/core/color.dart';
import 'package:demo/core/common/common_report_top_view.dart';
import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/image_path.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isMobile = Responsive.isMobile(context);
    return Container(
      color: colorBody,
      width: size.width,
      height: size.height,
      child: ListView(
        children: [
          Container(

            padding: const EdgeInsets.all(twenty),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonReportTopView(isMobile: isMobile,size: size,),

                const SizedBox(
                  height: twenty,
                ),

                SizedBox(height: size.height*zero1,),
                Center(child: Column(
                  children: [
                    Image.asset(icNoReport,width: size.height*zero2,),
                    CommonTextWidget(text: notingReport,top: size.height*zero02,fontSize: isMobile?sixteen:eighteen,),
                     CommonTextWidget(text: notingReportDesc,fontSize: isMobile?fourteen:eighteen),
                  ],
                )),

                const SizedBox(
                  height: fifteen,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
