import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import '../models/bus_line.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final TextEditingController _searchController = TextEditingController();
  final MapController _mapController = MapController();
  Position? _currentPosition;
  List<BusLine> _busLines = [];

  @override
  void initState() {
    super.initState();
    _determinePosition();
    _loadBusLines();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    _currentPosition = await Geolocator.getCurrentPosition();
    setState(() {});
  }

  void _loadBusLines() {
    _busLines = [
      BusLine(name: "Bus Line 5", route: "Casa-Port ⇔ Abouab Oulfa"),
      BusLine(name: "Bus Line 6", route: "Place Maréchal ⇔ Mèkanssa"),
      // Add more bus lines here...
    ];
  }

  void _searchDestination() {
    // Implement search logic here and navigate to directions page
    Navigator.pushNamed(
      context,
      '/directions',
      arguments: _searchController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search for a destination',
            hintStyle: TextStyle(color: Colors.white70),
            prefixIcon: Icon(Icons.search, color: Colors.white70),
            suffixIcon: IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.white70),
              onPressed: _searchDestination,
            ),
            filled: true,
            fillColor: Colors.white24,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          center: _currentPosition != null
              ? LatLng(_currentPosition!.latitude, _currentPosition!.longitude)
              : LatLng(33.5731, -7.5898),
          zoom: 12.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: _busLines.map((busLine) {
              return Marker(
                point: LatLng(33.5731, -7.5898),  // Replace with actual bus line coordinates
                builder: (ctx) => Icon(Icons.directions_bus, color: Colors.white),
              );
            }).toList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
          if (index == 0) Navigator.pushNamed(context, '/directions');
          if (index == 2) Navigator.pushNamed(context, '/profile');
        },
      ),
    );
  }
}
