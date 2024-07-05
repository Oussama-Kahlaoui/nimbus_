import 'package:flutter/material.dart';
import '../models/bus_line.dart';

class DirectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Directions'),
      ),
      body: ListView.builder(
        itemCount: busLines.length,
        itemBuilder: (context, index) {
          final busLine = busLines[index];
          return ListTile(
            title: Text(busLine.name),
            subtitle: Text(busLine.route),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/map',
                arguments: busLine, // Pass the selected bus line
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set the initial selected index to 'Directions'
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
