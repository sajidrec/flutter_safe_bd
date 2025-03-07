import 'package:geolocator/geolocator.dart';

class CustomMessage {
  static String defaultMessage({required Position position}) =>
      "I'm in danger please reach out to me as soon as possible.\nMy current location details:\nTime: ${position.timestamp}\nGoogle Maps: https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}\nMore info:\nPosition(longitude: ${position.longitude}, latitude: ${position.latitude}, timestamp: ${position.timestamp}, accuracy: ${position.accuracy}, altitude: ${position.altitude}, altitudeAccuracy: ${position.altitudeAccuracy}, heading: ${position.heading}, headingAccuracy: ${position.headingAccuracy}, speed: ${position.speed}, speedAccuracy: ${position.speedAccuracy})";
}
