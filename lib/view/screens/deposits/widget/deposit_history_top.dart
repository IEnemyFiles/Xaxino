import 'package:flutter/material.dart';
import 'package:xaxino/core/utils/my_images.dart';
import 'package:xaxino/core/utils/style.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../data/controller/deposit/deposit_history_controller.dart';
import '../../../components/image/custom_svg_picture.dart';
import '../../../components/text-form-field/search_text_field.dart';

class DepositHistoryTop extends StatefulWidget {
  const DepositHistoryTop({Key? key}) : super(key: key);

  @override
  State<DepositHistoryTop> createState() => _DepositHistoryTopState();
}

class _DepositHistoryTopState extends State<DepositHistoryTop> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepositController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15, vertical: Dimensions.space15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
          color: MyColor.bottomColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(MyStrings.trxNo.tr, style: regularSmall.copyWith(color: MyColor.labelTextColor, fontWeight: FontWeight.w500)),
            const SizedBox(height: Dimensions.space5 + 3),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      child: SearchTextField(
                        needOutlineBorder: true,
                        controller: controller.searchController,
                        onChanged: (value){
                          return;
                        },
                        hintText:'',
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimensions.space10),
                  InkWell(
                    onTap: () {
                      controller.searchDepositTrx();
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(4),
                        color: MyColor.activeIndicatorColor,
                      ),
                      child:  const Padding(padding:EdgeInsets.all(7),child:  CustomSvgPicture(image:MyImages.searchIconSvg, color:  MyColor.colorBlack )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}