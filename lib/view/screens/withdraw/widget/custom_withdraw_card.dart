import 'package:flutter/material.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../components/column_widget/card_column.dart';
import '../../../components/divider/custom_divider.dart';
import 'status_widget.dart';


class CustomWithdrawCard extends StatelessWidget {

  final String trxValue, date, status, amount;
  final Color statusBgColor;
  final VoidCallback onPressed;

  const CustomWithdrawCard({
    Key? key,
    required this.trxValue,
    required this.date,
    required this.status,
    required this.statusBgColor,
    required this.amount,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child:  Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
          decoration: BoxDecoration(
            color: MyColor.bottomColor,
            borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardColumn(
                    header: MyStrings.trxNo,
                    body: trxValue,
                  ),
                  CardColumn(
                    alignmentEnd: true,
                    header: MyStrings.date,
                    isDate: true,
                    body: date,
                  ),
                ],
              ),
              const CustomDivider(space: Dimensions.space10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardColumn(
                    header:MyStrings.amount,
                    body: amount,
                  ),
                  StatusWidget(
                    status: status,
                   color: statusBgColor,
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}
