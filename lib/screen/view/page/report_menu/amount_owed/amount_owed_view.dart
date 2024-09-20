import 'package:demo/core/Responsive.dart';
import 'package:demo/core/color.dart';
import 'package:demo/core/common/common_report_top_view.dart';
import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/dashboard_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AmountOwedView extends StatelessWidget {
  const AmountOwedView({super.key});

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
                  text: amountPerDay,
                ),
                CommonReportTopView(
                  leftText: hours,
                  leftTextValue: "66:17:17",
                  isMobile: isMobile,
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
                              aspectRatio: 1.70, child: LineChartSample()),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: thirty,),

                SizedBox(
                    height: size.height,
                    child:  ReportView(provider: provider,)),
              ],
            ),
          ),
        );
      }
    );
  }
}

class LineChartSample extends StatelessWidget {
  const LineChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true, drawVerticalLine: false),
        // Optional: Hide grid lines
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1, // Y-axis intervals
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text('${value.toInt()}');
              },
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: forty,
              getTitlesWidget: (value, meta) {
                // This can be modified based on your data points
                List<String> titles = [
                  'Aug 20',
                  'Aug 24',
                  'Aug 28',
                  'Sep 01',
                  'Sep 05',
                  'Sep 09',
                  'Sep 13',
                  'Sep 17'
                ];
                return Text(titles[value.toInt()]);
              },
              interval: one,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 7,
        minY: 0,
        maxY: 10,
        lineBarsData: [
          LineChartBarData(
            isStrokeJoinRound: true,
            color: colorDropDown,
            spots: [
              const FlSpot(0, 0), // Aug 20
              const FlSpot(1, 1), // Aug 24
              const FlSpot(2, 5), // Aug 28
              const FlSpot(3, 2), // Sep 01
              const FlSpot(4, 1), // Sep 05
              const FlSpot(5, 6), // Sep 09
              const FlSpot(6, 3), // Sep 13
              const FlSpot(7, 1), // Sep 17
            ],
            isCurved: true,
            // Makes the line smooth
            dotData: const FlDotData(show: true),
            // Show dots on data points
            belowBarData:
                BarAreaData(show: true), // Hide the area below the line
          ),
        ],
      ),
    );
  }
}
class ReportView extends StatelessWidget {
  const ReportView( {super.key,required this.provider});
  final DashboardProvider provider;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Column(
        children: [
          // Header Row
          Row(
            children: [
              commonHeadingView(),
              commonHeadingView(title: currentRate,color: Colors.black,fontWeight: FontWeight.w600),
              commonHeadingView(title: totalHours,color: Colors.black,fontWeight: FontWeight.w600),
              commonHeadingView(title: amount,color: Colors.black,fontWeight: FontWeight.w600),

            ],
          ),
          const SizedBox(height: twenty,),
          Expanded(
            // ListView of children that will align with the header above
            child: ListView.builder(
              itemCount: provider.itemOuterItem.length, // Example item count
              shrinkWrap: true,
              itemBuilder: (context, outerIndex) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      color: Colors.grey.withOpacity(zero20),
                      padding: const EdgeInsets.all(eight),
                      child: CommonTextWidget(
                        text:provider.itemOuterItem[outerIndex].title,
                        color: Colors.black,
                      ),
                    ),
                    ListView.builder(
                    itemCount: provider.itemOuterItem[outerIndex].innerItems.length, // Inner ListView item count
                      shrinkWrap: true, // Limit height to content
                      physics: const NeverScrollableScrollPhysics(), // Disable inner scroll
                      itemBuilder: (context, innerIndex) {
                        return  Column(
                          children: [
                            Row(
                              children: [
                                commonHeadingView(title:""),
                                commonHeadingView(title:provider.itemOuterItem[outerIndex].innerItems[innerIndex].currentRate,),
                                commonHeadingView(title:provider.itemOuterItem[outerIndex].innerItems[innerIndex].totalHours,),
                                commonHeadingView(title:provider.itemOuterItem[outerIndex].innerItems[innerIndex].amount,),

                              ],
                            ),
                            const Divider(thickness: zero3,),
                            Row(
                              children: [


                                commonHeadingView(title:total,color: Colors.black),
                                commonHeadingView(title:""),
                                commonHeadingView(title:provider.itemOuterItem[outerIndex].innerItems[innerIndex].totalHours,color: Colors.black),
                                commonHeadingView(title:provider.itemOuterItem[outerIndex].innerItems[innerIndex].amount),
                              ],
                            ),
                          ],
                        );
                      },
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

  commonHeadingView({String? title,Color? color,FontWeight? fontWeight}){
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(eight),
        child: CommonTextWidget(
          text: title??'',
          fontWeight: fontWeight??FontWeight.w400,
          color: color,
        ),
      ),
    );
  }
}

