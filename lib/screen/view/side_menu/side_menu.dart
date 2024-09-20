import 'package:demo/core/Responsive.dart';
import 'package:demo/core/color.dart';
import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/image_path.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';


class SideMenu extends StatelessWidget {
  const SideMenu(
      {super.key, required this.provider, required this.onItem});

  final DashboardProvider provider;
  final Function onItem;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: size.height * zero02,
        ),
        SizedBox(
            width: size.width * zero03,
            height: size.height * zero03,
            child: Image.asset(icLogo)),
        SizedBox(
          height: size.height * zero02,
        ),
        const Divider(
          thickness: zero3,
        ),
        _buildExpansionTile(context,
            showTrailingIcon: false,
            title: dashboard,
            index: 123,
            
            onTapValue: onItem),
        _buildExpansionTile(
          context,
          onTapValue: (){},
          icon: icTeam,
          title: timeSheet,
          index: 1,
          children: <Widget>[
            _buildDrawerItem(
                context: context,
                title: viewEdit,
                index: 0,
                onTapValue: onItem),
            _buildDrawerItem(
                context: context,
                title: approval,
                index: 1,
                onTapValue: onItem),
          ],
        ),
        _buildExpansionTile(
          context,
          onTapValue: (){},
          icon: icActivity,
          title: activity,
          index: 2,
          children: <Widget>[
            _buildDrawerItem(
                context: context,
                title: screenshots,
                index: 2,
                onTapValue: onItem),
            _buildDrawerItem(
                context: context, title: apps, index: 3, onTapValue: onItem),
            _buildDrawerItem(
                context: context, title: uRLs, index: 4, onTapValue: onItem),
          ],
        ),
        _buildExpansionTile(context,
            title: insights,
            index: 124,

            showTrailingIcon: false,
            onTapValue: onItem),
        _buildExpansionTile(
          context,
          onTapValue: (){},
          icon: icProject,
          title: projectManagement,
          index: 4,
          children: <Widget>[
            _buildDrawerItem(
                context: context, title: project, index: 5, onTapValue: onItem),
            _buildDrawerItem(
                context: context, title: toDos, index: 6, onTapValue: onItem),
          ],
        ),
        _buildExpansionTile(
          context,
          icon: icCalendar,
          onTapValue: (){},
          title: calenders,
          index: 8,
          children: <Widget>[
            _buildDrawerItem(
                context: context,
                title: schedules,
                index: 14,
                onTapValue: onItem),
            _buildDrawerItem(
                context: context,
                title: timeOffRequest,
                index: 15,
                onTapValue: onItem),

          ],
        ),
        _buildExpansionTile(
          context,
          icon: icReports,
          onTapValue: (){},
          title: report,
          index: 5,
          children: <Widget>[
            _buildDrawerItem(
                context: context,
                title: timeActivity,
                index: 7,
                onTapValue: onItem),
            _buildDrawerItem(
                context: context,
                title: dailyTotal,
                index: 8,
                onTapValue: onItem),
            _buildDrawerItem(
                context: context,
                title: amountOWed,
                index: 9,
                onTapValue: onItem),
            _buildDrawerItem(
                context: context,
                title: payment,
                index: 10,
                onTapValue: onItem),
            _buildDrawerItem(
                context: context,
                title: allReport,
                index: 11,
                onTapValue: onItem),
          ],
        ),

        _buildExpansionTile(
          context,
          title: team,
          icon: icTeam,
          onTapValue: onItem,
          index: 125,
          showTrailingIcon: false,
        ),
        _buildExpansionTile(
          context,
          onTapValue: (){},
          icon: icFinancial,
          title: financials,
          index: 7,
          children: <Widget>[
            _buildDrawerItem(
                context: context,
                title: invoices,
                index: 12,
                onTapValue: onItem),
            _buildDrawerItem(
                context: context,
                title: expenses,
                index: 13,
                onTapValue: onItem),
          ],
        ),
      ],
    );
  }

  Widget _buildDrawerItem(
      {required BuildContext context,
      required String title,
      required int index,
      Function? onTapValue}) {
    var isMobile=Responsive.isMobile(context);
    return Container(

      margin: const EdgeInsets.only(
          left: 50, right: twenty, top: 0, bottom: 2  ),
      decoration: BoxDecoration(
          color: provider.selectedIndex == index
              ? Colors.grey.withOpacity(zero30)
              : null,
          borderRadius: BorderRadius.circular(eight)),
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.only(left: ten),
        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
        selectedColor: Colors.blue,
        title: CommonTextWidget(
            fontWeight: FontWeight.w400,
            fontSize: twelve,
            text: title,
            color: provider.selectedIndex == index ? Colors.blue : Colors.black),
        tileColor: provider.selectedIndex == index
            ? Colors.blue.withOpacity(zero2)
            : null,
        selected: provider.selectedIndex == index,
        onTap: () {
          provider.setIndex = index;
          onTapValue!(index);
          isMobile?Navigator.pop(context):(); // Close the drawer
        },
      ),
    );
  }

  Widget _buildExpansionTile(BuildContext context,
      {required String title,
      required int index,
      List<Widget>? children,
      bool showTrailingIcon = true,
      required Function? onTapValue,
      String ? icon}) {
    var isMobile=Responsive.isMobile(context);
    return Theme(
      data: Theme.of(context)
          .copyWith(dividerColor: Colors.grey.withOpacity(zero50)),
      child: ExpansionTile(
        iconColor: Colors.blue,
        showTrailingIcon: showTrailingIcon,
        leading:ImageIcon(
          color: provider.expandedIndex == index ? Colors.blue : Colors.black,
            size: twenty,
            AssetImage(icon??icHome)),
        title: CommonTextWidget(
            fontWeight: FontWeight.w400,
            text: title,
            color: provider.expandedIndex == index ? Colors.blue : Colors.black),
        backgroundColor: colorMenu,
        initiallyExpanded: provider.expandedIndex == index,
        onExpansionChanged: (expanded) {
          if (expanded) {

            provider.setExpandIndex = index;
            onTapValue!(index);
            isMobile?Navigator.pop(context):();

          } else {

            provider.setExpandIndex = -1;
            onTapValue!(index);
          }
        },
        children: children ?? [],
      ),
    );
  }
}
