import 'package:demo/core/Responsive.dart';
import 'package:demo/core/color.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/screen/auth/signup/sign_up_left_view.dart';
import 'package:demo/screen/auth/signup/sign_up_right_view.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = Responsive.isMobile(context);
    var size = MediaQuery.sizeOf(context);
    return Material(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: SignUpLeftView(
                isMobile: isMobile,
                size: size,
              ),
            ),
          ),
          isMobile
              ? const SizedBox.shrink()
              : Expanded(
                  flex: 7,
                  child: Container(
                    color: colorDarkBlue,
                    child: Stack(
                      children: [
                        SignUpRightView(
                          isMobile: isMobile,
                          size: size,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: MediaQuery.of(context).size.width *
                                zero20, // Half the screen width
                            height: MediaQuery.of(context).size.height / 2,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                    500.0), // Adjust radius for desired effect
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            width: MediaQuery.of(context).size.width *
                                zero1, // Half the screen width
                            height: MediaQuery.of(context).size.height / 5,
                            decoration: BoxDecoration(
                              color: Colors.yellow[200],
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(
                                    500.0), // Adjust radius for desired effect
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}
