import 'dart:convert';

class Report {
  String data;
  String id;
  double lat;
  double longi;

  String toString() {
    return jsonEncode('{id: $id,data:$data,lattitude:$lat,longitude:$longi}');
  }

  Report(this.id, this.data, this.lat, this.longi);
}
