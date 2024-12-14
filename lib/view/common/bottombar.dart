import 'package:flutter/material.dart';
import 'package:lilac_test/constants/colors.dart';
import 'package:lilac_test/view/pages/home_page.dart';
import 'package:lilac_test/view/pages/message_page.dart';
import 'package:lilac_test/view/pages/profile_page.dart';
import 'package:lilac_test/view/pages/requirement_page/requirement_page.dart';
import 'package:lilac_test/view/pages/sell_page.dart';
import 'package:lilac_test/view_model/bottom_vm.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomViewModel = Provider.of<BottomVm>(context);
    List<Widget> screens = [
      HomePage(),
      MessagePage(),
      SellPage(),
      RequirementPage(),
      ProfilePage()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primary,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            bottomViewModel.toggle(value);
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Message"),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: "Sell"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: "Requirements"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
      body: screens[bottomViewModel.selected],
    );
  }
}
