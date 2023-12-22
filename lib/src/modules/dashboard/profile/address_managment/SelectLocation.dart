// ignore_for_file: file_names

import 'dart:developer';
import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../index.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  SelectLocationState createState() => SelectLocationState();
}

class SelectLocationState extends State<SelectLocation> {
  bool isLoding = false;
  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();
  List<double> latitude = [];
  List<double> longitude = [];
  List<LatLng> latlang = [];
  List<Marker> markers = []; //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
  late LatLng startLocation; //= const LatLng(34.611139, 72.4623079);
  LatLng endLocation = const LatLng(34.60205, 72.454015);
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  double paddingBottom = 0.45;
  @override
  void initState() {
    latlang.add(endLocation);
    setState(() {
      isLoding = true;
    });
    // widgetToImage();
    if (Platform.isAndroid) {
      checkLocationStatus();
    } else {
      getCurrentLocation();
    }
    super.initState();
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    log("start geting location");
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      log("location get ==> $position");
      setState(() {
        startLocation = LatLng(position.latitude, position.longitude);
        latlang.add(startLocation);
        isLoding = false;
      });
      log("location get ==> $startLocation");
      // addMarker(latlang);
    } catch (e) {
      log("Error in location get ==> $e");
      startLocation = const LatLng(34.611139, 72.4623079);
      // addMarker(latlang);
      // checkLocationStatus();
    }
  }

  //check location permission status
  Future<void> checkLocationStatus() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      getCurrentLocation();
    } else {
      await Permission.location.request();
      var newStatus = await Permission.location.status;
      if (newStatus.isGranted) {
        getCurrentLocation();
      } else {
        SnackBarToast(
          message: "Please allow location permission from app setting",
        );
        await openAppSettings();
        checkLocationStatus();
      }
    }
  }

  animateToMyLocation() {
    setState(() {
      mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(startLocation, 16),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.bgColor,
      body: Stack(
        children: [
          isLoding
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 1.sh,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(bottom: paddingBottom.sh),
                  child: GoogleMap(
                    padding: EdgeInsets.only(top: 0.04.sh, bottom: 0.03.sh),
                    myLocationEnabled: true, //set your location enable
                    myLocationButtonEnabled: false,
                    // compassEnabled: true,
                    zoomGesturesEnabled: true, //enable Zoom in, out on map
                    initialCameraPosition: CameraPosition(
                      target: startLocation, //initial position
                      zoom: 14.0, //initial zoom level
                    ),
                    polylines: Set<Polyline>.of(
                        polylines.values), //polylines to show directions
                    markers: markers.toSet(), //markers to show on map
                    // mapType: MapType.normal, //map type
                    onMapCreated: (controller) {
                      //method called when map is created
                      setState(() {
                        mapController = controller;
                      });
                    },
                  ),
                ),
          SizedBox(
            child: NotificationListener<DraggableScrollableNotification>(
              onNotification: (DraggableScrollableNotification dSNotification) {
                paddingBottom = dSNotification.extent - 0.03;
                setState(() {});
                return true; // Return true to indicate the notification is handled
              },
              child: DraggableScrollableSheet(
                maxChildSize: .5,
                initialChildSize: .5,
                minChildSize: 0.07,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Palette.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 16.h,
                      ),
                      controller: scrollController,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 0,
                              color: Palette.dotColor,
                              thickness: 3,
                              endIndent: .34.sw,
                              indent: .34.sw,
                            ),
                            SizedBox(height: 12.h),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Add address".tr,
                                style: TextStyles.titleLarge,
                              ),
                            ),
                            const SizedBox(height: 12),
                            SubmitButton(
                              onTap: () {
                                // showCancelBookingAlert(context);
                              },
                              title: "Enter complete address".tr,
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          topBar(),
        ],
      ),
    );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
  Widget topBar() {
    return Positioned(
      top: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SafeArea(bottom: false, child: SizedBox()),
          Row(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 16.h),
                        child: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Palette.blackColor,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: .3.sw, vertical: 8.h),
                      child: Text(
                        "Select location".tr,
                        style: TextStyles.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            width: Get.width,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: "Search".tr,
                    prefixIcon: searchIcon,
                    prefixIconColor: Palette.greyTextColor,
                    borderRadius: BorderStyles.searchTextField,
                    fillColor: Palette.whiteColor,
                    borderColor: Palette.greyTextColor.withOpacity(0.5),
                  ),
                ),
                SizedBox(width: 16.w),
                GestureDetector(
                  onTap: () async {
                    await getCurrentLocation();
                    animateToMyLocation();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Palette.whiteColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Palette.greyTextColor.withOpacity(0.5),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        mapsIcon,
                        height: 24,
                        width: 24,
                        color: Palette.blackColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

showCancelBookingAlert(BuildContext context) {
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
          content: Column(
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
              const CircleAvatar(
                radius: 45,
                backgroundColor: Palette.lightRedColor,
                child: CircleAvatar(
                  radius: 38,
                  backgroundColor: Palette.redColor,
                  child: Icon(
                    Icons.close,
                    color: Palette.whiteColor,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Cancel booking".tr,
                style: TextStyles.headlineLarge,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 30, left: 20, right: 20),
                child: Text(
                  "Are you sure do you want to cancel this booking".tr,
                  style: TextStyles.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: SubmitButton(
                  onTap: () {},
                  title: "Cancel booking".tr,
                ),
              ),
            ],
          ),
        );
      });
}
