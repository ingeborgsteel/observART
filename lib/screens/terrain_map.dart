import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hvart_har_du_sett/constants/app_constants.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class TerrainMap extends StatefulWidget {
  const TerrainMap({Key? key}) : super(key: key);

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
  }

  Future<LocationData?> _currentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    Location location = Location();

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    return await location.getLocation();
  }

  _setMarker(LatLng point) {
    setState(() {
      _selectedPoint = point;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(AppConstants.appName)),
        body: FutureBuilder<LocationData?>(
            future: _currentLocation(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                final LocationData currentLocation = snapshot.data;
                final LatLng locationPoint = LatLng(
                    currentLocation.latitude!, currentLocation.longitude!);
                return Stack(children: [
                  FlutterMap(
                      mapController: mapController,
                      options: MapOptions(
                          minZoom: 5,
                          maxZoom: 18,
                          zoom: 13,
                          center: locationPoint,
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
                              point: _selectedPoint ?? locationPoint,
                              builder: (_) {
                                return const Icon(
                                  Icons.location_on,
                                  color: Colors.blue,
                                  size: 36.0,
                                );
                              })
                        ])
                      ])
                ]);
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
