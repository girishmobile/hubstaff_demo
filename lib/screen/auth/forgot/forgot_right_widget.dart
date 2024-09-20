import 'package:demo/core/common/common_button_widget.dart';
import 'package:demo/core/common/common_text_field_widget.dart';
import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/component.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/image_path.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotRightWidget extends StatelessWidget {
  const ForgotRightWidget(
      {super.key,
      required this.size,
      required this.isMobile,
      required this.provider});

  final Size size;
  final bool isMobile;
  final LoginProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height,
      margin: const EdgeInsets.all(twenty),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
              alignment: isMobile ? Alignment.center : Alignment.topRight,
              child: Image.asset(
                icLogo,
                width: isMobile ? oneHundred : twoHundred,
                height: isMobile ? fifty : oneHundred,
              )),
          Expanded(
            child: Column(
              mainAxisAlignment:
                  isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.center,
                    width: isMobile ? size.width * zero8 : size.width * zero2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Align(
                          alignment:
                              isMobile ? Alignment.center : Alignment.topLeft,
                          child: CommonTextWidget(
                              text: forgotPassword,
                              style: GoogleFonts.ubuntu(
                                  fontSize: thirty,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black)),
                        ),

                        CommonTextWidget(
                          top: thirty,
                            text: '$workEmail $star',
                            style: GoogleFonts.roboto(
                                fontSize: fourteen,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey)),

                        const CommonTextFieldWidget(
                            top: ten,
                            hint: workEmail),

                        SizedBox(
                          width: isMobile
                              ? size.width * zero8
                              : size.width * zero2,
                          child: CommonButtonWidget(
                              text: sendInstruction,
                              top: thirty,
                              color: Colors.blueAccent,
                              colorText: Colors.white,
                              onTap: () {}),
                        ),
                        const SizedBox(
                          height: ten,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: commonInkWell(
                              onTap: () =>
                                  provider.redirectToLogin(context: context),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_back_outlined,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: ten,
                                  ),
                                  CommonTextWidget(text: backToLogin)
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: twentyFive,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: haveAccount,
                              style: GoogleFonts.roboto(
                                  fontSize: fourteen,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                  text: ' $getStarted',
                                  style: GoogleFonts.roboto(
                                      fontSize: fourteen,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
