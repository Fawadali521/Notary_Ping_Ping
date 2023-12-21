// ignore_for_file: file_names

import 'package:notary_ping_notary/src/modules/dashboard/profile/utility/SubscriptionCard.dart';
import 'package:notary_ping_notary/src/states/profile/ProfileController.dart';

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
          SizedBox(height: 8.h),
          SubmitButton(
            title: 'Get started'.tr,
            onTap: () {},
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
