// ignore_for_file: file_names

import 'package:notary_ping_notary/src/modules/dashboard/profile/edit_notary/EditNotaryServices.dart';
import 'package:notary_ping_notary/src/states/profile/ProfileController.dart';

import '../../../../../index.dart';

class EditNotaryProfessional extends StatelessWidget {
  EditNotaryProfessional({super.key});
  final ProfileController controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      appBar: CustomAppBar(
        color: Palette.whiteColor,
        title: 'Edit Notary Profile'.tr,
        isBack: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          Text(
            "Professional information".tr,
            style: TextStyles.titleLarge,
          ),
          SizedBox(height: 12.h),
          CustomTextField(
            hintText: 'License date'.tr,
            onTap: () => controller.selectDate(
              context,
              controller.state.licenseDate,
            ),
            controller: controller.state.licenseDate,
            keyboardType: TextInputType.number,
            suffixIcon: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Image.asset(
                dateSelectIcon,
                height: 20,
                width: 20,
                color: Palette.primaryColor,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            hintText: 'Commission expiration date'.tr,
            controller: controller.state.expirationDate,
            onTap: () => controller.selectDate(
              context,
              controller.state.expirationDate,
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Image.asset(
                dateSelectIcon,
                height: 20,
                width: 20,
                color: Palette.primaryColor,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            hintText: 'License number'.tr,
            onChange: (value) {},
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16.h),
          LayoutBuilder(
            builder: (context, constraints) => RawAutocomplete<String>(
              optionsViewBuilder: (BuildContext context,
                  AutocompleteOnSelected<String> onSelected,
                  Iterable<String> options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    child: SizedBox(
                      // height: 200.0,
                      width: constraints.biggest.width,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);
                          return GestureDetector(
                            onTap: () {
                              onSelected(option);
                            },
                            child: ListTile(
                              title: Text(option),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              initialValue: TextEditingValue(
                text: controller.state.slectedCity.value,
              ),
              optionsBuilder: (textValue) {
                if (textValue.text.isEmpty) {
                  return List.empty();
                } else {
                  if (textValue.text.length == 1) {
                    controller.state.slectedCity.value = "";
                    return controller.state.selecteCity.where((element) =>
                        element
                            .toLowerCase()
                            .contains(textValue.text.toLowerCase()));
                  } else {
                    controller.state.slectedCity.value = textValue.text;
                    return controller.state.selecteCity.where((element) =>
                        element
                            .toLowerCase()
                            .contains(textValue.text.toLowerCase()));
                  }
                }
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return CustomTextField(
                  focusnode: focusNode,
                  onEditingComplete: onFieldSubmitted,
                  controller: textEditingController,
                  hintText: 'License state'.tr,
                  onChange: (value) {
                    // controller.state.categoryName = value;
                  },
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Palette.primaryColor,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          LayoutBuilder(
            builder: (context, constraints) => RawAutocomplete<String>(
              optionsViewBuilder: (BuildContext context,
                  AutocompleteOnSelected<String> onSelected,
                  Iterable<String> options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    child: SizedBox(
                      // height: 200.0,
                      width: constraints.biggest.width,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);
                          return GestureDetector(
                            onTap: () {
                              onSelected(option);
                            },
                            child: ListTile(
                              title: Text(option),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              initialValue: TextEditingValue(
                text: controller.state.slectedCity.value,
              ),
              optionsBuilder: (textValue) {
                if (textValue.text.isEmpty) {
                  return List.empty();
                } else {
                  if (textValue.text.length == 1) {
                    controller.state.slectedCity.value = "";
                    return controller.state.selecteCity.where((element) =>
                        element
                            .toLowerCase()
                            .contains(textValue.text.toLowerCase()));
                  } else {
                    controller.state.slectedCity.value = textValue.text;
                    return controller.state.selecteCity.where((element) =>
                        element
                            .toLowerCase()
                            .contains(textValue.text.toLowerCase()));
                  }
                }
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return CustomTextField(
                  focusnode: focusNode,
                  onEditingComplete: onFieldSubmitted,
                  controller: textEditingController,
                  hintText: 'Specialty'.tr,
                  onChange: (value) {
                    // controller.state.categoryName = value;
                  },
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Palette.primaryColor,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          LayoutBuilder(
            builder: (context, constraints) => RawAutocomplete<String>(
              optionsViewBuilder: (BuildContext context,
                  AutocompleteOnSelected<String> onSelected,
                  Iterable<String> options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    child: SizedBox(
                      // height: 200.0,
                      width: constraints.biggest.width,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);
                          return GestureDetector(
                            onTap: () {
                              onSelected(option);
                            },
                            child: ListTile(
                              title: Text(option),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              initialValue: TextEditingValue(
                text: controller.state.slectedCity.value,
              ),
              optionsBuilder: (textValue) {
                if (textValue.text.isEmpty) {
                  return List.empty();
                } else {
                  if (textValue.text.length == 1) {
                    controller.state.slectedCity.value = "";
                    return controller.state.selecteCity.where((element) =>
                        element
                            .toLowerCase()
                            .contains(textValue.text.toLowerCase()));
                  } else {
                    controller.state.slectedCity.value = textValue.text;
                    return controller.state.selecteCity.where((element) =>
                        element
                            .toLowerCase()
                            .contains(textValue.text.toLowerCase()));
                  }
                }
              },
              fieldViewBuilder: (context, textEditingController, focusNode,
                  onFieldSubmitted) {
                return CustomTextField(
                  focusnode: focusNode,
                  onEditingComplete: onFieldSubmitted,
                  controller: textEditingController,
                  hintText: 'Practice area'.tr,
                  onChange: (value) {
                    // controller.state.categoryName = value;
                  },
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Palette.primaryColor,
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(height: 80.h),
          SubmitButton(
            title: 'Continue'.tr,
            onTap: () => Get.to(() => const EditNotaryServices()),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
