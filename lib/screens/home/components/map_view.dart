import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapViewPage extends StatelessWidget {
  final LatLng position;
  const MapViewPage({super.key, required this.position});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: position,   // ✅ "center" -> "initialCenter"
        initialZoom: 15.0,         // ✅ "zoom" -> "initialZoom"
        maxZoom: 18.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.civic_issue',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: position,
              width: 40,
              height: 40,
              child: const Icon(
                Icons.person_pin_circle,
                color: Colors.blue,
                size: 40,
              ),
            ),
          ],
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: null,
            ),
          ],
        ),
      ],
    );
  }
}
