import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' as math;

extension CircleBounds on Circle {
  LatLng locationMinMax(bool positive) {
    double sign = positive ? 1 : -1;
    double dx = sign * radius / 6378000 * (180 / math.pi);
    double lat = center.latitude + dx;
    double lon = center.longitude + dx / math.cos(center.latitude * math.pi / 180);
    return LatLng(lat, lon);
  }

  LatLngBounds bounds() {
    return LatLngBounds(
      southwest: locationMinMax(false),
      northeast: locationMinMax(true),
    );
  }
}
