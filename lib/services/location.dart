import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  //To use the parameters in loading_screen.dart
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
