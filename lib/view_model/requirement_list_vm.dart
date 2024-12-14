import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lilac_test/model/requirement_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequirementViewModel extends ChangeNotifier {
  RequirementViewModel() {
    fetchRequirements();
  }
  List<Requirement> _requirements = [];
  bool _isLoading = false;

  List<Requirement> get requirements => _requirements;
  bool get isLoading => _isLoading;
  Future<void> fetchRequirements() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');
    _isLoading = true;
    notifyListeners();
    const String apiUrl = "https://test.vehup.com/api/get-vendor-requirements";

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          "Authorization": "Bearer$token",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final List<dynamic> data = responseData['data'];

        _requirements = data.map((item) => Requirement.fromJson(item)).toList();
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
