// ignore_for_file: file_names

import 'package:notary_ping_notary/src/modules/dashboard/profile/subscription/AddPayment.dart';
import 'package:notary_ping_notary/src/states/profile/ProfileController.dart';

import '../../../../../index.dart';

class PayNow extends StatefulWidget {
  const PayNow({Key? key}) : super(key: key);

  @override
  State<PayNow> createState() => _PayNowState();
}

class _PayNowState extends State<PayNow> {
  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: CustomAppBar(
        color: Palette.whiteColor,
        title: 'Pay now'.tr,
        isBack: true,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              Text(
                "Add card".tr,
                style: TextStyles.titleLarge,
              ),
              SizedBox(height: 16.h),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderStyles.medium,
                  color: Palette.bgTextFeildColor,
                ),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        visacardIcon,
                        fit: BoxFit.contain,
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Visa Card",
                        style: TextStyles.bodyMedium,
                      ),
                    ),
                    const Spacer(),
                    Transform.scale(
                      scale: 1.3,
                      child: Radio(
                        activeColor: Palette.primaryColor,
                        value: "z",
                        groupValue: "s",
                        onChanged: (v) {},
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderStyles.medium,
                  color: Palette.bgTextFeildColor,
                ),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        mastercardIcon,
                        fit: BoxFit.contain,
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Master Card",
                        style: TextStyles.bodyMedium,
                      ),
                    ),
                    const Spacer(),
                    Transform.scale(
                      scale: 1.3,
                      child: Radio(
                        activeColor: Palette.primaryColor,
                        value: "z",
                        groupValue: "z",
                        onChanged: (v) {},
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderStyles.medium,
                  color: Palette.bgTextFeildColor,
                ),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        paypalcardIcon,
                        fit: BoxFit.contain,
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Paypal",
                        style: TextStyles.bodyMedium,
                      ),
                    ),
                    const Spacer(),
                    Transform.scale(
                      scale: 1.3,
                      child: Radio(
                        activeColor: Palette.primaryColor,
                        value: "z",
                        groupValue: "j",
                        onChanged: (v) {},
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderStyles.medium,
                  color: Palette.bgTextFeildColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        "Save payment option".tr,
                        style: TextStyles.titleLarge,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 1.3,
                          child: Radio(
                            activeColor: Palette.primaryColor,
                            value: "z",
                            groupValue: "j",
                            onChanged: (v) {},
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "City credit card".tr,
                              style: TextStyles.titleMedium,
                            ),
                            Text(
                              "****8523".tr,
                              style: TextStyles.bodyMedium,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Mastercard".tr,
                                style: TextStyles.titleMedium,
                              ),
                              Text(
                                "Brooklyn Simmons".tr,
                                style: TextStyles.bodyMedium,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),

              // Add more languages as needed
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SubmitButton(
                      onTap: () => Get.to(() => const AddPayment()),
                      title: "Apply".tr),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
