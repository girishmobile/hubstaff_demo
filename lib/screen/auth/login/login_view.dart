import 'package:demo/core/responsive.dart';
import 'package:demo/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_left_widget.dart';
import 'login_right_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<LoginProvider>(builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isMobile
                ? const SizedBox.shrink()
                : const Expanded(flex: 3, child: LoginLeftWidget()),
            Expanded(
                flex: 7,
                child: LoginRightWidget(
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
