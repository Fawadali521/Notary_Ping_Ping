// ignore_for_file: file_names

import 'package:notary_ping_notary/src/modules/dashboard/DashboardScreen.dart';
import 'package:notary_ping_notary/src/states/profile/ProfileController.dart';

import '../../../../../index.dart';

class EditNotaryServices extends StatefulWidget {
  const EditNotaryServices({super.key});

  @override
  State<EditNotaryServices> createState() => _EditNotaryServicesState();
}

class _EditNotaryServicesState extends State<EditNotaryServices> {
  final ProfileController controller = Get.find<ProfileController>();
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      appBar: CustomAppBar(
        color: Palette.bgColor,
        title: 'Edit Notary Profile'.tr,
        isBack: true,
      ),
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              Text(
                "Add services".tr,
                style: TextStyles.titleLarge,
              ),
              SizedBox(height: 12.h),
              Wrap(
                spacing: 5.w,
                runSpacing: 5.h,
                children: List.generate(
                  Infos().notaryServices.length,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectIndex = index;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        color: selectIndex == index
                            ? Palette.primaryColor
                            : Palette.whiteColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            Infos().notaryServicesImg[index],
                            height: 20,
                            width: 20,
                            color: selectIndex == index
                                ? Palette.whiteColor
                                : Palette.greyTextColor,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            Infos().notaryServices[index],
                            style: TextStyles.bodyMedium.copyWith(
                              color: selectIndex == index
                                  ? Palette.whiteColor
                                  : Palette.greyTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
                    title: 'Update'.tr,
                    onTap: () => Get.offAll(() => const Dashboard()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
