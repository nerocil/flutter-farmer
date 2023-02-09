import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
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
                    initialValue: "",
                    decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Email or Username",
                        labelText: "Email or Username"),
                    validator: (value) {},
                    onSaved: (value) {},
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: "",
                    obscureText: true,
                    decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Password",
                        labelText: "Password"),
                    validator: (value) {},
                    onSaved: (value) {},
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text("Sign In")))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
