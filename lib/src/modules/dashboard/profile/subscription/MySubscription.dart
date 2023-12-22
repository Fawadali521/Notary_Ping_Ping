// ignore_for_file: file_names

import 'package:notary_ping_notary/src/modules/dashboard/profile/subscription/PayNow.dart';
import 'package:notary_ping_notary/src/modules/dashboard/profile/utility/SubscriptionCard.dart';
import 'package:notary_ping_notary/src/states/profile/ProfileController.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../index.dart';

class MySubscription extends StatelessWidget {
  MySubscription({super.key});
  final ProfileController controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: CustomAppBar(
        color: Palette.whiteColor,
        title: 'My subscription'.tr,
        isBack: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          Text(
            "Get Started Today".tr,
            style: TextStyles.titleLarge,
          ),
          Text(
            "Choose the right plan for you".tr,
            style: TextStyles.bodySmall,
          ),
          SizedBox(height: 12.h),
          const SubscriptionCard(
            price: "\$100/",
            time: "month",
            isSelect: true,
            description:
                "Unlock premium features with our monthly subscription",
          ),
          const SubscriptionCard(
            price: "\$499/",
            time: "6month",
            description:
                "Unlock premium features with our monthly subscription",
          ),
          const SubscriptionCard(
            price: "\$999/",
            time: "yearly",
            description:
                "Upgrade to annual excellence seamless notaryping with yearly subscription",
          ),
          SizedBox(height: 16.h),
          Card(
            margin: EdgeInsets.zero,
            elevation: 2,
            surfaceTintColor: Palette.whiteColor,
            color: Palette.whiteColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current plan".tr,
                        style: TextStyles.titleLarge,
                      ),
                      Text(
                        "Free plan".tr,
                        style: TextStyles.bodyMedium.copyWith(
                          color: Palette.blackColor,
                        ),
                      ),
                      Text(
                        "Expires on 12 may 2023".tr,
                        style: TextStyles.titleMedium.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 24.w),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 60.0,
                        lineWidth: 12.0,
                        animation: true,
                        percent: 0.7,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Palette.primaryColor,
                      ),
                      const Column(
                        children: [
                          Text(
                            "2",
                            style: TextStyles.headlineMedium,
                          ),
                          Text(
                            "Days left",
                            style: TextStyles.bodySmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          SubmitButton(
            title: 'Get started'.tr,
            onTap: () => Get.to(() => const PayNow()),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
