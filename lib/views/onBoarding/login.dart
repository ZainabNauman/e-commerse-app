import 'package:ecommerse/views/onBoarding/signup.dart';
import 'package:flutter/material.dart';
import '../../utils/string_constant.dart';
import '../dashboard/dashboard_screen.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/textfield_credentials.dart';

class LoginInScreen extends StatelessWidget {
  LoginInScreen({super.key});
  final nameTfController = TextEditingController();
  final passwordTfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              const SizedBox(
                height: 70,
              ),
              const Text(
               "Login In",
                style:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                StringConstant.descriptionSignIn,
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 50),
              CustomTextFieldCredential(
                  hint: StringConstant.name,
                  icon: const Icon(Icons.person),
                  isObscure: false,
                  text: StringConstant.nametext,
                  controller: nameTfController),
              const SizedBox(height: 30),
              CustomTextFieldCredential(
                controller: passwordTfController,
                hint: StringConstant.password,
                isObscure: true,
                text: StringConstant.passwordtext,
                icon: const Icon(Icons.lock),
                sufixicon: const Icon(Icons.visibility_off),
              ),
              const SizedBox(height: 130),
              Center(
                child: CustomButton(
                    color: Colors.white,
                    text: StringConstant.buttonSignIn,
                    onTap: () {
                      if (nameTfController.text.trim().isEmpty ||
                          !RegExp(StringConstant.namepattern)
                              .hasMatch(nameTfController.text)) {
                        showpopup(
                            context, StringConstant.alert, StringConstant.alertDesc);
                      } else if (passwordTfController.text.trim().isEmpty ||
                          passwordTfController.text.length < 8) {
                        showpopup(
                            context, StringConstant.alert, StringConstant.alertDesc);
                      } else {
                        tapsigninbutton(context);
                      }
                    }),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  tapsignuptextbutton(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(StringConstant.nopastaccountSignIn),
                    
                    Text(
                      StringConstant.boldSignUp,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              
              const SizedBox(
                height: 15,
              ),
              
            ]),
      ),
    );
  }

  void showpopup(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
          );
        });
  }

  void tapsigninbutton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }

  void tapsignuptextbutton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpScreen()),
    );
  }
}