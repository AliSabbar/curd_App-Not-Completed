import 'package:curd_app/components/defaultButton.dart';
import 'package:curd_app/components/defaultTextField.dart';
import 'package:curd_app/services/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/constants.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  // controllers
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var phoneController = TextEditingController();

  //  variables
  var textFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // provider
    final prov = Provider.of<CurdProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: textFormKey,
            child: Column(
              children: [
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                defaultTextField(
                    labelText: "Name",
                    hintText: "Enter Your Name",
                    prefixIcon: const Icon(Icons.person),
                    controller: nameController,
                    validator: (s) {
                      if (s!.isEmpty) return "Enter Some Text";
                    }),
                const SizedBox(
                  height: 10,
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
                defaultTextField(
                    labelText: "Phone Number",
                    hintText: "Enter Your Phone Number",
                    prefixIcon: const Icon(Icons.phone),
                    controller: phoneController,
                    validator: (s) {
                      if (s!.isEmpty) return "Enter Some Text";
                    }),
                const SizedBox(
                  height: 10,
                ),
                prov.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : defaultButton(
                        child: const Text("Sign Up"),
                        onPressed: () async {
                          if(textFormKey.currentState!.validate())
                          prov.userSignUp(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            phone: phoneController.text,
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
                      const Text("You Already Have Account"),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/signIn',
                              (route) => false,
                            );
                          },
                          child: const Text("Login")),
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
