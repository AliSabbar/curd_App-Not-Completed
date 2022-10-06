import 'package:curd_app/components/defaultButton.dart';
import 'package:curd_app/services/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/defaultTextField.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

   var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<CurdProvider>(context).user.data;
    nameController.text = user!.name;
    emailController.text = user.email;
    phoneController.text = user.phone;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                user.name,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                  labelText: "Phone",
                  hintText: "Enter Your Phone",
                  prefixIcon: const Icon(Icons.phone),
                  controller: phoneController,
                  validator: (s) {
                    if (s!.isEmpty) return "Enter Some Text";
                  }),
              const SizedBox(
                height: 10,
              ),
              defaultButton(
                  child: const Text("Update"),
                  onPressed: () {
                    Provider.of<CurdProvider>(context, listen: false)
                        .updateProfile(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
