import 'package:geolocator/geolocator.dart';

class Location {
  Future<Position> getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      return position;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
