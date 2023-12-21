// ignore_for_file: file_names, avoid_print

import 'package:notary_ping_notary/src/states/profile/ProfileState.dart';

import '../../../index.dart';
import '../../constant/time_formate.dart';

class ProfileController extends GetxController {
  final state = ProfileState();
  changeIsShowAnswer(int index) {
    state.filteredFAQS[index].isShowAnswer =
        !state.filteredFAQS[index].isShowAnswer!;
  }

  changeSelectCountryCode(String value) {
    state.countryCodee.value = value;
  }

  selectDate(BuildContext context, TextEditingController controller) async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: const DatePickerThemeData(
              surfaceTintColor: Palette.whiteColor,
            ),
            colorScheme: const ColorScheme.light(
              primary: Palette.primaryColor, // header background color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: TextStyles.titleLarge,
                // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then(
      (value) => {
        FocusManager.instance.primaryFocus?.unfocus(),
        if (value != null)
          {
            controller.text = onlyDate.format(value),
          },
      },
    );
  }
}
