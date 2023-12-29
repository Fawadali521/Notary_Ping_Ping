// ignore_for_file: file_names
// // ignore_for_file: file_names

// import 'package:notary_ping_notary/src/modules/dashboard/profile/edit_notary/EditNotaryProfessional.dart';
// import 'package:notary_ping_notary/src/states/profile/ProfileController.dart';
// import 'package:notary_ping_notary/src/utility/CustomDropDown.dart';

// import '../../../../../index.dart';

// class EditNotaryContact extends StatelessWidget {
//   EditNotaryContact({super.key});
//   final ProfileController controller = Get.find<ProfileController>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Palette.whiteColor,
//       appBar: CustomAppBar(
//         color: Palette.whiteColor,
//         title: 'Edit Notary Profile'.tr,
//         isBack: true,
//       ),
//       body: Stack(
//         children: [
//           ListView(
//             shrinkWrap: true,
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             children: [
//               Text(
//                 "Contact information".tr,
//                 style: TextStyles.titleLarge,
//               ),
//               SizedBox(height: 12.h),
//               CustomTextField(
//                 hintText: 'Work email'.tr,
//                 onChange: (value) {},
//                 prefixIcon: emailIcon,
//               ),
//               SizedBox(height: 16.h),
//               Row(
//                 children: [
//                   Obx(
//                     () => CustomDropDown(
//                       textStyle: TextStyles.bodyMedium.copyWith(
//                         color: Palette.blackColor,
//                       ),
//                       items: controller.state.slectCountryCode,
//                       selectedVal: controller.state.countryCodee.value,
//                       onChanged: (val) {
//                         controller.changeSelectCountryCode(val!);
//                       },
//                     ),
//                   ),
//                   SizedBox(width: 8.w),
//                   Expanded(
//                     flex: 5,
//                     child: CustomTextField(
//                       hintText: 'Phone number'.tr,
//                       onChange: (value) {
//                         // controller.state.confirmPassword = value;
//                       },
//                       keyboardType: TextInputType.number,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16.h),
//               CustomTextField(
//                 hintText: 'Suite or floor'.tr,
//                 onChange: (value) {
//                   // controller.state.name = value;
//                 },
//                 prefixIcon: suiteIcon,
//               ),
//               SizedBox(height: 16.h),
//               TextFormField(
//                 textAlignVertical: TextAlignVertical.center,
//                 maxLines: 3,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 style: TextStyles.bodyMedium.copyWith(
//                   color: Palette.blackColor,
//                 ),
//                 cursorColor: Palette.blackColor,
//                 decoration: InputDecoration(
//                   contentPadding:
//                       EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
//                   alignLabelWithHint: true,
//                   prefixIcon: Padding(
//                     padding: EdgeInsets.only(
//                         left: 16.w, right: 16.w, top: 16, bottom: 50),
//                     child: Image.asset(
//                       locationIcon,
//                       height: 20,
//                       width: 20,
//                       color: Palette.primaryColor,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   fillColor: Palette.bgTextFeildColor,
//                   filled: true,
//                   hintText: 'Enter your address'.tr,
//                   hintStyle: TextStyles.bodyMedium,
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderStyles.normal,
//                     borderSide: const BorderSide(
//                       color: Palette.bgTextFeildColor,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderStyles.normal,
//                     borderSide: const BorderSide(
//                       color: Palette.bgTextFeildColor,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 16.h),
//               LayoutBuilder(
//                 builder: (context, constraints) => RawAutocomplete<String>(
//                   optionsViewBuilder: (BuildContext context,
//                       AutocompleteOnSelected<String> onSelected,
//                       Iterable<String> options) {
//                     return Align(
//                       alignment: Alignment.topLeft,
//                       child: Material(
//                         elevation: 4.0,
//                         child: SizedBox(
//                           // height: 200.0,
//                           width: constraints.biggest.width,
//                           child: ListView.builder(
//                             padding: const EdgeInsets.all(8.0),
//                             itemCount: options.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               final String option = options.elementAt(index);
//                               return GestureDetector(
//                                 onTap: () {
//                                   onSelected(option);
//                                 },
//                                 child: ListTile(
//                                   title: Text(option),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   initialValue: TextEditingValue(
//                     text: controller.state.slectedCity.value,
//                   ),
//                   optionsBuilder: (textValue) {
//                     if (textValue.text.isEmpty) {
//                       return List.empty();
//                     } else {
//                       if (textValue.text.length == 1) {
//                         controller.state.slectedCity.value = "";
//                         return controller.state.selecteCity.where((element) =>
//                             element
//                                 .toLowerCase()
//                                 .contains(textValue.text.toLowerCase()));
//                       } else {
//                         controller.state.slectedCity.value = textValue.text;
//                         return controller.state.selecteCity.where((element) =>
//                             element
//                                 .toLowerCase()
//                                 .contains(textValue.text.toLowerCase()));
//                       }
//                     }
//                   },
//                   fieldViewBuilder: (context, textEditingController, focusNode,
//                       onFieldSubmitted) {
//                     return CustomTextField(
//                       focusnode: focusNode,
//                       onEditingComplete: onFieldSubmitted,
//                       controller: textEditingController,
//                       hintText: 'City'.tr,
//                       onChange: (value) {
//                         // controller.state.categoryName = value;
//                       },
//                       prefixIcon: cityIcon,
//                       suffixIcon: const Icon(
//                         Icons.keyboard_arrow_down_outlined,
//                         color: Palette.primaryColor,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 16.h),
//               CustomTextField(
//                 hintText: 'State'.tr,
//                 onChange: (value) {},
//                 prefixIcon: stateIcon,
//               ),
//               SizedBox(height: 16.h),
//               CustomTextField(
//                 hintText: 'Zip code'.tr,
//                 onChange: (value) {},
//                 prefixIcon: zipcodeIcon,
//               ),
//             ],
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   SubmitButton(
//                     title: 'Continue'.tr,
//                     onTap: () => Get.to(() => EditNotaryProfessional()),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
