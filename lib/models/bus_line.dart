// lib/models/bus_line.dart

import 'package:latlong2/latlong.dart';

class BusLine {
  final String name;
  final String route;
  final List<LatLng> coordinates;

  BusLine({
    required this.name,
    required this.route,
    required this.coordinates,
  });
}

List<BusLine> busLines = [
  BusLine(
    name: "Bus Line 5",
    route: "Casa-Port ⇔ Abouab Oulfa (par Ain Diab)",
    coordinates: [LatLng(33.5731, -7.5898), LatLng(33.5899, -7.6039)],
  ),
  BusLine(
    name: "Bus Line 6",
    route: "Place Maréchal ⇔ Mèkanssa",
    coordinates: [LatLng(33.5900, -7.6100), LatLng(33.6050, -7.6200)],
  ),
  BusLine(
    name: "Bus Line 905",
    route: "Mohammedia Gare ⇔ Mohammedia - Fath 2",
    coordinates: [LatLng(33.7000, -7.4000), LatLng(33.7100, -7.4100)],
  ),
  BusLine(
    name: "Bus Line 907",
    route: "Mohammedia Rachidia 3 ⇔ Mohammedia Facultés",
    coordinates: [LatLng(33.7200, -7.4200), LatLng(33.7300, -7.4300)],
  ),
];
