import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginLeftWidget extends StatelessWidget {
  const LoginLeftWidget({super.key, this.isForgot = false});

  final bool? isForgot;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: isForgot == true
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.all(twenty),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                      text: loginTitle,
                      top: twenty,
                      left: twenty,
                      style: GoogleFonts.ubuntu(
                          fontSize: fiftyFive,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextWidget(
                          textAlign: TextAlign.start,
                          left: twenty,
                          text: loginTitleDesc,
                          style: GoogleFonts.roboto(
                              fontSize: sixteen,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
