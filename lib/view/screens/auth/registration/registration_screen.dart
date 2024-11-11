import 'package:flutter/material.dart';
import 'package:xaxino/view/screens/auth/registration/widget/registration_body_section/registration_body_section.dart';
import 'package:get/get.dart';
import 'package:xaxino/core/route/route.dart';
import 'package:xaxino/core/utils/my_color.dart';
import 'package:xaxino/core/utils/my_images.dart';
import 'package:xaxino/data/controller/auth/auth/registration_controller.dart';
import 'package:xaxino/data/repo/auth/general_setting_repo.dart';
import 'package:xaxino/data/repo/auth/signup_repo.dart';
import 'package:xaxino/data/services/api_service.dart';
import 'package:xaxino/view/components/will_pop_widget.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(GeneralSettingRepo(apiClient: Get.find()));
    Get.put(RegistrationRepo(apiClient: Get.find()));
    Get.put(RegistrationController(registrationRepo: Get.find(), generalSettingRepo: Get.find()));


    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<RegistrationController>().initData();
    });   
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
      builder: (controller) => WillPopWidget(
        nextRoute: RouteHelper.loginScreen,
        child: Scaffold(
          backgroundColor: MyColor.primaryColor,
          body: GetBuilder<RegistrationController>(
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
               const RegistrationBodySection() ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
