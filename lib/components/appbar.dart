import 'package:flutter/material.dart';

Widget customAppBar() {
  return Builder(builder: (context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: width,
          height: height * 0.15,
          alignment: Alignment.center,
          color: Colors.blue,
          child: const Text(
            "University Of Technology",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
            top: 93,
            child: Container(
              width: 250,
              height: 60,
              decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("21"),
                      Text("Student"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("21"),
                      Text("Student"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("21"),
                      Text("Student"),
                    ],
                  ),
                ],
              ),
            )),
        Positioned(
            top: 40,
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: const Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ))),
      ],
    );
  });
}
