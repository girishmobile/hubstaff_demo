import 'package:demo/core/responsive.dart';
import 'package:demo/core/common/common_button_widget.dart';
import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/component.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TopView extends StatelessWidget {
  const TopView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isMobile = Responsive.isMobile(context);
    return Container(
      // height: size.height*0.3,
      margin: const EdgeInsets.all(ten),
      width: size.width,
      padding: const EdgeInsets.all(ten),

      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonTextWidget(text: dashboard, fontSize: eighteen),
          const CommonTextWidget(
              text: "Mon, Sep 9, 2024 - Sun, Sep 15, 2024", fontSize: twelve),
          const Align(
            alignment: Alignment.topRight,
            child: CommonButtonWidget(color: Colors.white, text: manageWidget),
          ),
          const SizedBox(
            height: ten,
          ),
          Card(
            color: Colors.white,
            elevation: zero,
            child: isMobile
                ? IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: commonRowView(
                                isIconShow: true,
                                graph: commonLineGraph(
                                    color: Colors.green.withOpacity(zero3),
                                    lineColor: Colors.green))),
                        isMobile ? const Divider() : const SizedBox.shrink(),
                        Expanded(
                            child: commonRowView(
                                text: workOnThis.toUpperCase(),
                                value: "5:18:23",
                                isIconShow: false,
                                graph: commonLineGraph(
                                    color: Colors.blue.withOpacity(zero3),
                                    lineColor: Colors.blue))),
                        isMobile ? const Divider() : const SizedBox.shrink(),
                        Expanded(
                            child: commonRowView(
                                text: earnedThisWeek.toUpperCase(),
                                value: "\$0.00",
                                isIconShow: true,
                                graph: commonLineGraph(
                                    color: Colors.amber.withOpacity(zero3),
                                    lineColor: Colors.amber))),
                        isMobile ? const Divider() : const SizedBox.shrink(),
                        Expanded(
                            child: commonRowView(
                                text: projectWorked.toUpperCase(),
                                value: "2",
                                isIconShow: false,
                                graph: commonLineGraph(
                                    color: Colors.teal.withOpacity(zero3),
                                    lineColor: Colors.teal)))
                      ],
                    ),
                  )
                : IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: commonRowView(
                                isIconShow: true,
                                graph: commonLineGraph(
                                    color: Colors.green.withOpacity(zero3),
                                    lineColor: Colors.green))),
                        commonVerticalLine(),
                        Expanded(
                            child: commonRowView(
                                text: workOnThis.toUpperCase(),
                                value: "5:18:23",
                                isIconShow: false,
                                graph: commonLineGraph(
                                    color: Colors.blue.withOpacity(zero3),
                                    lineColor: Colors.blue))),
                        commonVerticalLine(),
                        Expanded(
                            child: commonRowView(
                                text: earnedThisWeek.toUpperCase(),
                                value: "\$0.00",
                                isIconShow: true,
                                graph: commonLineGraph(
                                    color: Colors.amber.withOpacity(zero3),
                                    lineColor: Colors.amber))),
                        commonVerticalLine(),
                        Expanded(
                            child: commonRowView(
                                text: projectWorked.toUpperCase(),
                                value: "2",
                                isIconShow: false,
                                graph: commonLineGraph(
                                    color: Colors.teal.withOpacity(zero3),
                                    lineColor: Colors.teal)))
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  commonRowView(
      {String? text, String? value, required bool isIconShow, Widget? graph}) {
    return Padding(
      padding: const EdgeInsets.all(fifteen),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: CommonTextWidget(
                        fontWeight: FontWeight.w700,
                        fontSize: fourteen,
                        text: text ?? weeklyActivity.toUpperCase()),
                  ),
                  isIconShow == true
                      ? Container(
                          margin: const EdgeInsets.only(left: eight),
                          width: eighteen,
                          height: eighteen,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.grey, width: one)),
                          child: const Icon(
                            Icons.question_mark,
                            color: Colors.grey,
                            size: ten,
                          ))
                      : const SizedBox.shrink(),
                ],
              ),
              const Icon(
                Icons.more_vert,
                color: Colors.grey,
              ),
            ],
          ),
          const SizedBox(
            height: twenty,
          ),
          CommonTextWidget(
              fontWeight: FontWeight.w400,
              fontSize: nineteen,
              text: value ?? "60%".toUpperCase()),
          const SizedBox(
            height: ten,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget(
                  fontWeight: FontWeight.w400,
                  fontSize: fourteen,
                  text: value ?? "------".toUpperCase()),
              graph ?? const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }

  commonLineGraph({Color? color, Color? lineColor}) {
    return SizedBox(
      height: forty,
      width: oneHundred,
      child: LineChart(LineChartData(
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
            )),
            rightTitles: const AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
            )),
            topTitles: const AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
            )),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: false,
              reservedSize: forty,
              getTitlesWidget: (value, meta) {
                const style = TextStyle(
                  fontSize: fourteen,
                  fontWeight: FontWeight.bold,
                );
                String text;
                switch (value.toInt()) {
                  case 0:
                    text = jan;
                    break;
                  case 1:
                    text = feb;
                    break;
                  case 2:
                    text = march;
                    break;
                  case 3:
                    text = apr;
                    break;
                  case 4:
                    text = may;
                    break;
                  default:
                    text = '';
                    break;
                }
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: Text(text, style: style),
                );
              },
            ))),
        lineBarsData: [
          LineChartBarData(
            color: lineColor ?? Colors.blue,
            spots: [
              const FlSpot(0, 1),
              const FlSpot(1, 3),
              const FlSpot(2, 2),
              const FlSpot(3, 4),
              const FlSpot(4, 3),
              const FlSpot(5, 5),
            ],
            isCurved: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
                show: true, color: color ?? Colors.blue.withOpacity(zero3)),
          ),
        ],
        minX: 0,
        maxX: 5,
        minY: 0,
        maxY: 6,
      )),
    );
  }
}
