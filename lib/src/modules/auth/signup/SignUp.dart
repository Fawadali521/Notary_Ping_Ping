// ignore_for_file: file_names

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:notary_ping_notary/src/modules/auth/signin/SignIn.dart';
import 'package:notary_ping_notary/src/modules/dashboard/DashboardScreen.dart';
import 'package:notary_ping_notary/src/states/signup/SignUpController.dart';
import 'package:notary_ping_notary/src/utility/SocialButton.dart';

import '../../../../index.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final SignUpController controller = Get.put(SignUpController());

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
          Image.asset(
            logo,
            fit: BoxFit.contain,
            height: 60.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.h,
            ),
            child: Text(
              "Let's Sign You Up!".tr,
              style: TextStyles.headlineMedium,
            ),
          ),
          // SizedBox(height: 8.h),
          // Text(
          //   "Create your account now".tr,
          //   style: TextStyles.bodyMedium,
          // ),

          CustomTextField(
            hintText: 'Enter your name'.tr,
            onChange: (value) {
              controller.state.name = value;
            },
            prefixIcon: userIcon,
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            hintText: 'Enter your email'.tr,
            onChange: (value) {
              controller.state.email = value;
            },
            prefixIcon: emailIcon,
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              // Obx(
              //   () => CustomDropDown(
              //     textStyle: TextStyles.bodyMedium.copyWith(
              //       color: Palette.blackColor,
              //     ),
              //     items: controller.state.slectCountryCode,
              //     selectedVal: controller.state.countryCodee.value,
              //     onChanged: (val) {
              //       controller.changeSelectGender(val!);
              //     },
              //   ),
              // ),
              Container(
                decoration: BoxDecoration(
                  color: Palette.bgTextFeildColor,
                  borderRadius: BorderStyles.normal,
                  border: Border.all(
                    color: Palette.bgTextFeildColor,
                  ),
                ),
                child: CountryCodePicker(
                  textStyle: TextStyles.bodyMedium.copyWith(
                    color: Palette.blackColor,
                  ),
                  dialogTextStyle: TextStyles.bodyMedium.copyWith(
                    color: Palette.blackColor,
                  ),
                  dialogSize: Size(1.sw, 0.8.sh),
                  padding: EdgeInsets.zero,
                  // flagWidth: 24,
                  onChanged: (element) => debugPrint(element.toLongString()),
                  initialSelection: 'US',
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                flex: 5,
                child: CustomTextField(
                  hintText: 'Enter Phone number'.tr,
                  onChange: (value) {},
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),
          CustomTextField(
            hintText: 'Enter your password'.tr,
            onChange: (value) {
              controller.state.newPassword = value;
            },
            prefixIcon: passwordIcon,
            isuffixIconPassword: true,
          ),
          // SizedBox(height: 16.h),
          // LayoutBuilder(
          //   builder: (context, constraints) => RawAutocomplete<String>(
          //     optionsViewBuilder: (BuildContext context,
          //         AutocompleteOnSelected<String> onSelected,
          //         Iterable<String> options) {
          //       return Align(
          //         alignment: Alignment.topLeft,
          //         child: Material(
          //           elevation: 4.0,
          //           child: SizedBox(
          //             // height: 200.0,
          //             width: constraints.biggest.width,
          //             child: ListView.builder(
          //               padding: const EdgeInsets.all(8.0),
          //               itemCount: options.length,
          //               itemBuilder: (BuildContext context, int index) {
          //                 final String option = options.elementAt(index);
          //                 return GestureDetector(
          //                   onTap: () {
          //                     onSelected(option);
          //                   },
          //                   child: ListTile(
          //                     title: Text(option),
          //                   ),
          //                 );
          //               },
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //     initialValue: TextEditingValue(
          //       text: controller.state.slectedCity.value,
          //     ),
          //     optionsBuilder: (textValue) {
          //       if (textValue.text.isEmpty) {
          //         return List.empty();
          //       } else {
          //         if (textValue.text.length == 1) {
          //           controller.state.slectedCity.value = "";
          //           return controller.state.selecteCity.where((element) =>
          //               element
          //                   .toLowerCase()
          //                   .contains(textValue.text.toLowerCase()));
          //         } else {
          //           controller.state.slectedCity.value = textValue.text;
          //           return controller.state.selecteCity.where((element) =>
          //               element
          //                   .toLowerCase()
          //                   .contains(textValue.text.toLowerCase()));
          //         }
          //       }
          //     },
          //     fieldViewBuilder: (context, textEditingController, focusNode,
          //         onFieldSubmitted) {
          //       return CustomTextField(
          //         focusnode: focusNode,
          //         onEditingComplete: onFieldSubmitted,
          //         controller: textEditingController,
          //         hintText: 'City'.tr,
          //         onChange: (value) {
          //           // controller.state.categoryName = value;
          //         },
          //         prefixIcon: cityIcon,
          //         suffixIcon: const Icon(
          //           Icons.keyboard_arrow_down_outlined,
          //           color: Palette.primaryColor,
          //         ),
          //       );
          //     },
          //   ),
          // ),
          // SizedBox(height: 16.h),
          // CustomTextField(
          //   hintText: 'State'.tr,
          //   onChange: (value) {},
          //   prefixIcon: stateIcon,
          // ),
          // SizedBox(height: 16.h),
          // CustomTextField(
          //   hintText: 'Zip code'.tr,
          //   onChange: (value) {},
          //   prefixIcon: zipcodeIcon,
          // ),

          Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: SubmitButton(
              backGroundColor: Palette.primaryColor,
              onTap: () {
                Get.offAll(() => const Dashboard());
              },
              title: "Sign Up".tr,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(
                  'Already have an account?'.tr,
                  style: TextStyles.bodyMedium,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => Get.offAll(() => SignIn()),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(
                    'Sign In'.tr,
                    style: TextStyles.bodyMedium.copyWith(
                      color: Palette.primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: [
              const Expanded(
                child: CustomDivider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  "or".tr,
                  style: TextStyles.bodyLarge,
                ),
              ),
              const Expanded(
                child: CustomDivider(),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          SocialButton(
            onTap: () {},
            status: "GO",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: SocialButton(
              onTap: () {},
              status: "AP",
            ),
          ),
          // SizedBox(height: 16.h),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'By signing in you accept our'.tr,
                  style: TextStyles.bodyMedium,
                ),
                TextSpan(
                    text: 'Terms of Services'.tr,
                    style: TextStyles.bodyMedium
                        .copyWith(color: Palette.primaryColor),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
                TextSpan(
                  text: 'and'.tr,
                  style: TextStyles.bodyMedium,
                ),
                TextSpan(
                    text: 'Privacy Policy.'.tr,
                    style: TextStyles.bodyMedium
                        .copyWith(color: Palette.primaryColor),
                    recognizer: TapGestureRecognizer()..onTap = () {}),
              ],
            ),
          ),
          SizedBox(height: 36.h)
        ],
      ),
    );
  }
}
