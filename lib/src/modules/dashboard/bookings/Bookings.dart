// ignore_for_file: file_names

import 'package:notary_ping_notary/src/modules/dashboard/bookings/Tracking.dart';
import 'package:notary_ping_notary/src/modules/dashboard/bookings/utility/CustomBookingButon.dart';
import 'package:notary_ping_notary/src/modules/dashboard/bookings/utility/CustomBookingItem.dart';

import '../../../../index.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  int currentIndex = 0;
  late final PageController? pageController;
  @override
  void initState() {
    pageController = PageController(
      initialPage: currentIndex,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      appBar: CustomAppBar(
        title: 'Booking'.tr,
        isNotification: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 35.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 16.w),
                  child: GestureDetector(
                    onTap: () {
                      currentIndex = 0;
                      pageController?.jumpToPage(0);
                      setState(() {});
                    },
                    child: Container(
                      height: 35.h,
                      padding: const EdgeInsets.only(
                          left: 4, right: 14, top: 7, bottom: 7),
                      decoration: BoxDecoration(
                        color: currentIndex == 0
                            ? Palette.primaryColor
                            : Palette.whiteColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            currentIndex == 0 ? newIcon : newunselectedIcon,
                            height: 30.sp,
                            width: 30.sp,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "New".tr,
                            style: TextStyles.titleMedium.copyWith(
                              color: currentIndex == 0
                                  ? Palette.whiteColor
                                  : Palette.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomBookingButon(
                  onTap: () {
                    currentIndex = 1;
                    pageController?.jumpToPage(1);
                    setState(() {});
                  },
                  title: 'Currents booking'.tr,
                  icon: bookingsIcon,
                  isSlected: currentIndex == 1 ? true : false,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 20.w),
                  child: CustomBookingButon(
                    onTap: () {
                      currentIndex = 2;
                      pageController?.jumpToPage(2);
                      setState(() {});
                    },
                    title: 'History'.tr,
                    icon: historyIcon,
                    isSlected: currentIndex == 2 ? true : false,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (page) {
                setState(() {
                  currentIndex = page;
                });
              },
              children: [
                ListView.builder(
                  itemCount: userNamesList.length,
                  itemBuilder: (context, index) {
                    return CustomBookingItem(
                      imgUrl: userImages[index],
                      name: userNamesList[index],
                      date: 'June 10,2023',
                      time: '10:30 AM',
                      bookingStatus: "New",
                      onTap: () => Get.to(() => const Tracking()),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: userNamesList.length,
                  itemBuilder: (context, index) {
                    return CustomBookingItem(
                      imgUrl: userImages[index],
                      name: userNamesList[index],
                      date: 'June 10,2023',
                      time: '10:30 AM',
                      bookingStatus: "Tacking",
                      onTap: () => Get.to(() => const Tracking()),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: userNamesList.length,
                  itemBuilder: (context, index) {
                    return CustomBookingItem(
                      imgUrl: userImages[index],
                      name: userNamesList[index],
                      date: 'June 10,2023',
                      time: '10:30 AM',
                      bookingStatus: "View",
                      onTap: () {
                        showHistoryViewAlert(context);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

showHistoryViewAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Palette.whiteColor,
        surfaceTintColor: Palette.whiteColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        contentPadding: const EdgeInsets.all(0),
        insetPadding: const EdgeInsets.symmetric(horizontal: 14),
        content: SizedBox(
          width: 1.sw,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: 5, left: 5, top: 8, right: 8),
                    child: Icon(
                      Icons.close,
                      color: Palette.redColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(user),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Brooklyn Simmons",
                          style: TextStyles.titleMedium,
                        ),
                        Text(
                          "27 jan,2022 4:20 pm",
                          style: TextStyles.bodySmall,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Booking ID",
                      style: TextStyles.bodySmall,
                    ),
                    Text(
                      "ABX049123182",
                      style: TextStyles.titleMedium,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Service type",
                      style: TextStyles.bodySmall,
                    ),
                    Text(
                      "Signature for property documents",
                      style: TextStyles.titleMedium,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Place",
                      style: TextStyles.bodySmall,
                    ),
                    Text(
                      "Krupnicza 10,31-123 Krakow",
                      style: TextStyles.titleMedium,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
