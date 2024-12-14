import 'package:flutter/material.dart';
import 'package:lilac_test/constants/colors.dart';
import 'package:lilac_test/view/common/bottombar.dart';
import 'package:lilac_test/view/common/common_button.dart';
import 'package:lilac_test/view/common/textfileds.dart';
import 'package:lilac_test/view_model/login_vm.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
        // appBar: AppBar(),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Group 655.png"))),
          ),
          Text('Login with your email &\n password'),
          MyTextFiled(
            controller: emailController,
            prefixIcon: Image(image: AssetImage('assets/images/sms.png')),
            name: 'email',
            hinttext: 'Enter your email',
          ),
          MyTextFiled(
            controller: passwordController,
            prefixIcon: Image(image: AssetImage('assets/images/lock.png')),
            name: 'password',
            hinttext: 'Enter your password',
          ),
          Text(
            'Forgot password',
            style: TextStyle(color: Colors.blue),
          ),
          CommonButton(
            color: primary,
            widget: loginViewModel.isLoading
                ? CircularProgressIndicator()
                : Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
            onTap: () async {
              await loginViewModel.login(
                  emailController.text.trim(), passwordController.text.trim());
              if (loginViewModel.errorMessage == null) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BottomBar()));
              }
            },
          )
        ],
      ),
    ));
  }
}
