import 'package:flutter/foundation.dart';

class AuthViewModel extends ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String email;
  String password;

  String userId;

  Future<String> login() async {
    loading = true;
    await Future.delayed(Duration(seconds: 3));
    
    loading = false;
    return email + "|" + password;
  }
}
