import 'package:flutter/material.dart';
import '../models/bus_line.dart';

class DirectionsPage extends StatelessWidget {
  final List<BusLine> busLines = [
    BusLine(name: "Bus Line 5", route: "Casa-Port ⇔ Abouab Oulfa"),
    BusLine(name: "Bus Line 6", route: "Place Maréchal ⇔ Mèkanssa"),
    // Add more bus lines here...
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
                Navigator.pushNamed(
                  context,
                  '/map',
                  arguments: busLine, // Pass the selected bus line
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
          if (index == 1) Navigator.pushNamed(context, '/map');
          if (index == 2) Navigator.pushNamed(context, '/profile');
        },
      ),
    );
  }
}
