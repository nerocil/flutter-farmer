import 'package:farmer_group_management/controllers/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const ListTile(
                    title: Text("Sign-In"),
                    subtitle:
                        Text("Access the Panel using your email and passcode."),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: controller.userName.value,
                    decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Email or Username",
                        labelText: "Email or Username"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter email";
                      }
                      if (!value.trim().isEmail) {
                        return "Please enter valid Email";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.userName.value = value??"";
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue:controller.passcode.value,
                    obscureText: true,
                    decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Password",
                        labelText: "Password"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Password";
                      }
                      if (value.trim().isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.passcode.value = value??"";
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: controller.loading.value ? null:() {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          controller.onAttemptLogin();
                        }
                      },
                      child: controller.loading.value ? const Padding(
                        padding: EdgeInsets.all(6.0,),
                        child: CircularProgressIndicator(color: Colors.white,),
                      ):const Text("Sign In"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
