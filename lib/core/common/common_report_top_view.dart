import 'package:demo/core/color.dart';
import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/component.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/string_utils/string_utils.dart';

import 'package:flutter/material.dart';

class CommonReportTopView extends StatelessWidget {
  const CommonReportTopView({super.key, required this.isMobile, required this.size,this.child,this.leftText,this.rightText,this.leftTextValue,this.topView,this.title});

  final bool isMobile;
  final Size size;
  final Widget ?child;
  final Widget ?topView;
  final String  ?rightText;
  final String  ?leftText;
  final String  ?leftTextValue;
  final String  ?title;

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         CommonTextWidget(
          text: title??paymentReport,
          fontSize: twenty,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.access_time_sharp,
                color: Colors.blue,
              ),
              CommonTextWidget(
                text: scheduledReports,
                color: Colors.blue,
              )
            ],
          ),
        ),
        const SizedBox(
          height: twenty,
        ),
        Align(
          alignment: isMobile ? Alignment.topLeft : Alignment.topRight,
          child: isMobile
              ? Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        commonArrowView(
                          width: fifty,
                          height: forty,
                        ),
                        const SizedBox(
                          width: ten,
                        ),
                        commonArrowView(
                            width: fifty,
                            height: forty,
                            icon: Icons.arrow_forward),
                        const SizedBox(
                          width: ten,
                        ),
                        Expanded(
                          child: commonArrowView(
                              height: forty,
                              child: const Padding(
                                padding: EdgeInsets.all(four),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonTextWidget(
                                      right: ten,
                                      text:
                                          "Tue, Aug 20, 2024 - Fri, Sep 20, 2024",
                                    ),
                                    Icon(
                                      Icons.calendar_month,
                                      color: coloBlue,
                                    )
                                  ],
                                ),
                              )),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: ten,
                    ),
                    commonArrowView(
                        height: forty,
                        width: size.width,
                        child: const Center(
                            child: CommonTextWidget(
                          text: today,
                        ))),
                    const SizedBox(
                      height: ten,
                    ),
                    commonArrowView(
                        width: size.width,
                        height: forty,
                        child: Container(
                          decoration: BoxDecoration(
                              color: coloBlue,
                              borderRadius: BorderRadius.circular(seven),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(zero20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: CommonTextWidget(
                                      text: filter,
                                      color: Colors.white,
                                    )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: colorDropDown,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(seven),
                                        bottomRight: Radius.circular(seven)),
                                    border: Border.all(
                                        color:
                                            Colors.grey.withOpacity(zero20))),
                                height: forty,
                                width: forty,
                                child: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    commonArrowView(
                      width: fifty,
                      height: forty,
                    ),
                    const SizedBox(
                      width: ten,
                    ),
                    commonArrowView(
                        width: fifty, height: forty, icon: Icons.arrow_forward),
                    const SizedBox(
                      width: ten,
                    ),
                    commonArrowView(
                        height: forty,
                        child: const Padding(
                          padding: EdgeInsets.all(eight),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonTextWidget(
                                right: ten,
                                text: "Tue, Aug 20, 2024 - Fri, Sep 20, 2024",
                              ),
                              Icon(
                                Icons.calendar_month,
                                color: coloBlue,
                              )
                            ],
                          ),
                        )),
                    const SizedBox(
                      width: ten,
                    ),
                    commonArrowView(
                        height: forty,
                        width: size.width * zero04,
                        child: const Center(
                            child: CommonTextWidget(
                          text: today,
                        ))),
                    const SizedBox(
                      width: ten,
                    ),
                    commonArrowView(
                        width: size.width * zero07,
                        height: forty,
                        child: Container(
                          decoration: BoxDecoration(
                              color: coloBlue,
                              borderRadius: BorderRadius.circular(seven),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(zero20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: CommonTextWidget(
                                      text: filter,
                                      color: Colors.white,
                                    )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: colorDropDown,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(seven),
                                        bottomRight: Radius.circular(seven)),
                                    border: Border.all(
                                        color:
                                            Colors.grey.withOpacity(zero20))),
                                height: forty,
                                width: forty,
                                child: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
        ),
        const SizedBox(height: twentyFive,),
        topView??Align(
          alignment: Alignment.center,
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ten),
                border: Border.all(
                    color: Colors.grey.withOpacity(zero20), width: one)),
            padding: const EdgeInsets.all(twenty),
            child: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(fifteen),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonTextWidget(
                                  text:leftText?? payment.toUpperCase(),
                                  fontSize: twelve),
                              CommonTextWidget(
                                top: five,
                                fontSize: leftTextValue!=null?twenty:null,
                                color: leftTextValue!=null?Colors.green:null,
                                text: leftTextValue??"---------".toUpperCase(),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  commonVerticalLine(),
                  Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(fifteen),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonTextWidget(
                                  text: rightText??amount.toUpperCase(),
                                  fontSize: twelve,
                                ),
                                CommonTextWidget(
                                  top: five,
                                  text: "---------".toUpperCase(),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: twentyFive,),
      //  const SizedBox(height: twentyFive,),
        child??const SizedBox.shrink(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                CommonTextWidget(
                  text: "Redefine Solutions LLC",
                  fontSize: nineteen,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                CommonTextWidget(
                  text: "Asia - Kolkata",
                  fontSize: twelve,
                  fontWeight: FontWeight.w400,
                  top: three,
                  left: five,
                )
              ],
            ),
            isMobile?const SizedBox.shrink():Row(
              children: [
                commonButtonView(),
                const SizedBox(width: twenty,),
                commonButtonView(text: schedules,icon: Icons.access_time_outlined),
                const SizedBox(width: twenty,),
                commonButtonView(text: export,icon: Icons.download),
                const SizedBox(width: twenty,),
              ],
            )
          ],
        ),
        isMobile?const SizedBox(height: ten,):const SizedBox.shrink(),
        isMobile?Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            commonButtonView(),
            const SizedBox(width: thirtyFive,),
            commonButtonView(text: schedules,icon: Icons.access_time_outlined),
            const SizedBox(width: thirtyFive,),
            commonButtonView(text: export,icon: Icons.download),
            const SizedBox(width: thirtyFive,),
          ],
        ):const SizedBox.shrink(),
      ],
    );
  }



}
