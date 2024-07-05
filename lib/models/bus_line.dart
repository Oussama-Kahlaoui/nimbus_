// lib/models/bus_line.dart

class BusLine {
  final String name;
  final String route;

  BusLine({required this.name, required this.route});
}

List<BusLine> busLines = [
  BusLine(name: "Bus Line 5", route: "Casa-Port ⇔ Abouab Oulfa (par Ain Diab)"),
  BusLine(name: "Bus Line 6", route: "Place Maréchal ⇔ Mèkanssa"),
  // ... add other bus lines here
  BusLine(name: "Bus Line 905", route: "Mohammedia Gare ⇔ Mohammedia - Fath 2"),
  BusLine(name: "Bus Line 907", route: "Mohammedia Rachidia 3 ⇔ Mohammedia Facultés"),
];
