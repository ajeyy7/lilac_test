import 'package:flutter/material.dart';
import 'package:lilac_test/api_service/apiservices.dart';

class LoginViewModel with ChangeNotifier {
  final ApiServices _apiServices = ApiServices();

  bool isLoading = false;
  String? errorMessage;

  Future<bool> login(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    var response = await _apiServices.login(email, password);

    isLoading = false;
    if (response['status'] == true) {
      String token = response['token'];
      await _apiServices.saveToken(token);

      notifyListeners();
      return true;
    } else {
      errorMessage = response['message'];
      notifyListeners();
      return false;
    }
  }
}
