import 'dart:math';

import 'package:demo/provider/model/common_model.dart';

import 'package:flutter/cupertino.dart';

import '../screen/view/page/time_sheet_menu/model/time_sheet_model.dart';


class DashboardProvider with ChangeNotifier {
  bool _isLoding = false;

  bool get isLoding => _isLoding;

  bool _isHovering = false;

  bool get isHovering => _isHovering;

  void setHovering(bool value) {
    _isHovering = value;
    notifyListeners();
  }

  int? _hoveredIndex;

  int? get hoveredIndex => _hoveredIndex;

  void setHoveredIndex(int? index) {
    _hoveredIndex = index;
    notifyListeners();
  }

  //========================================================================Menu
  int _selectedIndex = -1; // Track selected index
  int _onSelectedIndex = -1; // Track selected index
  int _expandedIndex = -1; // Track expanded index

  int get onSelectedIndex => _onSelectedIndex;

  int get selectedIndex => _selectedIndex;

  int get expandedIndex => _expandedIndex;

  set setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  set setExpandIndex(int index) {
    _expandedIndex = index;
    notifyListeners();
  }

  void onItemSelectedValue(int index) {
    _onSelectedIndex = index;
    print('=======sdsddsdsdsdsd===$index');
  }

  //======================================================Tababr============================
  // int _selectedIndex = 0;

  // int get selectedIndex => _selectedIndex;

  //==============================Load Recent Data==================================
  List<CommonModel> _itemRecent = [];

  List<CommonModel> get itemRecent => _itemRecent;

  void loadRecentData() async {
    _isLoding = true;
    notifyListeners();
    _itemRecent = [
      CommonModel(
          value: 25,
          url:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqqKJEWhvplXM7DVBobPqRebwAbibueb31c9TCIaL_KHO4wAoFM1CzQ7ixf42OE-Awa6A&usqp=CAU",
          startTime: "Wed, Sep 11, 2024 6:50 pm"),
      CommonModel(
          value: 10,
          url: "https://picsum.photos/200/300",
          startTime: "Wed, Sep 11, 2024 6:50 pm"),
      CommonModel(
          value: 60,
          url:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqqKJEWhvplXM7DVBobPqRebwAbibueb31c9TCIaL_KHO4wAoFM1CzQ7ixf42OE-Awa6A&usqp=CAU",
          startTime: "Wed, Sep 11, 2024 6:50 pm"),
      CommonModel(
          value: 48,
          url: "https://picsum.photos/seed/picsum/200/300",
          startTime: "Wed, Sep 11, 2024 6:50 pm"),
      CommonModel(
          value: 89,
          url:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqqKJEWhvplXM7DVBobPqRebwAbibueb31c9TCIaL_KHO4wAoFM1CzQ7ixf42OE-Awa6A&usqp=CAU",
          startTime: "Wed, Sep 11, 2024 6:50 pm"),
      CommonModel(
          value: 99,
          url: "https://picsum.photos/200/300?grayscale",
          startTime: "Wed, Sep 11, 2024 6:50 pm"),
    ];
    _isLoding = false;
    notifyListeners();
  }

//==============================Load TimeSheet Data==================================
  final int _rowsPerPage = 5;

  int? get rowsPerPage => _rowsPerPage;
  int _currentPage = 0; // Current page index
  int _rowPage = 0; // Current page index
  int get currentPage => _currentPage;
  int get rowPage => _rowPage;

  set selectedPage(int item) {
    _currentPage = item;
    notifyListeners();
  }
  set selectedRowPage(int item) {
    _rowPage = item;
    notifyListeners();
  }


  List<CommonModel> _itemTimeSheet = [];

  List<CommonModel> get itemTimeSheet => _itemTimeSheet;

  void loadTimeSheet() async {
    _isLoding = true;
    notifyListeners();
    _itemTimeSheet = [
      CommonModel(
          title: "i- Mobile App Development",
          date: "Wed, Sep 11, 2024",
          startTime: "11:30 am",
          endTime: "11:50 am",
          duration: "0:20:00"),
      CommonModel(
          title: "i- Mobile App Development",
          date: "Wed, Sep 11, 2024",
          startTime: "12:06 pm",
          endTime: "12:32 pm",
          duration: "0:26:03"),
      CommonModel(
          title: "i- Mobile App Development",
          date: "Wed, Sep 11, 2024",
          startTime: "12:38 pm",
          endTime: "1:14 pm",
          duration: "0:36:19"),
      CommonModel(
          title: "i- Mobile App Development",
          date: "Wed, Sep 11, 2024",
          startTime: "1:45 pm",
          endTime: "4:21 pm",
          duration: "2:36:05"),
      CommonModel(
          title: "i- Mobile App Development",
          date: "Wed, Sep 11, 2024",
          startTime: "1:45 pm",
          endTime: "4:21 pm",
          duration: "2:36:05"),
    ];
    _isLoding = false;
    notifyListeners();
  }

//==============================Project Data==================================

  List<CommonModel> _itemProjectList = [];

  List<CommonModel> get itemProjectList => _itemProjectList;

  void loadProjectList() async {
    _isLoding = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _itemProjectList = [
      CommonModel(
          title: "i- Mobile App Development",
          value: 58,
          startTime: "10:22:27",
          progressValue: 0.5),
      CommonModel(
          title: "i- Mobile App Upgrade",
          value: 68,
          startTime: "8:18:31",
          progressValue: 0.1),
    ];
    _isLoding = false;
    notifyListeners();
  }

  //====================================================Generate Rondom color ====================================================
  List<Color> _colors = [];

  List<Color> get colors => _colors;

  DashboardProvider() {
    _generateRandomColors(20); // Generate 20 random colors initially
  }

  void _generateRandomColors(int count) {
    _colors = List.generate(count, (_) => _getRandomColor());
    notifyListeners();
  }

  Color _getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
    );
  }

  //==============================App and URl Data==================================

  List<CommonModel> _itemAppList = [];

  List<CommonModel> get itemAppList => _itemAppList;

  void loadAppList() async {
    _isLoding = true;
    notifyListeners();
    _itemAppList = [
      CommonModel(
          title: "Android Studio", startTime: "9:03:13", progressValue: 0.3),
      CommonModel(title: "localhost", startTime: "9:03:13", progressValue: 0.1),
      CommonModel(
          title: "app.hubstaff.com", startTime: "9:03:13", progressValue: 0.4),
      CommonModel(title: "Hubstaff", startTime: "9:03:13", progressValue: 0.0),
      CommonModel(
          title: "google.com", startTime: "9:03:13", progressValue: 0.6),
    ];
    _isLoding = false;
    notifyListeners();
  }

  //==============================To Dos ==================================

  List<CommonModel> _itemTodoList = [];

  List<CommonModel> get itemTodoList => _itemTodoList;

  void loadTodoList() async {
    _isLoding = true;
    notifyListeners();
    _itemTodoList = [
      CommonModel(
          title: "BUILD Windows Application app",
          startTime: "9:03:13",
          progressValue: 0.3),
      CommonModel(
          title: "BUILD Windows Application app",
          startTime: "9:03:13",
          progressValue: 0.1),
    ];
    _isLoding = false;
    notifyListeners();
  }

  //==============================Load Edit Time Sheet and View==================================
  //==============================Daily load ====================================================
  List<TimeSheetModel> _itemViewAndTimeSheet = [];

  List<TimeSheetModel> get itemViewAndTimeSheet => _itemViewAndTimeSheet;

  void loadViewAndEditTimeSheet() async {
    _isLoding = true;
    notifyListeners();
    _itemViewAndTimeSheet = [
      TimeSheetModel(title: "Today:1:05:55", subItems: [
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "BUILD Windows Application app",
            activity: "22%",
            idle: "0",
            manual: "0",
            duration: "0:17:34",
            time: "9:46 am - 10:03 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "BUILD Windows Application app",
            activity: "66%",
            idle: "0",
            manual: "0",
            duration: "0:23:37",
            time: "10:11 am - 10:35 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "No to-do",
            activity: "14%%",
            idle: "0",
            manual: "0",
            duration: "0:24:44",
            time: "10:35 am - 11:00 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "BUILD Windows Application app",
            activity: "22%",
            idle: "0",
            manual: "0",
            duration: "0:17:34",
            time: "9:46 am - 10:03 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "BUILD Windows Application app",
            activity: "66%",
            idle: "0",
            manual: "0",
            duration: "0:23:37",
            time: "10:11 am - 10:35 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "No to-do",
            activity: "14%%",
            idle: "0",
            manual: "0",
            duration: "0:24:44",
            time: "10:35 am - 11:00 am"),
      ]),
      TimeSheetModel(title: "Thu, Sep 12, 2024:8:31:21", subItems: [
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "BUILD Windows Application app",
            activity: "22%",
            idle: "0",
            manual: "0",
            duration: "0:17:34",
            time: "9:46 am - 10:03 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "BUILD Windows Application app",
            activity: "66%",
            idle: "0",
            manual: "0",
            duration: "0:23:37",
            time: "10:11 am - 10:35 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "No to-do",
            activity: "14%%",
            idle: "0",
            manual: "0",
            duration: "0:24:44",
            time: "10:35 am - 11:00 am"),
      ]),
      TimeSheetModel(title: "Wed, Sep 11, 2024:8:22:28", subItems: [
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "BUILD Windows Application app",
            activity: "22%",
            idle: "0",
            manual: "0",
            duration: "0:17:34",
            time: "9:46 am - 10:03 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "BUILD Windows Application app",
            activity: "66%",
            idle: "0",
            manual: "0",
            duration: "0:23:37",
            time: "10:11 am - 10:35 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "No to-do",
            activity: "14%%",
            idle: "0",
            manual: "0",
            duration: "0:24:44",
            time: "10:35 am - 11:00 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "No to-do",
            activity: "14%%",
            idle: "0",
            manual: "0",
            duration: "0:24:44",
            time: "10:35 am - 11:00 am"),
      ]),
      TimeSheetModel(title: "Tue, Sep 10, 2024:8:23:47", subItems: [
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "BUILD Windows Application app",
            activity: "22%",
            idle: "0",
            manual: "0",
            duration: "0:17:34",
            time: "9:46 am - 10:03 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "BUILD Windows Application app",
            activity: "66%",
            idle: "0",
            manual: "0",
            duration: "0:23:37",
            time: "10:11 am - 10:35 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "No to-do",
            activity: "14%%",
            idle: "0",
            manual: "0",
            duration: "0:24:44",
            time: "10:35 am - 11:00 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "BUILD Windows Application app",
            activity: "22%",
            idle: "0",
            manual: "0",
            duration: "0:17:34",
            time: "9:46 am - 10:03 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "BUILD Windows Application app",
            activity: "66%",
            idle: "0",
            manual: "0",
            duration: "0:23:37",
            time: "10:11 am - 10:35 am"),
        TimeSheetSubModel(
            project: "i- Mobile App Development",
            companyName: "Redefine Solutions LLC",
            taskName: "No to-do",
            activity: "14%%",
            idle: "0",
            manual: "0",
            duration: "0:24:44",
            time: "10:35 am - 11:00 am"),
      ]),
    ];
    _isLoding = false;
    notifyListeners();
  }

  //=================================================================================
  List<TimeSheetModel> _itemLoadWeekly = [];

  List<TimeSheetModel> get itemLoadWeekly => _itemLoadWeekly;

  void loadWeeklyData() async {
    _isLoding = true;
    notifyListeners();
    _itemLoadWeekly = [
      TimeSheetModel(title: "", dayList: [
        DayModel(
            project: "i- Mobile App Development",
            taskName: "BUILD Windows Application app",
            mon: "1:53:16",
            total: "1:53:16"),
        DayModel(
            project: "i- Mobile App Development",
            taskName: "BUILD Windows Application app",
            tue: "10:05:16",
            fri: "3:11:24",
            total: "3:16:40"),
        DayModel(
            project: "i- Mobile App Development",
            taskName: "BUILD Windows Application app",
            tue: "0:04:47",
            fri: "3:11:24",
            total: "0:04:47"),
        DayModel(
            project: "i- Mobile App Development",
            taskName: "BUILD Windows Application app",
            tue: "8:13:44",
            total: "8:13:44"),
        DayModel(
            project: "i- Mobile App Development",
            taskName: "BUILD Windows Application app",
            wed: "8:22:28",
            thu: "8:31:21",
            total: "17:45:14"),
      ], subItems: []),
    ];
    _isLoding = false;
    notifyListeners();
  }


//=========================================Popular Report================================
  List<CommonModel> _itemPopularReports = [];

  List<CommonModel> get itemPopularReports => _itemPopularReports;

  void loadPopularReport() async {
    _isLoding = true;
    notifyListeners();
    _itemPopularReports = [
      CommonModel(
          title: "Time & Activity",
          isFev: true,
          date: "See team members time worked, activity levels, and\namount earned per project or to do",),
      CommonModel(
          title: "Amount Owed",
          date: "See team members time worked, activity levels, and\namount earned per project or to do",
        isFev: true,),
      CommonModel(
          title: "Daily Totals",
          date: "See team members time worked, activity levels, and\namount earned per project or to do",
          isFev: true,),

    ];
    _isLoding = false;
    notifyListeners();
  }
  //=========================================Popular Reports================================
  List<CommonModel> _itemPopular= [];

  List<CommonModel> get itemPopular => _itemPopular;

  void loadPopularReports() async {
    _isLoding = true;
    notifyListeners();
    _itemPopular = [
      CommonModel(
        title: "Time & Activity",
        isFev: true,
        date: "See team member time worked, activity levels , and\n amounts earned per project or to do.",),
      CommonModel(
        title: "Amounts owed",
        isFev: true,
        date: "See how much the hourly paid team member are currently owed",),
      CommonModel(
        title: "Daily Totals",
        isFev: true,
        date: "See team members time worked activity levels and amount earned per days.",),

    ];
    _isLoding = false;
    notifyListeners();
  }
  //=========================================general ================================
  List<CommonModel> _itemGeneral = [];

  List<CommonModel> get itemGeneral => _itemGeneral;

  void loadGeneral() async {
    _isLoding = true;
    notifyListeners();
    _itemGeneral = [
      CommonModel(
        title: "Work Session",
        isFev: false,
        date: "See the start and stop times for team members",),
      CommonModel(
        title: "Apps & URLs",
        date: "See the start and stop times for team members",
        isFev: false,),
      CommonModel(
        title: "Manual Time edits",
        date: "See the start and stop times for team members",
        isFev: false,),
      CommonModel(
        title: "TimeSheet Approval",
        date: "See the start and stop times for team members",
        isFev: false,),
      CommonModel(
        title: "Expenses",
        date: "See the start and stop times for team members",
        isFev: false,),
      CommonModel(
        title: "Work breaks",
        date: "See the start and stop times for team members",
        isFev: false,),

    ];
    _isLoding = false;
    notifyListeners();
  }

  //=========================================paymment Report================================
  List<CommonModel> _itemPayment = [];

  List<CommonModel> get itemPayment => _itemPayment;

  void loadPayment() async {
    _isLoding = true;
    notifyListeners();
    _itemPayment = [
      CommonModel(
        title: "Payment",
        isFev: true,
        date: "See the start and stop times for team members",),
    ];
    _isLoding = false;
    notifyListeners();
  }

  //=========================================paymment Report================================
  List<CommonModel> _itemBudgetLimit = [];

  List<CommonModel> get itemBudgetLimit => _itemBudgetLimit;

  void loadBudgetLimit() async {
    _isLoding = true;
    notifyListeners();
    _itemBudgetLimit = [
      CommonModel(
        title: "Weekly Limits",
        isFev: false,
        date: "See the start and stop times for team members",),
      CommonModel(
        title: "Daily Limits",
        isFev: false,
        date: "See the start and stop times for team members",),
    ];
    _isLoding = false;
    notifyListeners();
  }

  //=========================================Time of Report================================
  List<CommonModel> _itemItemOFF = [];

  List<CommonModel> get itemItemOFF => _itemItemOFF;

  void loadTimeOff() async {
    _isLoding = true;
    notifyListeners();
    _itemItemOFF = [
      CommonModel(
        title: "Time off balances",
        isFev: false,
        date: "See the start and stop times for team members",),
      CommonModel(
        title: "Time off transaction",
        isFev: false,
        date: "See the start and stop times for team members",),
    ];
    _isLoding = false;
    notifyListeners();
  }

  //=========================================Time of Report================================
  List<CommonModel> _itemInvoice = [];

  List<CommonModel> get itemInvoice => _itemInvoice;

  void loadTimeInvoice() async {
    _isLoding = true;
    notifyListeners();
    _itemInvoice = [
      CommonModel(
        title: "Team Invoice",
        isFev: false,
        date: "See the start and stop times for team members",),
      CommonModel(
        title: "Time invoices again",
        isFev: false,
        date: "See the start and stop times for team members",),
    ];
    _isLoding = false;
    notifyListeners();
  }
  //=========================================Schedule================================
  List<CommonModel> _itemSchedule= [];

  List<CommonModel> get itemSchedule => _itemSchedule;

  void loadSchedule() async {
    _isLoding = true;
    notifyListeners();
    _itemSchedule = [
      CommonModel(
        title: "Shift attendance",
        isFev: false,
        date: "See the start and stop times for team members",),

    ];
    _isLoding = false;
    notifyListeners();
  }

  //=========================================Amount owed  Reports================================
  List<OuterItem> _itemOuterItem= [];

  List<OuterItem> get itemOuterItem => _itemOuterItem;

  void loadAmountOwed() async {
    _isLoding = true;
    notifyListeners();
    _itemOuterItem = [
      OuterItem(title: "Mon, Sep 9, 2024", innerItems: [
        InnerItem(amount:"\$0.00",currentRate: "No rate set	",totalHours:"1:53:16	"),
      ]),
      OuterItem(title: "Tue, Sep 10, 2024", innerItems: [
        InnerItem(amount:"\$0.00",currentRate: "No rate set	",totalHours:"1:53:16	"),
      ]),
      OuterItem(title: "Mon, Sep 9, 2024", innerItems: [
        InnerItem(amount:"\$0.00",currentRate: "No rate set	",totalHours:"1:53:16	"),
      ]),
      OuterItem(title: "Tue, Sep 10, 2024", innerItems: [
        InnerItem(amount:"\$0.00",currentRate: "No rate set	",totalHours:"1:53:16	"),
      ]),
      OuterItem(title: "Mon, Sep 9, 2024", innerItems: [
        InnerItem(amount:"\$0.00",currentRate: "No rate set	",totalHours:"1:53:16	"),
      ]),
      OuterItem(title: "Tue, Sep 10, 2024", innerItems: [
        InnerItem(amount:"\$0.00",currentRate: "No rate set	",totalHours:"1:53:16	"),
      ]),
      OuterItem(title: "Mon, Sep 9, 2024", innerItems: [
        InnerItem(amount:"\$0.00",currentRate: "No rate set	",totalHours:"1:53:16	"),
      ]),
      OuterItem(title: "Tue, Sep 10, 2024", innerItems: [
        InnerItem(amount:"\$0.00",currentRate: "No rate set	",totalHours:"1:53:16	"),
      ])

    ];
    _isLoding = false;
    notifyListeners();
  }
//=========================================general ================================
}
