import 'package:demo/core/Responsive.dart';
import 'package:demo/core/color.dart';
import 'package:demo/core/common/common_report_top_view.dart';
import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/component.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/dashboard_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class  DailyTotalView extends StatelessWidget {
  const  DailyTotalView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isMobile = Responsive.isMobile(context);
    final itemProvider = Provider.of<DashboardProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemProvider.loadAmountOwed();
    });
    return Consumer<DashboardProvider>(
        builder: (context,provider,child) {
          return Container(
            color: colorBody,
            width: size.width,
            height: size.height,
            margin: const EdgeInsets.all(fifteen),
            padding: const EdgeInsets.all(twenty),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CommonTextWidget(
                    text: "Total hours worked per day",
                  ),
                  isMobile?const SizedBox(height: ten,):const SizedBox.shrink(),
                  CommonReportTopView(
                    leftText: hours,
                    title: "Daily totals report (Weekly)",
                    leftTextValue: "66:17:17",
                    isMobile: isMobile,
                    topView: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(ten),
                            border: Border.all(
                                color: Colors.grey.withOpacity(zero20), width: one)),
                        padding: const EdgeInsets.all(twenty),
                        child: isMobile ?IntrinsicHeight(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding:  EdgeInsets.all(isMobile?ten:fifteen),
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CommonTextWidget(
                                                  text: "Projects Worked".toUpperCase(),
                                                  fontSize: twelve),
                                              CommonTextWidget(
                                                top: five,
                                                fontSize: twenty,
                                                color: Colors.green,
                                                text: "1".toUpperCase(),
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
                                                  text: "Break time".toUpperCase(),
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
                                      )),
                                ],
                              ),
                            ),
                              const Divider(thickness: zero3,),
                            IntrinsicHeight(
                              child: Row(children: [
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
                                            const CommonTextWidget(
                                                text: "Avg. Hours Per Day",
                                                fontSize: twelve),
                                            CommonTextWidget(
                                              top: five,
                                              fontSize: twenty,
                                              color: Colors.green,
                                              text: "---------".toUpperCase(),
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
                                                text: "Avg. Activity".toUpperCase(),
                                                fontSize: twelve,
                                              ),
                                              CommonTextWidget(
                                                top: five,
                                                color: Colors.green,
                                                text: "67%".toUpperCase(),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ],),
                            ),
                              const Divider(thickness: zero3,),
                              Align(
                                alignment: Alignment.topLeft,
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
                                            text: "Earned".toUpperCase(),
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
                                ),
                              )
                            ],
                          ),
                        ):IntrinsicHeight(
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
                                              text: "Projects Worked".toUpperCase(),
                                              fontSize: twelve),
                                          CommonTextWidget(
                                            top: five,
                                            fontSize: twenty,
                                            color: Colors.green,
                                            text: "1".toUpperCase(),
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
                                              text: "Break time".toUpperCase(),
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
                                  )),
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
                                          const CommonTextWidget(
                                              text: "Avg. Hours Per Day",
                                              fontSize: twelve),
                                          CommonTextWidget(
                                            top: five,
                                            fontSize: twenty,
                                            color: Colors.green,
                                            text: "---------".toUpperCase(),
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
                                              text: "Avg. Activity".toUpperCase(),
                                              fontSize: twelve,
                                            ),
                                            CommonTextWidget(
                                              top: five,
                                              color: Colors.green,
                                              text: "67%".toUpperCase(),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
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
                                              text: "Earned".toUpperCase(),
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
                    size: size,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CommonTextWidget(
                          text: amountPerDay,
                          color: Colors.black,
                          fontSize: nineteen,
                          bottom: thirty,
                        ),
                        SizedBox(
                          child: SizedBox(
                            height: size.height * zero4,
                            width: size.width,
                            child: const AspectRatio(
                                aspectRatio: 1.70, child: LineChartSample1()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: thirty,),

              SizedBox(
                width: size.width,
                      height: size.height,
                      child:  const ReportView1()),


                ],
              ),
            ),
          );
        }
    );
  }
}
class LineChartSample1 extends StatelessWidget {
  const LineChartSample1({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        gridData: const FlGridData(

            show: true, drawVerticalLine: false,drawHorizontalLine: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 10, // Adjust according to your maximum data value
        barTouchData: BarTouchData(enabled: false),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: Colors.grey, // Customize the color of the bottom line
              width: 1, // Customize the thickness of the bottom line
            ),
            left: BorderSide.none,   // Hide the left border
            right: BorderSide.none,  // Hide the right border
            top: BorderSide.none,    // Hide the top border
          ),
        ),
        barGroups: [
          commonChart(xValue: 0,toY: 8),
          commonChart(xValue: 1,toY: 8),
          commonChart(xValue: 2,toY: 7),
          commonChart(xValue: 3,toY: 5),
          commonChart(xValue: 4,toY: 4),
          commonChart(xValue: 5,toY: 1),

        ],
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(

          drawBelowEverything: true,
          sideTitles: SideTitles(
            reservedSize: forty,
            interval: 2,
            showTitles: true,
            getTitlesWidget: (double value, TitleMeta meta) {
              switch (value.toInt()) {
                case 0:
                  return const Text('Mon, Sep 16');
                case 1:
                  return const Text('Tue, Sep 17');
                case 2:
                  return const Text('Wed, Sep 18');
                case 3:
                  return const Text('Thu, Sep 19');
                case 4:
                  return const Text('Fri, Sep 20');
                case 5:
                  return const Text('Sat, Sep 20');
                case 6:
                  return const Text('Sun, Sep 20');

                default:
                  return const Text('');
              }
            },
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false
          )
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          )
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 2, // Adjust the interval for Y-axis ticks
            getTitlesWidget: (value, meta) => Text(value.toInt().toString()),
          ),
        ),


      ),
      )
        // Optional: Hide grid lines
    );
  }


  commonChart({required int xValue,required double toY}){
    return BarChartGroupData(
      x: xValue,
      barRods: [
        BarChartRodData(
          borderRadius: const BorderRadius.only(topRight: Radius.circular(8),topLeft:  Radius.circular(8)),
          toY: toY, rodStackItems: [
       //   BarChartRodStackItem(0, 7, Colors.blue.withOpacity(0.50)), // Filled portion in red
          BarChartRodStackItem(0, 10,  colorBlueLight),
            BarChartRodStackItem(0, 2, Colors.blueAccent), // Unfilled portion in blue
        ],
          width: 20,
          /*  borderRadius: const BorderRadius.only(topRight: Radius.circular(8),topLeft:  Radius.circular(8)),
            toY: toY, width: 20, color: Colors.blue*/),
        //  BarChartRodData(toY: 9, width: 15, color: Colors.blueAccent),
      ],
    );
  }
}

class ReportView1 extends StatelessWidget {
  const ReportView1( {super.key,});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Column(
        children: [


          // Header Row
          Row(
            children: [
              commonHeadingView(title: "Project",color: Colors.black,fontWeight: FontWeight.w600),
              commonHeadingView(title: "Mon, Sep 16, 2024	",color: Colors.black,fontWeight: FontWeight.w600),
              commonHeadingView(title: "Tue, Sep 17, 2024",color: Colors.black,fontWeight: FontWeight.w600),
              commonHeadingView(title: "Wed, Sep 18, 2024",color: Colors.black,fontWeight: FontWeight.w600),
              commonHeadingView(title: "Thu, Sep 18, 2024",color: Colors.black,fontWeight: FontWeight.w600),
              commonHeadingView(title: "Fri, Sep 18, 2024",color: Colors.black,fontWeight: FontWeight.w600),
              commonHeadingView(title: "Sat, Sep 18, 2024",color: Colors.black,fontWeight: FontWeight.w600),
              commonHeadingView(title: "Sun, Sep 18, 2024",color: Colors.black,fontWeight: FontWeight.w600),
              commonHeadingView(title: "Total Worked",color: Colors.black,fontWeight: FontWeight.w600),
              commonHeadingView(title: "Activity",color: Colors.black,fontWeight: FontWeight.w600),
              commonHeadingView(title: "Earned Total",color: Colors.black,fontWeight: FontWeight.w600),


            ],
          ),
          const SizedBox(height: twenty,),
          Expanded(
            // ListView of children that will align with the header above
            child: ListView.builder(
              itemCount: 1, // Example item count
              shrinkWrap: true,

              itemBuilder: (context, outerIndex) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: [

                        SizedBox(width: twoHundred,
                        child: Row(children: [
                          Container(
                            width: forty,height: forty,
                            decoration: const BoxDecoration(color: Colors.brown,shape: BoxShape.circle),
                            child: const Center(child: CommonTextWidget(text: "I",color: Colors.white,),),
                          ),
                          commonHeadingView(title:" i- Mobile App Development",textOverflow: TextOverflow.ellipsis),
                        ],),),
                        commonHeadingView(title:"8:39:06"),
                        commonHeadingView(title:"8:29:50"),
                        commonHeadingView(title:"8:22:32"),
                        commonHeadingView(title:"8:48:14	"),
                        commonHeadingView(title:"0:14:37	"),
                        commonHeadingView(title:" - "),
                        commonHeadingView(title:" - "),
                        commonHeadingView(title:"34:34:19"),
                        commonHeadingView(title:"67%"),
                        commonHeadingView(title:"\$0.00"),


                      ],
                    ),
                    const Divider(thickness: zero3,),
                    Row(
                      children: [


                        commonHeadingView(title:"Total",color: Colors.black),
                        commonHeadingView(title:"8:39:06",color: Colors.black),
                        commonHeadingView(title:"8:29:50",color: Colors.black),
                        commonHeadingView(title:"8:22:32",color: Colors.black),
                        commonHeadingView(title:"8:48:14",color: Colors.black),
                        commonHeadingView(title:"0:14:37",color: Colors.black),
                        commonHeadingView(title:" - ",color: Colors.black),
                        commonHeadingView(title:" - ",color: Colors.black),
                        commonHeadingView(title:"34:34:19",color: Colors.black),
                        commonHeadingView(title:"67%",color: Colors.black),
                        commonHeadingView(title:"\$0.00",color: Colors.black),
                      ],
                    ),

                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  commonHeadingView({String? title,Color? color,FontWeight? fontWeight,TextOverflow? textOverflow}){
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(eight),
        child: CommonTextWidget(
          text: title??'',

          textOverflow: textOverflow,
          fontWeight: fontWeight??FontWeight.w400,
          color: color,
        ),
      ),
    );
  }
}

