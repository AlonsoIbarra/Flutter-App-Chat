import 'package:flutter/material.dart';
import 'package:flutter_chat/src/data/services/local/multimedia_service.dart';
import 'package:flutter_chat/src/repositories_injection.dart';
import 'package:flutter_chat/src/ui/register/register_controller.dart';
import 'package:flutter_chat/src/ui/register/widgets/register_form.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../config/utils/app_colors.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({
    Key? key,
    RegisterController? registerController,
    MultimediaService? multimediaService,
  })  : registerController = registerController ??
            RegisterController(
              RepositoriesGetter.userRepository,
              multimediaService ?? MultimediaService(),
            ),
        super(key: key);
  RegisterController registerController;

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
                    InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 6.h,
                          left: 0.w,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_back,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            Text(
                              'Registro',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RegisterForm(
                registerController: registerController,
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
