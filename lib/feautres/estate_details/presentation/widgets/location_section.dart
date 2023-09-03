import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

import '../../../common/common.dart';
import 'section.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({
    required this.latitude,
    required this.longitude,
    super.key,
  });

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Location',
      child: SizedBox(
        height: MediaQuery.of(context).size.width - 50,
        child: _Map(latitude: latitude, longitude: longitude),
      ),
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
  static const _tileUrlTemplate = 'https://tile.openstreetmap.org/{z}/{x}/{y}.png';

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(longitude, latitude),
        zoom: _defaultZoom,
      ),
      children: [
        TileLayer(urlTemplate: _tileUrlTemplate),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(longitude, latitude),
              builder: (_) => const _HomeMarker(),
            ),
          ],
        ),
      ],
    );
  }
}

class _HomeMarker extends StatelessWidget {
  const _HomeMarker();

  static const _borderRadius = BorderRadius.all(Radius.circular(3.5));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.vividOrangePeel,
        borderRadius: _borderRadius,
      ),
      child: const Icon(
        Icons.home_outlined,
        color: AppColors.white,
      ),
    );
  }
}
