import 'package:ecommerse/utils/string_constant.dart';
import 'package:ecommerse/views/onBoarding/login.dart';
import 'package:ecommerse/widgets/textfield_credentials.dart';
import 'package:flutter/material.dart';

import '../dashboard/dashboard_screen.dart';
import '../../widgets/custom_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;
  bool isobscure = true;
  final nameTfController = TextEditingController();
  final emailTfController = TextEditingController();
  final passwordTfController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              
              const SizedBox(
                height: 70,
              ),
              Text(
                StringConstant.titleSignUp,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                StringConstant.descriptionSignUp,
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 35),
              CustomTextFieldCredential(
                  hint: StringConstant.email,
                  icon: const Icon(Icons.email),
                  isObscure: false,
                  text: StringConstant.emailtext,
                  controller: emailTfController),
              const SizedBox(height: 10),
              CustomTextFieldCredential(
                  hint: StringConstant.name,
                  icon: const Icon(Icons.person),
                  isObscure: false,
                  text: StringConstant.nametext,
                  controller: nameTfController),
              //isobscure ? Text("Zainab") : Text("Maria"),
              const SizedBox(height: 10),
              //if (!isobscure)
              CustomTextFieldCredential(
                controller: passwordTfController,
                hint: StringConstant.password,
                icon: const Icon(Icons.lock),
                text: StringConstant.passwordtext,
                sufixicon: IconButton(
                  icon:
                      Icon(isobscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      isobscure = !isobscure;
                    });
                  },
                ),
                isObscure: isobscure,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value!;
                      });
                    },
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  Text(
                    StringConstant.termscondition,
                    maxLines: 1,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomButton(
                    color: Colors.white,
                    text: StringConstant.buttonSignUp,
                    onTap: () {
                      if (nameTfController.text.trim().isEmpty ||
                          !RegExp(StringConstant.namepattern)
                              .hasMatch(nameTfController.text)) {
                        showpopup(
                            context, StringConstant.alert, StringConstant.alertDesc);
                      } else if (emailTfController.text.trim().isEmpty ||
                          !RegExp(StringConstant.emailpattern)
                              .hasMatch(emailTfController.text) ||
                          emailTfController.text.length < 11) {
                        showpopup(
                            context, StringConstant.alert, StringConstant.alertDesc);
                      } else if (passwordTfController.text.trim().isEmpty ||
                          passwordTfController.text.length < 8) {
                        showpopup(
                            context, StringConstant.alert, StringConstant.alertDesc);
                      } else if (_isChecked == false) {
                        showpopup(context, StringConstant.alert, StringConstant.alertDesc);
                      } else {
                        tapsignupbutton(context);
                      }
                    }),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  tapsignintextbutton(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(StringConstant.alreadyaccountexistSignUp),
                    Text(
                      StringConstant.boldSignIn,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
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

  void tapsignupbutton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DashboardScreen()),
    );
  }

  void tapsignintextbutton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginInScreen()),
    );
  }
}