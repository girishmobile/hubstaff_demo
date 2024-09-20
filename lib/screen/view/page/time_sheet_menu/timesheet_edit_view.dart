import 'package:demo/core/Responsive.dart';
import 'package:demo/core/common/common_button_widget.dart';
import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/image_path.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/dashboard_provider.dart';
import 'package:demo/screen/view/page/time_sheet_menu/view/daily_view.dart';
import 'package:demo/screen/view/page/time_sheet_menu/view/weekly_view.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimesheetEditView extends StatelessWidget {
  const TimesheetEditView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isMobile=Responsive.isMobile(context);
    final itemProvider = Provider.of<DashboardProvider>(context);

    // Load items when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemProvider.loadViewAndEditTimeSheet();
      itemProvider.loadWeeklyData();
    });
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(fifteen),
      child: DefaultTabController(
        length: 3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: twenty,
            ),

            SizedBox(
              height: size.height*0.1,
              child: isMobile?Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CommonTextWidget(
                      text: viewEditTimeSheet,
                      fontSize: twentyFive,
                      fontWeight: FontWeight.w400),
                  Expanded(
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: Container(
                        width: isMobile?size.width*0.9:size.width * zero2,
                        height: fifty,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(zero20),
                            borderRadius: BorderRadius.circular(twentyFive)),
                        child: Padding(
                          padding: const EdgeInsets.all(three),
                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: Colors.transparent,
                            indicator: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(twenty)),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black,
                            tabs: const [
                              Tab(
                                text: daily,
                              ),
                              Tab(
                                text: weekly,
                              ),
                              Tab(
                                text: calendar,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ):Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const CommonTextWidget(
                      text: viewEditTimeSheet,
                      fontSize: twentyFive,
                      fontWeight: FontWeight.w400),
                  Expanded(
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: Container(
                        width: isMobile?size.width*0.9:size.width * zero2,
                        height: fifty,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(zero20),
                            borderRadius: BorderRadius.circular(twentyFive)),
                        child: Padding(
                          padding: const EdgeInsets.all(three),
                          child: TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: Colors.transparent,
                            indicator: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(twenty)),
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black,
                            tabs: const [
                              Tab(
                                text: daily,
                              ),
                              Tab(
                                text: weekly,
                              ),
                              Tab(
                                text: calendar,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: twenty,
            ),
            isMobile?Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(ten),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(ten)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent,
                            offset: Offset(zero, zero),
                            blurRadius: five,
                            spreadRadius: one,
                          )
                        ],
                      ),
                      //  margin: const EdgeInsets.only(top: 15), //Add margin
                      child: const Row(
                        children: [
                          CommonTextWidget(
                              text: "Mon, Sep 9, 2024 - Fri, Sep 13, 2024 ",
                              color: Colors.black,
                              fontSize: twelve),
                          SizedBox(
                            width: ten,
                          ),
                          Icon(
                            Icons.calendar_month,
                            color: Colors.blueAccent,
                            size: twenty,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: twenty,
                    ),
                    const CommonTextWidget(text: "IST", color: Colors.black)
                  ],
                ),
                const SizedBox(height: twenty,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(ten),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(ten)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent,
                            offset: Offset(zero, zero),
                            blurRadius: five,
                            spreadRadius: one,
                          )
                        ],
                      ),
                      //  margin: const EdgeInsets.only(top: 15), //Add margin
                      child: const Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.blueAccent,
                            size: twenty,
                          ),
                          SizedBox(
                            width: ten,
                          ),
                          CommonTextWidget(
                              text: "Sameer khan - Android Developer ",
                              color: Colors.black,
                              fontSize: twelve),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: twenty,
                    ),
                    const CommonButtonWidget(
                        text: filter,
                        color: Colors.blueAccent,
                        colorText: Colors.white)
                  ],
                )
              ],
            ):Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(ten),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(ten)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent,
                            offset: Offset(zero, zero),
                            blurRadius: five,
                            spreadRadius: one,
                          )
                        ],
                      ),
                      //  margin: const EdgeInsets.only(top: 15), //Add margin
                      child: const Row(
                        children: [
                          CommonTextWidget(
                              text: "Mon, Sep 9, 2024 - Fri, Sep 13, 2024 ",
                              color: Colors.black,
                              fontSize: twelve),
                          SizedBox(
                            width: ten,
                          ),
                          Icon(
                            Icons.calendar_month,
                            color: Colors.blueAccent,
                            size: twenty,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: twenty,
                    ),
                    const CommonTextWidget(text: "IST", color: Colors.black)
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(ten),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(ten)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent,
                            offset: Offset(zero, zero),
                            blurRadius: five,
                            spreadRadius: one,
                          )
                        ],
                      ),
                      //  margin: const EdgeInsets.only(top: 15), //Add margin
                      child: const Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.blueAccent,
                            size: twenty,
                          ),
                          SizedBox(
                            width: ten,
                          ),
                          CommonTextWidget(
                              text: "Sameer khan - Android Developer ",
                              color: Colors.black,
                              fontSize: twelve),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: twenty,
                    ),
                    const CommonButtonWidget(
                        text: filter,
                        color: Colors.blueAccent,
                        colorText: Colors.white)
                  ],
                )
              ],
            ),
            const SizedBox(
              height: twenty,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.view_column_outlined,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: eight,
                ),
                Icon(
                  Icons.download,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: eight,
                ),
                CommonButtonWidget(
                    text: addTime,
                    color: Colors.blueAccent,
                    colorText: Colors.white)
              ],
            ),
            const SizedBox(
              height: twenty,
            ),
            Expanded(
                child: TabBarView(
              children: [
                DailyView(
                  itemProvider: itemProvider,
                ),
                WeeklyView(itemProvider: itemProvider),
                 Center(
                  child:Image.asset(icError),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
