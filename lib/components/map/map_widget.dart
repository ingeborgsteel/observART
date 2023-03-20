import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hvart_har_du_sett/constants/app_constants.dart';
import 'package:hvart_har_du_sett/flutter_flow/flutter_flow_theme.dart';
import 'package:hvart_har_du_sett/flutter_flow/flutter_flow_util.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import 'map_model.dart';

export 'map_model.dart';

class MapWidget extends StatefulWidget {
  final LocationData currentLocation;

  const MapWidget({Key? key, required this.currentLocation}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapModel());

    _model.mapController ??= MapController();
    _model.currentLocation = widget.currentLocation;
    _model.selectedLocation = LatLng(
        widget.currentLocation.latitude!, widget.currentLocation.longitude!);
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        mapController: _model.mapController,
        options: MapOptions(
            minZoom: 5,
            maxZoom: 18,
            zoom: 13,
            center: _model.selectedLocation,
            onTap: (position, location) {
              setState(() {
                _model.selectedLocation = location;
              });
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
                point: _model.selectedLocation!,
                builder: (_) {
                  return Icon(
                    Icons.location_on,
                    color: FlutterFlowTheme.of(context).primaryColor,
                    size: 40.0,
                  );
                })
          ])
        ]);
  }
}
