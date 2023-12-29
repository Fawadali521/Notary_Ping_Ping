// ignore_for_file: file_names

import 'package:notary_ping_notary/src/modules/auth/signin/SignIn.dart';
import 'package:notary_ping_notary/src/modules/dashboard/profile/AppSetting.dart';
import 'package:notary_ping_notary/src/modules/dashboard/profile/ChangePassword.dart';
import 'package:notary_ping_notary/src/modules/dashboard/profile/CustomerSupport.dart';
import 'package:notary_ping_notary/src/modules/dashboard/profile/EditProfile.dart';
import 'package:notary_ping_notary/src/modules/dashboard/profile/PrivacyPolicy.dart';
import 'package:notary_ping_notary/src/modules/dashboard/profile/TermAndCondition.dart';
import 'package:notary_ping_notary/src/modules/dashboard/profile/address_managment/AddressBook.dart';
import 'package:notary_ping_notary/src/modules/dashboard/profile/edit_notary/EditNotaryProfessional.dart';
import 'package:notary_ping_notary/src/modules/dashboard/profile/subscription/MySubscription.dart';
import 'package:notary_ping_notary/src/modules/dashboard/profile/utility/CustomProfileItem.dart';
import 'package:notary_ping_notary/src/states/profile/ProfileController.dart';

import '../../../../index.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      appBar: CustomAppBar(
        title: 'Profile'.tr,
        isNotification: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          // User profile image
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 70,
              width: 70,
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          user,
                          fit: BoxFit.cover,
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Palette.whiteColor,
                        radius: 10,
                        child: CircleAvatar(
                          backgroundColor: Palette.greenColor,
                          radius: 8,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          // User name
          Text(
            "Mansurul Hoque".tr,
            style: TextStyles.headlineSmall,
            textAlign: TextAlign.center,
          ),
          // User email
          Text(
            "mansurul952@gmail.com".tr,
            style: TextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 12.h),
          // Edit profile item
          CustomProfileItem(
            title: "Edit profile",
            icon: editIcon,
            onTap: () => Get.to(() => const EditProfile()),
          ),
          // Edit notary profile item
          CustomProfileItem(
            title: "Edit notary profile",
            icon: editIcon,
            onTap: () => Get.to(() => EditNotaryProfessional()),
          ),
          // Address book item
          CustomProfileItem(
            title: "Address book",
            icon: locationIcon,
            onTap: () => Get.to(() => AddressBook()),
          ),
          // My subscription item
          CustomProfileItem(
            title: "My subscription",
            icon: settingIcon,
            onTap: () => Get.to(() => MySubscription()),
          ),
          // App setting item
          CustomProfileItem(
            title: "App setting",
            icon: settingIcon,
            onTap: () => Get.to(() => const AppSetting()),
          ),
          // Change password item
          CustomProfileItem(
            title: "Change password",
            icon: lockIcon,
            onTap: () => Get.to(() => ChangePassword()),
          ),
          // Customer support item
          CustomProfileItem(
            title: "Customer support",
            icon: supportIcon,
            onTap: () => Get.to(() => const CustomerSupport()),
          ),
          // Terms and conditions item
          CustomProfileItem(
            title: "Terms and conditions",
            icon: termsIcon,
            onTap: () => Get.to(() => const TermAndCondition()),
          ),
          // Privacy policy item
          CustomProfileItem(
            title: "Privacy policy",
            icon: policyIcon,
            onTap: () => Get.to(() => const PrivacyPolicy()),
          ),
          // Log out item
          CustomProfileItem(
            title: "Log Out",
            icon: logoutIcon,
            onTap: () => Get.offAll(() => SignIn()),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
