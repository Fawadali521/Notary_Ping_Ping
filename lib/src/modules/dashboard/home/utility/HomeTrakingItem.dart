// ignore_for_file: file_names

import '../../../../../index.dart';

class HomeTrakingItem extends StatelessWidget {
  final String name;
  final String icon;
  final String value;
  final String percentage;
  const HomeTrakingItem({
    super.key,
    required this.name,
    required this.icon,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Palette.whiteColor,
      surfaceTintColor: Palette.whiteColor,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.tr,
                  style: TextStyles.bodySmall,
                ),
                Row(
                  children: [
                    Text(
                      value.tr,
                      style: TextStyles.headlineLarge.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "$percentage%".tr,
                      style: TextStyles.bodySmall.copyWith(
                        color: Palette.greenColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Image.asset(
              icon,
              height: 24,
              width: 24,
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
    );
  }
}
