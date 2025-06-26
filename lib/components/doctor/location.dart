import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DoctorLocation extends StatelessWidget {
  const DoctorLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.maxFinite,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(-6.1751, 106.8650),
          initialZoom: 12,
          initialRotation: 0,
          interactionOptions: InteractionOptions(
            flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          ),
        ),
        children: [
          TileLayer(
            urlTemplate:
                "https://tile.tracestrack.com/_/{z}/{x}/{y}.webp?key=${dotenv.env['MAP_KEY']}",
            userAgentPackageName: 'com.example.appointment',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-6.1751, 106.8650),
                child: Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
