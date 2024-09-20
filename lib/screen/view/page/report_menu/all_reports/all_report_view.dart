import 'package:demo/core/Responsive.dart';
import 'package:demo/core/color.dart';
import 'package:demo/core/common/common_text_field_widget.dart';
import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/image_path.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/dashboard_provider.dart';
import 'package:demo/provider/model/common_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllReportView extends StatelessWidget {
  const AllReportView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var isMobile = Responsive.isMobile(context);
    var isTablet = Responsive.isTablet(context);
    final itemProvider = Provider.of<DashboardProvider>(context);

    // Load items when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemProvider.loadGeneral();
      itemProvider.loadPayment();
      itemProvider.loadBudgetLimit();
      itemProvider.loadTimeOff();
      itemProvider.loadTimeOff();
      itemProvider.loadTimeInvoice();
      itemProvider.loadSchedule();
      itemProvider.loadPopularReports();
    });

    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      return Container(
        color: colorBody,
        padding: const EdgeInsets.all(twenty),
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,

               children: [

               const CommonTextWidget(text: report, left: ten,color: Colors.black,fontSize: twenty,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [

                const Row(
                  children: [
                    Icon(Icons.timer),
                    CommonTextWidget(text: scheduledReports,left: seven,fontWeight: FontWeight.w400,color: Colors.black,)
                  ],
                ),
                Container(
                      margin: const EdgeInsets.only(left: twenty),
                    width: 200,
                    child: const CommonTextFieldWidget(hint: searchReport,borderRadius: twenty,
                    prefixIcon: Icon(Icons.search,color: Colors.grey,),))
              ],)

             ],),
              commonTitle(top: 40),
              SizedBox(
                  height: isMobile ? null : size.height * zero19,
                  child: PopularReport(
                    list: provider.itemPopular,
                    size: size,
                    isMobile: isMobile,
                  )),
              commonTitle(title: general, top: fourteen),
              SizedBox(
                  height: isMobile ? null : size.height * 0.1 ,
                  child: CommonListView(
                    list: provider.itemGeneral,
                    size: size,
                    isMobile: isMobile,
                  )),
              commonTitle(title: payment, top: fiftySix),
              SizedBox(
                  height: isMobile ? null : size.height * zero09,
                  child: CommonListView(
                    list: provider.itemPayment,
                    size: size,
                    isMobile: isMobile,
                  )),
              commonTitle(title: budgetLimit, top: fiftySix),
              SizedBox(
                  height: isMobile ? null : size.height * zero09,
                  child: CommonListView(
                    list: provider.itemBudgetLimit,
                    size: size,
                    isMobile: isMobile,
                  )),
              commonTitle(title: timeOFF, top: fiftySix),
              SizedBox(
                  height: isMobile ? null : size.height * zero09,
                  child: CommonListView(
                    list: provider.itemItemOFF,
                    size: size,
                    isMobile: isMobile,
                  )),
              commonTitle(title: invoices, top: fiftySix),
              SizedBox(
                  height: isMobile ? null : size.height * zero09,
                  child: CommonListView(
                    list: provider.itemInvoice,
                    size: size,
                    isMobile: isMobile,
                  )),
              commonTitle(title: schedules, top: fiftySix),
              SizedBox(
                  height: isMobile ? null : size.height * zero09,
                  child: CommonListView(
                    list: provider.itemSchedule,
                    size: size,
                    isMobile: isMobile,
                  )),
              const SizedBox(
                height: twenty,
              ),
            ],
          ),
        ),
      );
    });
  }

  commonTitle({String? title, double? top}) {
    return CommonTextWidget(
      text: title ?? popularReports,
      fontSize: sixteen,
      left: ten,
      top: top,
      color: Colors.black,
    );
  }
}
class PopularReport extends StatelessWidget {
  const PopularReport(
      {super.key,
        required this.list,
        required this.size,
        required this.isMobile});

  final List<CommonModel> list;
  final Size size;
  final bool isMobile;
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        scrollDirection: isMobile ? Axis.vertical : Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: size.width * zero15,
            height: isMobile?size.height*zero2:size.height*zero3,
            margin: const EdgeInsets.only(left: ten, right: ten, top: fourteen),
            decoration: BoxDecoration(
              image: const DecorationImage(image: AssetImage(icImage1)),
                borderRadius: BorderRadius.circular(ten),
                border:
                Border.all(width: one, color: Colors.grey.withOpacity(zero50))),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(zero40),
                borderRadius: BorderRadius.circular(ten),
              ),

              child: Padding(
                padding: const EdgeInsets.all(thirteen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: CommonTextWidget(
                            text: list[index].title,
                            color: Colors.white,
                            fontSize: eighteen,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: list[index].isFev == true
                              ? Colors.yellow
                              : Colors.grey,
                          size: twenty,
                        )
                      ],
                    ),
                    Flexible(child:  CommonTextWidget(
                      text: list[index].date,
                      fontSize: fourteen,
                      top: twentyFive,
                      color: Colors.white,
                    )),

                  ],
                ),
              ),
            ),
          );
        });
  }
}

class CommonListView extends StatelessWidget {
  const CommonListView(
      {super.key,
      required this.list,
      required this.size,
      required this.isMobile});

  final List<CommonModel> list;
  final Size size;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        scrollDirection: isMobile ? Axis.vertical : Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: size.width * zero011,
            height: size.width * zero011,
            margin: const EdgeInsets.only(left: ten, right: ten, top: fourteen),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ten),
                border:
                    Border.all(width: one, color: Colors.grey.withOpacity(zero50))),
            child: Padding(
              padding: const EdgeInsets.all(thirteen),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                        text: list[index].title,
                        color: Colors.black,
                      ),
                      Icon(
                        Icons.star,
                        color: list[index].isFev == true
                            ? Colors.yellow
                            : Colors.grey,
                        size: twenty,
                      )
                    ],
                  ),
                 Flexible(child:  CommonTextWidget(
                   text: list[index].date,
                   fontSize: twelve,
                   top: ten,
                 ))
                ],
              ),
            ),
          );
        });
  }
}
