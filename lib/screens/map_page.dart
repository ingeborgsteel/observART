import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hvart_har_du_sett/constants/app_constants.dart';
import 'package:hvart_har_du_sett/widgets/observation_form.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final MapController mapController;
  var _selectedPoint = AppConstants.defaultPosition;

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
                return Stack(children: [
                  FlutterMap(
                      mapController: mapController,
                      options: MapOptions(
                          minZoom: 5,
                          maxZoom: 18,
                          zoom: 13,
                          center: LatLng(currentLocation.latitude!,
                              currentLocation.longitude!),
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
                      ]),
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: ObservationForm(),
                  )
                ]);
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
