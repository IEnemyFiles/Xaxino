import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xaxino/core/utils/dimensions.dart';
import 'package:xaxino/core/utils/my_color.dart';
import 'package:xaxino/core/utils/my_strings.dart';
import 'package:xaxino/data/controller/account/profile_controller.dart';
import 'package:xaxino/data/repo/account/profile_repo.dart';
import 'package:xaxino/data/services/api_service.dart';
import 'package:xaxino/view/components/app-bar/custom_appbar.dart';
import 'package:xaxino/view/components/custom_loader/custom_loader.dart';
import 'package:xaxino/view/screens/Profile/widget/profile_top_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(ProfileRepo(apiClient: Get.find()));
    final controller = Get.put(ProfileController(profileRepo: Get.find()));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.loadProfileInfo();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: MyColor.bottomColor,
          appBar: CustomAppBar(
            title: MyStrings.profile.tr,
            bgColor: MyColor.bottomColor,
          ),
          body: controller.isLoading
              ? const CustomLoader()
              : Stack(
                  children: [
                    Positioned(
                      top: -10,
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        color: MyColor.bottomColor,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(left: Dimensions.space15, right: Dimensions.space15, top: Dimensions.space20, bottom: Dimensions.space20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileTopSection(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
