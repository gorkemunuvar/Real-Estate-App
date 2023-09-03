import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

import 'section_title.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({
    required this.latitude,
    required this.longitude,
    super.key,
  });

  final double latitude;
  final double longitude;

  static const _space = 10.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Location'),
        const SizedBox(height: _space),
        SizedBox(
          height: MediaQuery.of(context).size.width,
          child: _Map(latitude: latitude, longitude: longitude),
        ),
      ],
    );
  }
}

class _Map extends StatelessWidget {
  const _Map({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  static const _defaultZoom = 15.2;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(longitude, latitude),
        zoom: _defaultZoom,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(longitude, latitude),
              builder: (_) => const Icon(
                Icons.home,
                //TODO: Extract color
                color: Color(0xFFF7A100),
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
