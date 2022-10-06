import 'package:curd_app/components/defaultToast.dart';
import 'package:curd_app/models/favorites_model.dart';
import 'package:flutter/material.dart';

import '../../components/constants.dart';
import '../../models/products_model.dart';
import '../../models/user_model.dart';
import '../network/remote/api_helper.dart';

class CurdProvider extends ChangeNotifier {
  late UserModel user;
  late ProductsModel product;
  late FavoriteModel favorite;
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

// FAVORITES

  addToFav({required num product_id}) {
    ApiHelper.postData(url: FAVORITES, body: {
      "product_id": product_id,
    }).then((value) {
      print(product_id);
      notifyListeners();
    });
  }

// GET FAVORITES

  Future getFav() async {
    var response = await ApiHelper.getData(url: FAVORITES).then((value) {
      favorite = FavoriteModel.fromJson(value);
      print(favorite.data!.data);
      return favorite.data!.data;
    });
    return response;
  }

// UPDATE PROFILE

  updateProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    var response = await ApiHelper.updateData(
            url: PROFILE,
            body: {'name': name, 'email': email, 'phone': phone, 'image': ''})
        .then((value) {
      if (user.status == true) {
        user = UserModel.fromJson(value);
        defaultToast(message: user.message, color: Colors.green);
        notifyListeners();
      } else if (user.status == false) {
        defaultToast(message: user.message, color: Colors.red);
      }
      return user;
    }).catchError((e) {
      print("Error = $e");
    });
    print(response.message);
  }
}
