import 'dart:async';

import 'package:demo/core/color.dart';
import 'package:demo/core/router/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginProvider with  ChangeNotifier{
  bool _obscureText = true;
  String _password = '';
  String get password => _password;
  bool get obscureText => _obscureText;

  bool _isChecked = false;

  bool get isChecked => _isChecked;
  Color get checkColor => _isChecked ? colorDarkBlue :colorDarkBlue; // Change colors as needed

  void toggleCheckbox() {
    _isChecked = !_isChecked;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  redirectToForgotScreen({required BuildContext context}){
    Navigator.pushNamed(context, forgotPasswordScreen);
  }

  redirectToSignUp({required BuildContext context}){
    Navigator.pushNamed(context, signUpScreen);
  }

  redirectToHomeScreen({required BuildContext context}){
    Navigator.pushNamedAndRemoveUntil(context, dashboardScreen,(Route<dynamic> route) => false);
  }
  redirectToLogin({required BuildContext context}){
    Navigator.pushNamedAndRemoveUntil(context, loginScreen,(Route<dynamic> route) => false);
  }
  //===========================================Slider
  final List<String> _imageUrls = [
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
  ];

  List<String> get imageUrls => _imageUrls;

  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;

  late PageController _pageController;
  PageController get pageController => _pageController;

  Timer? _timer;

  void initialize(PageController pageController) {
    _pageController = pageController;
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        _currentPageIndex = (_currentPageIndex + 1) % _imageUrls.length;
        _pageController.animateToPage(
          _currentPageIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }
}
