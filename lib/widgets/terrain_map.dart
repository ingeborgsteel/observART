import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hvart_har_du_sett/constants/app_constants.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class TerrainMap extends StatefulWidget {
  final LocationData currentLocation;

  const TerrainMap({Key? key, required this.currentLocation}) : super(key: key);

  @override
  State<TerrainMap> createState() => _TerrainMapState();
}

class _TerrainMapState extends State<TerrainMap> {
  late final MapController mapController;
  var _selectedPoint;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    _selectedPoint = LatLng(
        widget.currentLocation.latitude!, widget.currentLocation.longitude!);
  }

  _setMarker(LatLng point) {
    setState(() {
      _selectedPoint = point;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        mapController: mapController,
        options: MapOptions(
            minZoom: 5,
            maxZoom: 18,
            zoom: 13,
            center: LatLng(widget.currentLocation.latitude!,
                widget.currentLocation.longitude!),
            onTap: (position, location) {
              _setMarker(location);
            }),
        layers: [
          TileLayerOptions(
              urlTemplate: AppConstants.mapBoxUrl,
              additionalOptions: {
                'mapStyleId': AppConstants.mapBoxStyleId,
                'accessToken': AppConstants.mapBoxAccessToken,
                'mapBoxUserName': AppConstants.mapBoxUserName,
              }),
          MarkerLayerOptions(markers: [
            Marker(
                height: 40,
                width: 40,
                point: _selectedPoint,
                builder: (_) {
                  return const Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 36.0,
                  );
                })
          ])
        ]);
  }
}
