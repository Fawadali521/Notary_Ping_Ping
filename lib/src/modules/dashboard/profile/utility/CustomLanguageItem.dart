// ignore_for_file: file_names

import '../../../../../index.dart';

class CustomLanguageItem extends StatelessWidget {
  final String imgUrl; // The image URL for the language icon
  final String name; // The name of the language
  final String vlaue; // The value of the language
  final String groupValue; // The currently selected language value
  final void Function(String?)? onTap; // Callback function when the language is selected

  const CustomLanguageItem({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.vlaue,
    required this.groupValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      margin: const EdgeInsets.only(bottom: 16), // Margin at the bottom of the container
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5), // Padding inside the container
      decoration: BoxDecoration(
        borderRadius: BorderStyles.medium, // Border radius of the container
        border: Border.all(
          color: Palette.languageBorderColor, // Border color of the container
        ),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              imgUrl, // Image asset for the language icon
              fit: BoxFit.contain, // Fit the image within the container
              height: 24, // Height of the image
              width: 24, // Width of the image
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16), // Padding around the language name
            child: Text(
              name, // Displayed language name
              style: TextStyles.bodyMedium.copyWith(
                fontSize: 16, // Font size of the language name
                color: Palette.blackColor, // Color of the language name
              ),
            ),
          ),
          const Spacer(), // Spacer to push the radio button to the right
          Transform.scale(
            scale: 1.5, // Scale factor of the radio button
            child: Radio(
              activeColor: Palette.primaryColor, // Color of the selected radio button
              value: vlaue, // Value of the radio button
              groupValue: groupValue, // Currently selected radio button value
              onChanged: onTap, // Callback function when the radio button is changed
            ),
          ),
        ],
      ),
    );
  }
}
