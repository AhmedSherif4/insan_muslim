import 'dart:async';

import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:geolocator/geolocator.dart';

class ViewModelQiblah {
  final locationStreamController =
      StreamController<LocationStatus>.broadcast();

  get streamCompass => locationStreamController.stream;

  Future<void> checkLocationStatus() async {
    final LocationStatus locationStatus =
        await FlutterQiblah.checkLocationStatus();
    if (locationStatus.enabled &&
        locationStatus.status == LocationPermission.denied) {
      await FlutterQiblah.requestPermissions();
      final newCheckLocation = await FlutterQiblah.checkLocationStatus();
      locationStreamController.sink.add(newCheckLocation);
    } else {
      locationStreamController.sink.add(locationStatus);
    }
  }
}
