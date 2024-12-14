import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  final String baseUrl = "https://test.vehup.com/api/";
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse("${baseUrl}vendor-login"),
        body: {
          "email": email,
          "password": password,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          "status": false,
          "message": "Server error: ${response.statusCode}"
        };
      }
    } catch (e) {
      return {"status": false, "message": "Error: $e"};
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<Map<String, dynamic>> addRequirement(Map<String, String> data) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');
      print("Token saved: $token");
      if (token == null) {
        return {
          "status": false,
          "message": "No token found, please login again"
        };
      }
      print("Sending data: $data");

      var response = await http.post(
        Uri.parse("${baseUrl}add-requirement"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {
          "status": false,
          "message": "Server error: ${response.statusCode}"
        };
      }
    } catch (e) {
      return {"status": false, "message": "Error: $e"};
    }
  }
}
