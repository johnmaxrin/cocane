import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<Position> getPosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  permission = await Geolocator.requestPermission();
  return await Geolocator.getCurrentPosition();
}

Future<String> getPosName() async {
  Position pos = await getPosition();
  List<Placemark> placemarks =
      await placemarkFromCoordinates(pos.latitude, pos.longitude);

  var placeholder = placemarks[0].locality.toString();
  return placeholder;
}
