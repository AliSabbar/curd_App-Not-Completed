import 'package:curd_app/components/defaultButton.dart';
import 'package:curd_app/components/defaultTextField.dart';
import 'package:curd_app/models/products_model.dart';
import 'package:curd_app/services/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/constants.dart';
import '../../services/network/remote/api_helper.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  // controllers

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  //  variables
  var textFormKey = GlobalKey<FormState>();
  List mylist = [];

  @override
  Widget build(BuildContext context) {
    // provider
    final prov = Provider.of<CurdProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: textFormKey,
            child: Column(
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                defaultTextField(
                    labelText: "Email",
                    hintText: "Enter Your Email",
                    prefixIcon: const Icon(Icons.email),
                    controller: emailController,
                    validator: (s) {
                      if (s!.isEmpty) return "Enter Some Text";
                    }),
                const SizedBox(
                  height: 10,
                ),
                defaultTextField(
                    labelText: "Password",
                    hintText: "Enter Your Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    controller: passwordController,
                    validator: (s) {
                      if (s!.isEmpty) return "Enter Some Text";
                    }),
                const SizedBox(
                  height: 10,
                ),
                prov.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : defaultButton(
                        child: const Text("Sign In"),
                        onPressed: () async {
                          if(textFormKey.currentState!.validate())
                          prov.userSignIn(
                            email: emailController.text,
                            password: passwordController.text,
                            context: context,
                          );
                        }),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                    children: [
                      const Text("You Don't Have Account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signUp');
                          },
                          child: const Text("SignUp")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
