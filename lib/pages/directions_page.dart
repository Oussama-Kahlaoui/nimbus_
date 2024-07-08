import 'package:flutter/material.dart';
import '../models/bus_line.dart';
import 'package:latlong2/latlong.dart';

class DirectionsPage extends StatelessWidget {
  final List<BusLine> busLines = [
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
      name: "Bus Line 7",
      route: "Place Maréchal ⇔ Oulad Haddou",
      coordinates: [LatLng(33.5900, -7.6100), LatLng(33.6050, -7.6200)],
    ),
    // Add remaining bus lines similarly...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Directions'),
      ),
      body: ListView.builder(
        itemCount: busLines.length,
        itemBuilder: (context, index) {
          final busLine = busLines[index];
          return Card(
            color: Colors.white24,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(busLine.name, style: TextStyle(color: Colors.white)),
              subtitle: Text(busLine.route, style: TextStyle(color: Colors.white70)),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  '/map',
                  arguments: busLine,
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions),
            label: 'Directions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) Navigator.pushReplacementNamed(context, '/map');
          if (index == 2) Navigator.pushReplacementNamed(context, '/profile');
        },
      ),
    );
  }
}