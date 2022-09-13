import 'package:curd_app/modules/Home_Screen/home_layout.dart';
import 'package:curd_app/services/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/Sign_in_Screen/signin_screen.dart';
import 'modules/Sign_up_Screen/signup_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (context) => CurdProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/signIn': (context) => SignIn(),
        '/signUp': (context) => SignUp(),
        '/home': (context) => const HomeLayout(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignIn(),
    );
  }
}
