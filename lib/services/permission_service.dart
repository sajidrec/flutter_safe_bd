import 'package:geolocator/geolocator.dart';

class PermissionService {
  Future<bool> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return await _checkAndEnableGPS();
    } else {
      // Request permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        return await _checkAndEnableGPS();
      }
    }
    return false; // Permission denied
  }

  Future<bool> _checkAndEnableGPS() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Ask user to enable GPS
      await Geolocator.openLocationSettings();
      return false; // You can recheck after some delay if needed
    }
    return true; // GPS is enabled
  }
}
