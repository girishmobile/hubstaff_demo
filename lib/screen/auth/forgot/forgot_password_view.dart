import 'package:demo/core/responsive.dart';
import 'package:demo/provider/login_provider.dart';
import 'package:demo/screen/auth/forgot/forgot_right_widget.dart';
import 'package:demo/screen/auth/login/login_left_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isMobile = Responsive.isMobile(context);
    return Material(
      color: Colors.white,
      child: Consumer<LoginProvider>(builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isMobile
                ? const SizedBox.shrink()
                : Expanded(
                    flex: 3,
                    child: SizedBox(
                        width: size.width,
                        height: size.height,
                        child: const LoginLeftWidget(
                          isForgot: true,
                        ))),
            Expanded(
                flex: 7,
                child: ForgotRightWidget(
                  size: size,
                  isMobile: isMobile,
                  provider: provider,
                ))
          ],
        );
      }),
    );
  }
}
