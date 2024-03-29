// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:notary_ping_notary/src/modules/dashboard/profile/utility/CustomLanguageItem.dart';
import 'package:notary_ping_notary/src/states/profile/ProfileController.dart';

import '../../../../index.dart';

class AppSetting extends StatefulWidget {
  const AppSetting({Key? key}) : super(key: key);

  @override
  State<AppSetting> createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: CustomAppBar(
        color: Palette.whiteColor,
        title: 'App setting'.tr,
        isBack: true,
      ),
      body: Stack(
        children: [
          // Widget to display the list of settings
          Obx(
            () => ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              children: [
                const SizedBox(height: 20),
                // Widget for the "Notification" setting
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notification".tr,
                          style: TextStyles.titleSmall,
                        ),
                        Text(
                          "Only Push Notification will be disable!".tr,
                          style: TextStyles.bodySmall,
                        ),
                      ],
                    ),
                    CupertinoSwitch(
                      activeColor: Palette.primaryColor,
                      value: controller.state.isNotification.value,
                      onChanged: (value) {
                        controller.state.isNotification.value =
                            !controller.state.isNotification.value;
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: const CustomDivider(),
                ),
                // Widget for the "Availability" setting
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Availability".tr,
                          style: TextStyles.titleSmall,
                        ),
                        Text(
                          "Only show online will be disable!".tr,
                          style: TextStyles.bodySmall,
                        ),
                      ],
                    ),
                    CupertinoSwitch(
                      activeColor: Palette.primaryColor,
                      value: controller.state.isAvailability.value,
                      onChanged: (value) {
                        controller.state.isAvailability.value =
                            !controller.state.isAvailability.value;
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: const CustomDivider(),
                ),
                // Widget for the list of languages
                ListView.builder(
                  itemCount: controller.state.languages.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => CustomLanguageItem(
                    name: controller.state.allLanguages[index],
                    imgUrl: engilshIcon,
                    vlaue: controller.state.allLanguages[index],
                    groupValue: controller.state.groupValue.value,
                    onTap: (value) {
                      controller.state.groupValue.value = value!;
                      setState(() {});
                    },
                  ),
                ),

                // Add more languages as needed
              ],
            ),
          ),
          // Widget for the submit button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SubmitButton(onTap: () {}, title: "Change".tr),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
