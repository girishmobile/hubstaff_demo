import 'package:demo/core/common/common_error_page.dart';
import 'package:demo/core/responsive.dart';
import 'package:demo/core/color.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/image_path.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/dashboard_provider.dart';
import 'package:demo/screen/view/page/dashboard_menu/dashboard_screen.dart';
import 'package:demo/screen/view/page/expenses/expenses_view.dart';
import 'package:demo/screen/view/page/report_menu/all_reports/all_report_view.dart';
import 'package:demo/screen/view/page/report_menu/amount_owed/amount_owed_view.dart';
import 'package:demo/screen/view/page/report_menu/daily_totals/daily_total_view.dart';
import 'package:demo/screen/view/page/report_menu/payments/payment_view.dart';
import 'package:demo/screen/view/page/time_sheet_menu/timesheet_edit_view.dart';
import 'package:demo/screen/view/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = Responsive.isMobile(context);
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: colorMenu,
        appBar: AppBar(
          toolbarHeight: isMobile ? fiftySix : zero,
          backgroundColor: colorMenu,

        ),


        drawer: isMobile
            ? Drawer(
                backgroundColor: colorMenu,
                child: SideMenu(
                  provider: provider,
                  onItem: provider.onItemSelectedValue,
                ),
              )
            : const SizedBox.shrink(),
        body: Row(
          children: [
            isMobile
                ? const SizedBox.shrink()
                : Expanded(
                    flex: 1,
                    child: SideMenu(
                      provider: provider,
                      onItem: provider.onItemSelectedValue,
                    )),
            Expanded(
              flex: 8,
              child: _buildBodyContent(provider: provider),
            )
          ],
        ),
      );
    });
  }

  Widget _buildBodyContent({required DashboardProvider provider}) {
    switch (provider.onSelectedIndex) {
      case 123:
        return const DashboardScreen();
      case 124:
      //InsightsView
        return const CommonErrorPage();
      case 125:
      //Teams
        return const ExpensesView(
          isButtonShow: true,
          imagePath: icTeamView,
          title: team,
          desc: teamDesc,
        );
      case 0:
        return const TimesheetEditView();
      case 1:
        return const ExpensesView(
          isButtonShow: false,
          imagePath: icApproval,
          title: timeSheetApproval,
          desc: timeSheetApprovalDesc,
        );
      case 2:
        //screenshot
        return const CommonErrorPage();
      case 3:
        return const ExpensesView(
          isButtonShow: true,
          imagePath: icApp,
          title: appActivity,
          desc: appActivityDesc,
        );
      case 4:
        return const ExpensesView(
          isButtonShow: true,
          title: urlActivity,
          desc: urlActivityDesc,
        );
      case 5:
      //InsightsView
        return const CommonErrorPage();
      case 6:
        return const ExpensesView(
          isButtonShow: true,
          imagePath: icToDo,
          title: toDos,
          desc: todosDesc,
        );

      case 7:
        //Time & Activity
        return const CommonErrorPage();
      case 8:
      //dilyTotal
        return const DailyTotalView();
      case 9:
      //amountOWed
        return const AmountOwedView();
      case 10:
      //payment  allReport
        return const PaymentView();
      case 11:
      // allReport
        return const AllReportView();
      case 12:
        return const ExpensesView(
          isButtonShow: true,
          title: invoices,
          desc: invoiceDesc,
          imagePath: icInVoice,
        );

      case 13:
        return const ExpensesView(
          isButtonShow: true,
        );

      case 14:
      //Calender
        return const CommonErrorPage();
      case 15:
      //Calender
        return  const ExpensesView(
          isButtonShow: true,
          imagePath: icHoliday,
          title: timeHoliday,
          desc: timeHolidayDesc,
        );

      default:
        return const DashboardScreen();
    }
  }
}
