import 'package:flutter/material.dart';
import 'package:xaxino/view/screens/auth/login/login_body_section/login_body_section.dart';
import 'package:get/get.dart';
import 'package:xaxino/core/utils/my_color.dart';
import 'package:xaxino/core/utils/my_images.dart';
import 'package:xaxino/data/controller/auth/login_controller.dart';
import 'package:xaxino/data/repo/auth/login_repo.dart';
import 'package:xaxino/data/services/api_service.dart';
import 'package:xaxino/view/components/will_pop_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(LoginRepo(apiClient: Get.find()));
    Get.put(LoginController(loginRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<LoginController>().remember = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopWidget(
      nextRoute: '',
      child: Scaffold(
        backgroundColor: MyColor.screenBgColor,
        body: GetBuilder<LoginController>(
          builder: (controller) => SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(MyImages.loginBg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: MyColor.secondaryColor950.withOpacity(0.8),
                ),
                const SingleChildScrollView(child:  LoginBodySection())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
