// ignore_for_file: file_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:notary_ping_notary/index.dart';
import 'package:notary_ping_notary/src/modules/dashboard/home/BarChart.dart';
import 'package:notary_ping_notary/src/modules/dashboard/home/utility/HomeTrakingItem.dart';
import 'package:notary_ping_notary/src/states/dashboard/DashboardController.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final DashboardController controller = Get.put(DashboardController());
  late int showingTooltip;

  @override
  void initState() {
    showingTooltip = -1;
    super.initState();
  }

  BarChartGroupData generateGroupData(int x, int y) {
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: showingTooltip == x ? [0] : [],
      barRods: [
        BarChartRodData(toY: y.toDouble()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.whiteColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        shrinkWrap: true,
        children: [
          const SafeArea(bottom: false, child: SizedBox()),
          SizedBox(height: 8.h),
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
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
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Palette.whiteColor,
                          radius: 7,
                          child: CircleAvatar(
                            backgroundColor: Palette.greenColor,
                            radius: 5,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mansurul Hoque".tr,
                    style: TextStyles.titleLarge,
                  ),
                  Text(
                    "mansurul952@gmail.com".tr,
                    style: TextStyles.bodySmall,
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                // onTap: () => Get.to(() => const Notification()),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Stack(
                    children: [
                      Image.asset(
                        bellIcon,
                        color: Palette.blackColor,
                        height: 28,
                        width: 28,
                        fit: BoxFit.contain,
                      ),
                      Positioned(
                        right: 0,
                        top: 2,
                        child: CircleAvatar(
                          radius: 7,
                          backgroundColor: Palette.primaryColor,
                          child: Text(
                            "5",
                            style: TextStyles.bodyLarge.copyWith(
                              color: Palette.whiteColor,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 24.h),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 30.h),
            decoration: BoxDecoration(
              borderRadius: BorderStyles.medium,
              image: const DecorationImage(
                image: AssetImage(
                  earningBackgroundIcon,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total earning",
                      style: TextStyles.headlineSmall.copyWith(
                        color: Palette.whiteColor,
                      ),
                    ),
                    Text(
                      "Cash available",
                      style: TextStyles.bodyLarge.copyWith(
                        color: Palette.whiteColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  "\$ 415,38",
                  style: TextStyles.headlineMedium.copyWith(
                    color: Palette.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: HomeTrakingItem(
                  name: "Total Bookings",
                  icon: numbersIcon,
                  value: "120",
                  percentage: '+55',
                ),
              ),
              SizedBox(width: 16.w),
              const Expanded(
                child: HomeTrakingItem(
                  name: "Total Earning",
                  icon: dollerIcon,
                  value: "\$ 415,38",
                  percentage: '+55',
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: HomeTrakingItem(
                  name: "Week Booking",
                  icon: numbersIcon,
                  value: "120",
                  percentage: '+55',
                ),
              ),
              SizedBox(width: 10.w),
              const Expanded(
                child: HomeTrakingItem(
                  name: "Week Earning",
                  icon: dollerIcon,
                  value: "\$ 415,38",
                  percentage: '+55',
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: const BarChartHome(),
          ),
          Obx(
            () => Card(
              elevation: 1,
              margin: EdgeInsets.zero,
              color: Palette.whiteColor,
              surfaceTintColor: Palette.whiteColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Availability".tr,
                          style: TextStyles.titleSmall,
                        ),
                        Text(
                          "Only show online will be disable!".tr,
                          style: TextStyles.bodySmall,
                        ),
                      ],
                    ),
                    CupertinoSwitch(
                      activeColor: Palette.primaryColor,
                      value: controller.state.isAvailability.value,
                      onChanged: (value) {
                        controller.state.isAvailability.value =
                            !controller.state.isAvailability.value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
