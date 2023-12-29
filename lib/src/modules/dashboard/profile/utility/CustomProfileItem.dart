// ignore_for_file: file_names

import '../../../../../index.dart';

class CustomProfileItem extends StatelessWidget {
  final String icon; // The path to the icon asset.
  final String title; // The title of the profile item.
  final VoidCallback onTap; // The callback function when the item is tapped.
  final Color? backgroundColor; // The background color of the item.
  final Color? iconColor; // The color of the icon.

  const CustomProfileItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
        margin: EdgeInsets.symmetric(vertical: 8.w, horizontal: 20.w),
        decoration: BoxDecoration(
          color: backgroundColor ?? Palette.whiteColor,
          borderRadius: BorderStyles.normal,
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              height: 20,
              width: 20,
              color: iconColor ?? Palette.greyTextColor,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 12.w),
            Text(
              title.tr, // Translated title text.
              style: TextStyles.bodyLarge,
            ),
            const Spacer(),
            Image.asset(
              arrowForwardIosIcon, // The path to the forward arrow icon asset.
              height: 16,
              width: 16,
              color: iconColor ?? Palette.greyTextColor,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
