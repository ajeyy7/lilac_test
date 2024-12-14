import 'package:flutter/material.dart';
import 'package:lilac_test/view/common/bottombar.dart';
import 'package:lilac_test/view/pages/login_page.dart';
import 'package:lilac_test/view_model/bottom_vm.dart';
import 'package:lilac_test/view_model/login_vm.dart';
import 'package:lilac_test/view_model/requirement_list_vm.dart';
import 'package:lilac_test/view_model/requirements_vm.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => LoginViewModel()),
    ChangeNotifierProvider(create: (_) => BottomVm()),
    ChangeNotifierProvider(create: (_) => RequirementsVm()),
    ChangeNotifierProvider(create: (_) => RequirementViewModel())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        home:  FutureBuilder(
        future: checkLoginStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            if (snapshot.data == true) {
              return BottomBar(); 
            } else {
              return LoginPage(); 
            }
          }
        },
      ),
    );
  }

  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');
    return token != null && token.isNotEmpty;
  }
  }

