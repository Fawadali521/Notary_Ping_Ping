// ignore_for_file: file_names

import 'package:notary_ping_notary/src/modules/auth/forgot/OtpVerification.dart';
import 'package:notary_ping_notary/src/modules/auth/signin/SignIn.dart';
import 'package:notary_ping_notary/src/modules/auth/signup/SignUp.dart';
import 'package:notary_ping_notary/src/states/forgot/ForgotController.dart';

import '../../../../index.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  final ForgotController controller = Get.put(ForgotController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        children: [
          const SafeArea(bottom: false, child: SizedBox()),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                logo,
                fit: BoxFit.contain,
                height: 60.h,
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: InkWell(
              //     onTap: () => Get.back(),
              //     child: Padding(
              //       padding:
              //           EdgeInsets.symmetric(horizontal: 0.w, vertical: 14.h),
              //       child: const Icon(
              //         Icons.arrow_back_ios_new_outlined,
              //         color: Palette.blackColor,
              //         size: 16,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 18.h,
            ),
            child: Text(
              "Forgot password?".tr,
              style: TextStyles.headlineMedium,
            ),
          ),
          Text(
            "foegotDescription".tr,
            style: TextStyles.bodyMedium,
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            hintText: 'Enter your email'.tr,
            onChange: (value) {
              controller.state.email = value;
            },
            prefixIcon: emailIcon,
          ),
          Row(
            children: [
              InkWell(
                onTap: () => Get.offAll(() => SignUp()),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(
                    "Sign Up".tr,
                    style: TextStyles.bodyLarge,
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => Get.offAll(() => SignIn()),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(
                    'Try Sign In'.tr,
                    style: TextStyles.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
          SubmitButton(
            backGroundColor: Palette.primaryColor,
            onTap: () {
              Get.off(() => const OtpVerification());
            },
            title: "send".tr,
          ),
          SizedBox(height: 12.h)
        ],
      ),
    );
  }
}
