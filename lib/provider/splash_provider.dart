import 'package:flutter/cupertino.dart';

class SplashProvider with ChangeNotifier {
  final bool _isSplashDone = false;

  bool get isSplashDone => _isSplashDone;

  int _number = 0;

  int get number => _number;

  //=============================================================DropDown==========================================
  String? _selectedItem;

  String? get selectedItem => _selectedItem;

  set selected(String item) {
    _selectedItem = item;
    notifyListeners();
  }

///////////////////////////////////////////Table ////////////////////////////

  final int _rowsPerPage = 5;

  int? get rowsPerPage => _rowsPerPage;
  int _currentPage = 0; // Current page index
  int get currentPage => _currentPage;

  set selectedPage(int item) {
    _currentPage = item;
    notifyListeners();
  }
}
