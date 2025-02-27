import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  Position _position = Position(
    longitude: 0,
    latitude: 0,
    timestamp: DateTime.now(),
    accuracy: 0,
    altitude: 0,
    altitudeAccuracy: 0,
    heading: 0,
    headingAccuracy: 0,
    speed: 0,
    speedAccuracy: 0,
  );

  bool _updateLocationInProgress = false;

  bool get getUpdateLocationInProgress => _updateLocationInProgress;

  Position get getCurrentPosition => _position;

  Future<void> fetchCurrentPosition() async {
    _updateLocationInProgress = true;
    update();

    _position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.best),
    );

    _updateLocationInProgress = false;
    update();
  }
}
