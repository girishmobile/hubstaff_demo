import 'package:demo/core/common/common_button_widget.dart';
import 'package:demo/core/common/common_text_field_widget.dart';
import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/component.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/image_path.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/login_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginRightWidget extends StatelessWidget {
  const LoginRightWidget(
      {super.key,
      required this.isMobile,
      required this.size,
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
                width: isMobile ? size.width * zero3 : size.width * zero06,
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
                              text: signToHub,
                              top: isMobile ? twenty : zero,
                              style: GoogleFonts.ubuntu(
                                  fontSize: thirty,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black)),
                        ),
                        CommonTextWidget(
                            top: fifteen,
                            text: '$workEmail $star',
                            style: GoogleFonts.roboto(
                                fontSize: fourteen,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey)),
                        const CommonTextFieldWidget(top: five, hint: workEmail),
                        CommonTextWidget(
                            top: ten,
                            text: '$password $star',
                            style: GoogleFonts.roboto(
                                fontSize: fourteen,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey)),
                        CommonTextFieldWidget(
                            top: five,
                            onChanged: (value) {
                              provider.updatePassword(value);
                            },
                            obscureText: provider.obscureText,
                            hint: enterPassword,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  provider.togglePasswordVisibility();
                                },
                                icon: Icon(
                                    color: Colors.grey,
                                    provider.obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off))),
                        Align(
                          alignment: Alignment.topRight,
                          child: commonInkWell(
                              onTap: () => provider.redirectToForgotScreen(
                                  context: context),
                              child: const CommonTextWidget(
                                  text: forgotPassword,
                                  top: ten,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w500,
                                  fontSize: twelve)),
                        ),
                        SizedBox(
                          width: isMobile
                              ? size.width * zero8
                              : size.width * zero2,
                          child: CommonButtonWidget(
                              text: signIn,
                              top: twenty,
                              color: Colors.blueAccent,
                              colorText: Colors.white,
                              onTap: () => provider.redirectToHomeScreen(
                                  context: context)),
                        ),
                        const SizedBox(
                          height: twenty,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: loginWithSS0,
                              style: GoogleFonts.roboto(
                                  fontSize: fourteen,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blueAccent),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: twentyFive,
                        ),
                        const Divider(
                          thickness: zero3,
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
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => provider.redirectToSignUp(
                                        context: context),
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
