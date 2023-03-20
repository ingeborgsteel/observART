import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hvart_har_du_sett/flutter_flow/flutter_flow_model.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  MapController? mapController;

  LocationData? currentLocation;
  LatLng? selectedLocation;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
