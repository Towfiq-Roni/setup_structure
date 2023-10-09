import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> _openMapUrl(String googleUrl, String googleUrlIos) async {
    String mapUri = Uri.encodeFull(googleUrl);
    String mapUriIos = Uri.encodeFull(googleUrlIos);
    if (await canLaunchUrl(Uri.parse(mapUri))) {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(mapUriIos), mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(Uri.parse(mapUri), mode: LaunchMode.externalApplication);
      }
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    String googleUrlIos = 'https://maps.apple.com/?daddr=$latitude,$longitude';
    _openMapUrl(googleUrl, googleUrlIos);
  }

  static Future<void> openMapDirecion(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/dir/?api=1&destination=${latitude},${longitude}';
    String googleUrlIos = 'https://maps.apple.com/?daddr=${latitude},${longitude}';
    _openMapUrl(googleUrl, googleUrlIos);
  }

  static Future<void> openMapDirecionWithLatLng(LatLng point) async {
    openMapDirecion(point.latitude, point.longitude);
  }

  static LatLng getCenterOfPoints(List<LatLng> points) {
    double latitude = 0;
    double longitude = 0;

    int n = points.length;

    for (LatLng point in points) {
      latitude += point.latitude;
      longitude += point.longitude;
    }

    return LatLng(latitude / n, longitude / n);
  }

  static Future<void> decreaseZoom(GoogleMapController controller, LatLng center) async {
    final double zoomLevel = await controller.getZoomLevel() - 0.1;
    await controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: center,
      zoom: zoomLevel,
    )));
  }

  static bool _fits(LatLngBounds fitBounds, LatLngBounds screenBounds) {
    final bool northEastLatitudeCheck = screenBounds.northeast.latitude >= fitBounds.northeast.latitude;
    final bool northEastLongitudeCheck = screenBounds.northeast.longitude >= fitBounds.northeast.longitude;

    final bool southWestLatitudeCheck = screenBounds.southwest.latitude <= fitBounds.southwest.latitude;
    final bool southWestLongitudeCheck = screenBounds.southwest.longitude <= fitBounds.southwest.longitude;

    return northEastLatitudeCheck && northEastLongitudeCheck && southWestLatitudeCheck && southWestLongitudeCheck;
  }

  static Future<void> zoomToFit(GoogleMapController controller, LatLngBounds bounds, LatLng center) async {
    LatLngBounds screenBounds = await controller.getVisibleRegion();

    while (!_fits(bounds, screenBounds)) {
      await decreaseZoom(controller, center);
      await Future.delayed(const Duration(milliseconds: 10));

      screenBounds = await controller.getVisibleRegion();
    }

    for (int i = 1; i <= 10; i++) {
      await decreaseZoom(controller, center);
    }
  }
}
