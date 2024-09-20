import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/image_path.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpRightView extends StatelessWidget {
  const SignUpRightView(
      {super.key, required this.size, required this.isMobile});

  final Size size;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, provider, child) {
      final PageController pageController = PageController();

      provider.initialize(pageController);
      return SizedBox(
        width: size.width,
        height: size.height,
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [

              Container(
                width: size.width * zero22,
                height: size.height * zero4,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(zero20),
                    borderRadius: BorderRadius.circular(ten),
                    border: Border.all(color: Colors.white, width: one)),
                child: Container(
                  margin: const EdgeInsets.only(
                      left: forty, right: forty, top: oneHundred),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        icQuote,
                        color: Colors.white.withOpacity(zero40),
                        width: sixty,
                        height: sixty,
                      ),
                      const CommonTextWidget(
                        top: twenty,
                        color: Colors.white,
                        fontSize: eighteen,
                        fontWeight: FontWeight.w400,
                        text: signupDesc,
                      ),
                      const SizedBox(
                        height: thirty,
                      ),
                      const Divider(
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: thirty,
                      ),
                      const Row(
                        children: [
                          CommonTextWidget(
                            text: industry,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: twenty,
                          ),
                          CommonTextWidget(
                            text: " $it",
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: twenty,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: fifty,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget(
                                text: "Sameer Khan",
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: twenty,
                              ),
                              CommonTextWidget(
                                fontWeight: FontWeight.w500,
                                text: "Flutter Developer",
                                color: Colors.white,
                                fontSize: twenty,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              commonCircle(),
                              const SizedBox(
                                width: fifteen,
                              ),
                              commonCircle(
                                  icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                                size: twenty,
                              ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: -100,
                  child: Container(
                    alignment: Alignment.topCenter,
                    width: twoHundred,
                    height: twoHundred,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(zero20),
                        border: Border.all(color: Colors.white, width: one)),
                    child: Container(
                      width: twoHundred,
                      height: twoHundred,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        dummyImageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
    });
  }

  commonCircle({Widget? icon}) {
    return Container(
      width: fifty,
      height: fifty,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: one)),
      child: const Center(
        child: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.white,
          size: twenty,
        ),
      ),
    );
  }
}
