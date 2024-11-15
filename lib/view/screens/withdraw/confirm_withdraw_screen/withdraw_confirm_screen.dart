import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../data/controller/withdraw/withdraw_confirm_controller.dart';
import '../../../../data/model/withdraw/withdraw_request_response_model.dart';
import '../../../../data/repo/account/profile_repo.dart';
import '../../../../data/services/api_service.dart';
import '../../../components/app-bar/custom_appbar.dart';
import '../../../components/buttons/rounded_button.dart';
import '../../../components/buttons/rounded_loading_button.dart';
import '../../../components/checkbox/custom_check_box.dart';
import '../../../components/custom_drop_down_button_with_text_field.dart';
import '../../../components/custom_loader/custom_loader.dart';
import '../../../components/custom_radio_button.dart';
import '../../../components/text-form-field/custom_text_field.dart';
import '../../../components/text/label_text_with_instructions.dart';
import 'widget/file_item.dart';

class WithdrawConfirmScreen extends StatefulWidget {
  const WithdrawConfirmScreen({super.key});

  @override
  State<WithdrawConfirmScreen> createState() => _WithdrawConfirmScreenState();
}

class _WithdrawConfirmScreenState extends State<WithdrawConfirmScreen> {
  String gatewayName = '';

  @override
  void initState() {
    gatewayName = Get.arguments[1];
    dynamic model = Get.arguments[0];
    //String trxId = Get.arguments;
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(ProfileRepo(apiClient: Get.find()));
    final controller = Get.put(WithdrawConfirmController(repo: Get.find(), profileRepo: Get.find()));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.initData(model);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WithdrawConfirmController>(builder: (controller) {
      return Container(
        decoration: const BoxDecoration(
          gradient: MyColor.gradientBackground,
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: MyStrings.withdrawConfirm,
            ),
            body: controller.isLoading
                ? const CustomLoader()
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(Dimensions.space10),
                    child: Container(
                      padding: const EdgeInsets.all(Dimensions.space15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: controller.formList.length,
                              itemBuilder: (ctx, index) {
                                FormModel model = controller.formList[index];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    model.type == 'text' || model.type == 'number' || model.type == 'email' || model.type == 'url'
                                        ? Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomTextField(
                                                  instructions: model.instruction,
                                                  isRequired: model.isRequired == 'optional' ? false : true,
                                                  hintText: ("${MyStrings.enter} ${model.name ?? ''}").toString().capitalizeFirst,
                                                  needOutlineBorder: true,
                                                  labelText: model.name ?? '',
                                                  textInputType: model.type == 'number'
                                                      ? TextInputType.number
                                                      : model.type == 'email'
                                                          ? TextInputType.emailAddress
                                                          : model.type == 'url'
                                                              ? TextInputType.url
                                                              : TextInputType.text,
                                                  validator: (value) {
                                                    if (model.isRequired != 'optional' && value.toString().isEmpty) {
                                                      return '${model.name.toString().capitalizeFirst} ${MyStrings.isRequired}';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  onChanged: (value) {
                                                    controller.changeSelectedValue(value, index);
                                                  }),
                                              const SizedBox(height: Dimensions.space10),
                                            ],
                                          )
                                        : model.type == 'textarea'
                                            ? Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CustomTextField(
                                                      instructions: model.instruction,
                                                      isRequired: model.isRequired == 'optional' ? false : true,
                                                      needOutlineBorder: true,
                                                      maxLines: 5,
                                                      labelText: model.name ?? '',
                                                      hintText: ("${MyStrings.enter} ${model.name ?? ''}").toString().capitalizeFirst,
                                                      inputAction: TextInputAction.newline,
                                                      textInputType: TextInputType.multiline,
                                                      validator: (value) {
                                                        if (model.isRequired != 'optional' && value.toString().isEmpty) {
                                                          return '${model.name.toString().capitalizeFirst} ${MyStrings.isRequired}';
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                      onChanged: (value) {
                                                        controller.changeSelectedValue(value, index);
                                                      }),
                                                  const SizedBox(height: Dimensions.space10),
                                                ],
                                              )
                                            : model.type == 'select'
                                                ? Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      LabelTextInstruction(
                                                        text: model.name ?? '',
                                                        isRequired: model.isRequired == 'optional' ? false : true,
                                                        instructions: model.instruction,
                                                      ),
                                                      const SizedBox(
                                                        height: Dimensions.textToTextSpace,
                                                      ),
                                                      CustomDropDownWithTextField(
                                                          list: model.options ?? [],
                                                          onChanged: (value) {
                                                            controller.changeSelectedValue(value, index);
                                                          },
                                                          selectedValue: model.selectedValue),
                                                      const SizedBox(height: Dimensions.space10)
                                                    ],
                                                  )
                                                : model.type == 'radio'
                                                    ? Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          LabelTextInstruction(
                                                            text: model.name ?? '',
                                                            isRequired: model.isRequired == 'optional' ? false : true,
                                                            instructions: model.instruction,
                                                          ),
                                                          CustomRadioButton(
                                                            title: model.name,
                                                            selectedIndex: controller.formList[index].options?.indexOf(model.selectedValue ?? '') ?? 0,
                                                            list: model.options ?? [],
                                                            onChanged: (selectedIndex) {
                                                              controller.changeSelectedRadioBtnValue(index, selectedIndex);
                                                            },
                                                          ),
                                                        ],
                                                      )
                                                    : model.type == 'checkbox'
                                                        ? Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              LabelTextInstruction(
                                                                text: model.name ?? '',
                                                                isRequired: model.isRequired == 'optional' ? false : true,
                                                                instructions: model.instruction,
                                                              ),
                                                              CustomCheckBox(
                                                                selectedValue: controller.formList[index].cbSelected,
                                                                list: model.options ?? [],
                                                                onChanged: (value) {
                                                                  controller.changeSelectedCheckBoxValue(index, value);
                                                                },
                                                              ),
                                                            ],
                                                          )
                                                        : model.type == 'file'
                                                            ? Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  LabelTextInstruction(
                                                                    text: model.name ?? '',
                                                                    isRequired: model.isRequired == 'optional' ? false : true,
                                                                    instructions: model.instruction,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.symmetric(vertical: Dimensions.textToTextSpace),
                                                                    child: ConfirmWithdrawFileItem(index: index),
                                                                  ),
                                                                ],
                                                              )
                                                            : model.type == 'datetime'
                                                                ? Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets.symmetric(vertical: Dimensions.textToTextSpace),
                                                                        child: CustomTextField(
                                                                            instructions: model.instruction,
                                                                            isRequired: model.isRequired == 'optional' ? false : true,
                                                                            hintText: ("${MyStrings.enter} ${model.name ?? ''}").toString().capitalizeFirst,
                                                                            needOutlineBorder: true,
                                                                            labelText: model.name ?? '',
                                                                            controller: controller.formList[index].textEditingController,
                                                                            // initialValue: controller.formList[index].selectedValue == "" ? (model.name ?? '').toString().capitalizeFirst : controller.formList[index].selectedValue,
                                                                            textInputType: TextInputType.datetime,
                                                                            readOnly: true,
                                                                            validator: (value) {
                                                                              print(model.isRequired);
                                                                              if (model.isRequired != 'optional' && value.toString().isEmpty) {
                                                                                return '${model.name.toString().capitalizeFirst} ${MyStrings.isRequired}';
                                                                              } else {
                                                                                return null;
                                                                              }
                                                                            },
                                                                            onTap: () {
                                                                              controller.changeSelectedDateTimeValue(index, context);
                                                                            },
                                                                            onChanged: (value) {
                                                                              controller.changeSelectedValue(value, index);
                                                                            }),
                                                                      ),
                                                                    ],
                                                                  )
                                                                : model.type == 'date'
                                                                    ? Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsets.symmetric(vertical: Dimensions.textToTextSpace),
                                                                            child: CustomTextField(
                                                                                instructions: model.instruction,
                                                                                isRequired: model.isRequired == 'optional' ? false : true,
                                                                                hintText: ("${MyStrings.enter} ${model.name ?? ''}").toString().capitalizeFirst,
                                                                                needOutlineBorder: true,
                                                                                labelText: model.name ?? '',
                                                                                controller: controller.formList[index].textEditingController,
                                                                                // initialValue: controller.formList[index].selectedValue == "" ? (model.name ?? '').toString().capitalizeFirst : controller.formList[index].selectedValue,
                                                                                textInputType: TextInputType.datetime,
                                                                                readOnly: true,
                                                                                validator: (value) {
                                                                                  if (model.isRequired != 'optional' && value.toString().isEmpty) {
                                                                                    return '${model.name.toString().capitalizeFirst} ${MyStrings.isRequired}';
                                                                                  } else {
                                                                                    return null;
                                                                                  }
                                                                                },
                                                                                onTap: () {
                                                                                  controller.changeSelectedDateOnlyValue(index, context);
                                                                                },
                                                                                onChanged: (value) {
                                                                                  controller.changeSelectedValue(value, index);
                                                                                }),
                                                                          ),
                                                                        ],
                                                                      )
                                                                    : model.type == 'time'
                                                                        ? Column(
                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.symmetric(vertical: Dimensions.textToTextSpace),
                                                                                child: CustomTextField(
                                                                                    instructions: model.instruction,
                                                                                    isRequired: model.isRequired == 'optional' ? false : true,
                                                                                    hintText: ("${MyStrings.enter} ${model.name ?? ''}").toString().capitalizeFirst,
                                                                                    needOutlineBorder: true,
                                                                                    labelText: model.name ?? '',
                                                                                    controller: controller.formList[index].textEditingController,
                                                                                    // initialValue: controller.formList[index].selectedValue == "" ? (model.name ?? '').toString().capitalizeFirst : controller.formList[index].selectedValue,
                                                                                    textInputType: TextInputType.datetime,
                                                                                    readOnly: true,
                                                                                    validator: (value) {
                                                                                      print(model.isRequired);
                                                                                      if (model.isRequired != 'optional' && value.toString().isEmpty) {
                                                                                        return '${model.name.toString().capitalizeFirst} ${MyStrings.isRequired}';
                                                                                      } else {
                                                                                        return null;
                                                                                      }
                                                                                    },
                                                                                    onTap: () {
                                                                                      controller.changeSelectedTimeOnlyValue(index, context);
                                                                                    },
                                                                                    onChanged: (value) {
                                                                                      print(value);
                                                                                      controller.changeSelectedValue(value, index);
                                                                                    }),
                                                                              ),
                                                                            ],
                                                                          )
                                                                        : const SizedBox(),
                                  ],
                                );
                              }),
                          const SizedBox(height: Dimensions.space25),
                          controller.submitLoading
                              ? const Center(child: RoundedLoadingBtn())
                              : RoundedButton(
                                  hasCornerRadious: true,
                                  isColorChange: true,
                                  textColor: MyColor.colorBlack,
                                  verticalPadding: Dimensions.space15,
                                  cornerRadius: Dimensions.space8,
                                  color: MyColor.primaryButtonColor,
                                  text: MyStrings.submit.tr,
                                  press: () {
                                    controller.submitConfirmWithdrawRequest();
                                  },
                                ),
                        ],
                      ),
                    ),
                  )),
      );
    });
  }
}
