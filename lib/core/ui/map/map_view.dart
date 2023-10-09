import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  ///comment out after experiment
  // final dynamic locations;
  // final dynamic locations = const [
  //   LatLng(35.58514946, 139.5528549),
  //   LatLng(35.58692526, 139.5534508),
  //   LatLng(35.5887502, 139.5548775),
  //   LatLng(35.5874602, 139.5560623),
  // ];
  final Set<Marker>? marker;
  final double? height;
  final double? width;

  ///commented out for experiment
  final List<LatLng>? locations;

  LatLng? latLng;

  Position? position;

  // CameraPosition defaultPosition = CameraPosition(
  //   target: LatLng(23.8103, 90.4125),
  //   zoom: 10,
  // );


  // LocationModel _locationModel = LocationModel();

  // AddressMapPresenter? _presenter;

  // Completer<GoogleMapController> mapController = Completer();
  //
  // void getCenter(Completer<GoogleMapController> _controller) async {
  //   final GoogleMapController controller = await _controller.future;
  //   LatLngBounds visibleRegion = await controller.getVisibleRegion();
  //   LatLng centerLatLng = LatLng(
  //     (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
  //     (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) / 2,
  //   );
  //   onGetCenterLocation(centerLatLng);
  // }
  //
  // void onGetCenterLocation(LatLng centerLatLng) {}

  MapView(
      {super.key,
      this.height = 120,
      this.width,
      this.marker,
      ///commented out for experiment
      required this.locations});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width ?? MediaQuery.of(context).size.width - 72.0,
        child:
        // GoogleMap(
        //   // padding: isIos? EdgeInsets.only(bottom: 68, right: 8): EdgeInsets.all(0),
        //   myLocationEnabled: true,
        //   myLocationButtonEnabled: true,
        //   markers: marker!,
        //   mapType: MapType.normal,
        //   mapToolbarEnabled: true,
        //   initialCameraPosition: defaultPosition,
        //   onCameraIdle: () {
        //     getCenter(mapController);
        //   },
        //   onTap: (target) async {
        //     final GoogleMapController controller =
        //     await mapController.future;
        //     moveCamera(controller, target.latitude, target.longitude);
        //     print(latLng);
        //   },
        //   onMapCreated: (GoogleMapController controller) {
        //     mapController.complete(controller);
        //     moveCamera(
        //         controller,
        //         // position!.latitude ??
        //             23.7980791,
        //         // position!.longitude ??
        //             90.4048319);
        //   },
        //   cameraTargetBounds: CameraTargetBounds(LatLngBounds(
        //       southwest: new LatLng(20.67088328, 88.0844222351),
        //       northeast: new LatLng(26.4465255803, 92.6727209818))),
        //   onCameraMoveStarted: () {
        //     print(latLng);
        //   },
        //   zoomControlsEnabled: false,
        // ),
        GoogleMap(
          // compassEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(locations![0].latitude, locations![0].longitude),
            zoom: 13,
          ),
          markers:marker!,
          onMapCreated: (GoogleMapController controller) {},
          onTap: (LatLng latLng) {
            marker!.add(Marker(markerId: MarkerId('id-1'), position: latLng));
            print(latLng);
          },
        )
    );
  }
  // void moveCamera(GoogleMapController controller, double lat, double lng) {
  //   latLng = LatLng(lat, lng);
  //   controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
  //     target: latLng!,
  //     zoom: 15,
  //   )));
  // }
}
