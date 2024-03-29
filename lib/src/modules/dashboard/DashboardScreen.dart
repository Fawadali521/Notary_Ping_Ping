// ignore_for_file: file_names

import 'package:notary_ping_notary/src/modules/dashboard/bookings/Bookings.dart';
import 'package:notary_ping_notary/src/modules/dashboard/home/Home.dart';
import 'package:notary_ping_notary/src/modules/dashboard/message/Message.dart';
import 'package:notary_ping_notary/src/modules/dashboard/profile/Profile.dart';

import '../../../index.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);
// @override
  // void initState() {
  //   pageController = PageController(
  //     initialPage: currentIndex,
  //   );
  //   super.initState();
  // }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (page) {
            setState(() {
              currentIndex = page;
            });
          },
          children: [
            const Home(), // Home screen
            const Bookings(), // Bookings screen
            const Message(), // Message screen
            Profile(), // Profile screen
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            pageController.jumpToPage(index);
            setState(() {});
          },
          backgroundColor: Palette.whiteColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Palette.primaryColor,
          unselectedItemColor: Palette.greyTextColor,
          selectedLabelStyle:
              TextStyles.bodySmall.copyWith(color: Palette.primaryColor),
          unselectedLabelStyle: TextStyles.bodySmall,
          items: [
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(homeIcon),
                size: 24,
              ),
              label: 'Home'.tr, // Home label
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(bookingsIcon),
                size: 24,
              ),
              label: 'Bookings'.tr, // Bookings label
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(messageIcon),
                size: 24,
              ),
              label: 'Message'.tr, // Message label
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(
                AssetImage(userIcon),
                size: 24,
              ),
              label: 'Profile'.tr, // Profile label
            ),
          ],
        ));
  }
}
