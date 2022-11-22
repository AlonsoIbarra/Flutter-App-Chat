import 'package:flutter/material.dart';
import 'package:flutter_chat/src/config/utils/app_colors.dart';
import 'package:flutter_chat/src/config/utils/app_image_routs.dart';
import 'package:flutter_chat/src/ui/login/login_controller.dart';
import 'package:flutter_chat/src/ui/login/widgets/login_form.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
    LoginController? loginController,
  })  : loginController = loginController ?? LoginController(),
        super(key: key);

  LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: 100.h,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(right: 70.w),
                child: Stack(
                  children: [
                    Container(
                      height: 15.h,
                      width: 15.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(22.w)),
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 6.h,
                        left: 7.w,
                      ),
                      child: Text(
                        'login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                AppImageRoutes.loginImage,
                width: 40.w,
                height: 20.h,
              ),
              LoginForm(
                loginController: loginController,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
