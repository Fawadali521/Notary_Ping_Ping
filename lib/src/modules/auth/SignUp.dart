import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:page_transition/page_transition.dart';

import '../../../styles.dart';
import '../../utility/CityDropDown.dart';
import '../../utility/SocialButton.dart';
import '../../utility/StateDropDown.dart';
import '../../utility/SubmitButton.dart';
import '../../utility/TextField.dart';
import '../../utility/TextFieldEmail.dart';
import '../../utility/TextFieldName.dart';
import '../../utility/TextFieldPassword.dart';
import 'OtpVerification.dart';
import 'SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
   PageController pageController = PageController(initialPage: 0);
  int currentPage = 0; // Current page index

  DateTime? selectedDate; // Add selectedDate variable

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        children: [
          const SafeArea(
            child: SizedBox(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/logo/full-logo.png",
                  fit: BoxFit.contain,
                  width: width - 40,
                  height: height * 0.08,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 25,
            ),
            child: Text(
              "Let's\nSign You Up!",
              style: TextStyles.authTitleHeadingBlack,
            ),
          ),

          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: notaryContent(context),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Opacity(
                  opacity: 0.5,
                  child: Text("Already have an account?",
                      style: TextStyles.normalHeading),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: const SignIn()));
                    },
                    child:
                        const Text("SIGN IN", style: TextStyles.normalHeading)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: SubmitButton(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade,
                        child: OtpVerification()));
              },
              title: "Continue",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (width - 40) / 2 - 30,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderStyles.norm,
                  ),
                ),
                const Opacity(
                  opacity: 0.5,
                  child: Text(
                    "OR",
                    style: TextStyles.normalHeading,
                  ),
                ),
                Container(
                  width: (width - 40) / 2 - 30,
                  height: 2,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderStyles.norm,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SocialButton(
              onTap: () {},
              status: "AP",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: SocialButton(
              onTap: () {},
              status: "GO",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'By Signing Up, you accept our ',
                  style: TextStyles().privacyBLack,
                ),
                TextSpan(
                    text: ' Terms Of Service',
                    style: TextStyles().privacySecondaryColor,
                    recognizer: TapGestureRecognizer()..onTap = () {}),
                TextSpan(
                  text: ' and ',
                  style: TextStyles().privacyBLack,
                ),
                TextSpan(
                    text: 'Privacy Policy.',
                    style: TextStyles().privacySecondaryColor,
                    recognizer: TapGestureRecognizer()..onTap = () {}),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

Widget userContent() {
  return ListView(

    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    children: const [
      Padding(padding: EdgeInsets.only(bottom: 15), child: TextFieldName()),
      Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: TextFieldEmail(),
      ),
      Padding(padding: EdgeInsets.only(bottom: 15), child: PasswordField()),
    ],
  );
}

Widget notaryContent(BuildContext context) {
  return ListView(
    padding: const EdgeInsets.only(top: 10),
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
    children: [
      const Padding(
          padding: EdgeInsets.only(bottom: 10), child: TextFieldName()),
      const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: TextFieldEmail()),
        const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CityDropDown(),
              StateDropDown()],
          )),
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CommonTextField(
          hintText: 'Select commission expiry date',
          prefixIcon: const Icon(
            Icons.calendar_month,
            color: Palette.primaryColor,
          ),
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(DateTime.now().year + 10),
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData.light(),
                  child: child!,
                );
              },
            );

            if (pickedDate != null) {
              // Handle the selected date
              print("Selected Date: $pickedDate");
            }
          },
        ),
      ),
      const Padding(
          padding: EdgeInsets.only( bottom: 10), child: PasswordField(

      )),
    ],
  );
}
