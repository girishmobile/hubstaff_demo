import 'package:demo/core/color.dart';
import 'package:demo/core/common/common_button_widget.dart';
import 'package:demo/core/common/common_text_field_widget.dart';
import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/component.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/image_path.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpLeftView extends StatelessWidget {
  const SignUpLeftView({super.key, required this.size, required this.isMobile});

  final Size size;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Consumer<LoginProvider>(
        builder: (context,provider,child) {
          return Container(
            margin: const EdgeInsets.only(left: fifty, right: fifty),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * zero07,
                ),
                Image.asset(
                  icLogo,
                  width: isMobile ? size.width * zero6 : twoHundred,
                  height: isMobile ? size.width * zero1 : oneHundred,
                ),
                const SizedBox(
                  height: twenty,
                ),
                const CommonTextWidget(
                  text: productivityPersonified,
                  fontSize: thirty,
                  color: Colors.black,
                ),
                const CommonTextWidget(
                  text: productivityPersonifiedDesc,
                  fontSize: seventeen,
                  fontWeight: FontWeight.w400,
                ),
                CommonTextWidget(
                  text: '$fName$star',
                  top: size.height * zero02,
                  color: Colors.black,
                ),
                const CommonTextFieldWidget(
                  hint: fNameHint,
                  top: ten,
                ),
                const CommonTextWidget(
                  text: '$lName$star',
                  top: twenty,
                  color: Colors.black,
                ),
                const CommonTextFieldWidget(
                  hint: lNameHint,
                  top: ten,
                ),
                const CommonTextWidget(
                  text: '$workEmail$star',
                  top: twenty,
                  color: Colors.black,
                ),
                const CommonTextFieldWidget(
                  hint: emailHint,
                  top: ten,
                ),
                const CommonTextWidget(
                  text: '$password$star',
                  top: twenty,
                  color: Colors.black,
                ),
                const CommonTextFieldWidget(
                  hint: passwordHint,
                  top: ten,
                ),
                const SizedBox(
                  height: thirtyFive,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: provider.checkColor,
                        value: provider.isChecked, onChanged: (value) {
                      provider.toggleCheckbox();
                    }),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '$iAgree ', style: commonTextStyle()),
                          TextSpan(
                            text: privacyPolicy,
                            style: commonTextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ' $and ', style: commonTextStyle()),
                          TextSpan(
                            text: dpa,
                            style: commonTextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                CommonButtonWidget(
                  top: twentyFive,
                  vertical: fifteen,
                  color: colorDarkBlue,
                onTap: ()
                  {
                    Navigator.pop(context);
                  },
                  text: createAccount,
                  colorText: Colors.white,
                  width: size.width,
                ),
                const SizedBox(
                  height: twenty,
                ),
                Row(
                  children: [
                    const Icon(Icons.lock_open),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: subjectDesc, style: commonTextStyle()),
                          TextSpan(
                            text: bba,
                            style: commonTextStyle(
                                fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
