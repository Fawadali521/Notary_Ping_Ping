// ignore_for_file: file_names

import 'package:notary_ping_notary/src/modules/dashboard/DashboardScreen.dart';
import 'package:notary_ping_notary/src/states/profile/ProfileController.dart';

import '../../../../../index.dart';

class AddPayment extends StatefulWidget {
  const AddPayment({Key? key}) : super(key: key);

  @override
  State<AddPayment> createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
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
                "Add payment method".tr,
                style: TextStyles.titleLarge,
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Image.asset(
                  showCardImage,
                ),
              ),
              CustomTextField(
                hintText: "Card holder name".tr,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: CustomTextField(
                  hintText: "Card number".tr,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: "Expiration date".tr,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomTextField(
                      hintText: "CVV".tr,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, bottom: 24.h),
                child: CustomTextField(
                  hintText: "Amount".tr,
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
                    onTap: () {
                      showConfirmationSubscriptionAlert(context);
                    },
                    title: "Confirm payment".tr,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showConfirmationSubscriptionAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Palette.whiteColor,
          surfaceTintColor: Palette.whiteColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          contentPadding: const EdgeInsets.all(0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 14),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.h),
                child: const ClipOval(
                  child: Image(
                    image: AssetImage(confirmIcon),
                    height: 80,
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                "Payment confirm".tr,
                style: TextStyles.headlineLarge,
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.h, left: 32.w, right: 32.w),
                child: Text(
                  "Your payment has been successfully processed.Thank you for choosing our services."
                      .tr,
                  style: TextStyles.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SubmitButton(
                        backGroundColor: Palette.whiteColor,
                        titleColor: Palette.primaryColor,
                        onTap: () {
                          Get.back();
                        },
                        title: "Back to home".tr,
                      ),
                    ),
                    SizedBox(width: 12.w),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ).then((value) => {
          Get.offAll(() => const Dashboard()),
        });
  }
}
