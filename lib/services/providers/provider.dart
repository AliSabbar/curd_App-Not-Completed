import 'package:curd_app/components/defaultToast.dart';
import 'package:flutter/material.dart';

import '../../components/constants.dart';
import '../../models/products_model.dart';
import '../../models/user_model.dart';
import '../network/remote/api_helper.dart';

class CurdProvider extends ChangeNotifier {
  late UserModel user;
  late ProductsModel product;
  bool isLoading = false;
  List myProducts = [];

  // SIGN UP
  Future userSignUp({
    required String name,
    required String email,
    required String password,
    required String phone,
    context,
  }) async {
    isLoading = true;
    ApiHelper.postData(
      url: REGISTER,
      body: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      },
    ).then((value) {
      user = UserModel.fromJson(value);
      if (user.status == false) {
        defaultToast(message: user.message, color: Colors.red);
        isLoading = false;
        notifyListeners();
      } else {
        defaultToast(message: user.message, color: Colors.green);
        Navigator.pushNamedAndRemoveUntil(context, "/signIn", (route) => false);
        isLoading = false;
      }

      print(user.message);
    }).catchError((e) {
      defaultToast(message: "error in status code ", color: Colors.red);
      isLoading = false;
      notifyListeners();
      print(e.toString());
    });
    notifyListeners();
  }

// SIGN IN

  Future userSignIn({
    required String email,
    required String password,
    context,
  }) async {
    isLoading = true;
    ApiHelper.postData(
      url: LOGIN,
      body: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      user = UserModel.fromJson(value);
      if (user.status == false) {
        defaultToast(message: user.message, color: Colors.red);
        isLoading = false;
        notifyListeners();
      } else {
        defaultToast(message: user.message, color: Colors.green);
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
        getHomeData();
      }
      print(user.message);
    }).catchError((e) {
      defaultToast(message: "error in status code ", color: Colors.red);
      isLoading = false;
      notifyListeners();
      print(e.toString());
    });
    notifyListeners();
  }

// HOME DATA

  getHomeData() {
    ApiHelper.getData(url: HOME).then((value) {
      product = ProductsModel.fromJson(value);
      myProducts.addAll(product.data.products);
      notifyListeners();
      isLoading = false;
    });
  }
}
