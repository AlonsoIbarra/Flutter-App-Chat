import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter chat app'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          const Text('Correo electrónico'),
          SizedBox(
            height: 2.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3.h),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Correo electrónico',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
