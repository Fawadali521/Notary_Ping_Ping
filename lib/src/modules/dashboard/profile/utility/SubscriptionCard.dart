// ignore_for_file: file_names

import '../../../../../index.dart';

class SubscriptionCard extends StatelessWidget {
  final String price;
  final String time;
  final String description;
  final bool isSelect;
  const SubscriptionCard({
    super.key,
    required this.price,
    required this.time,
    required this.description,
    this.isSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Palette.subscriptionCardColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price,
                style: TextStyles.headlineMedium.copyWith(
                  color: Palette.whiteColor,
                ),
              ),
              Text(
                time,
                style: TextStyles.bodyLarge.copyWith(
                  fontSize: 12,
                  color: Palette.whiteColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              description.tr,
              style: TextStyles.bodyLarge
                  .copyWith(color: Palette.whiteColor.withOpacity(0.7)),
              textAlign: TextAlign.center,
            ),
          ),
          SubmitButton(
            title: 'Select plan'.tr,
            onTap: () {},
            backGroundColor:
                isSelect ? Palette.primaryColor : Palette.whiteColor,
            titleColor: isSelect ? Palette.whiteColor : Palette.blackColor,
            boderColor: isSelect ? Palette.primaryColor : Palette.whiteColor,                                                                                                                                                                                                                                                                                                                                                                                                                                                   
          ),
        ],
      ),
    );
  }
}
