import 'package:flutter/material.dart';
import 'package:hvart_har_du_sett/constants/app_constants.dart';
import 'package:hvart_har_du_sett/widgets/observation_form.dart';
import 'package:hvart_har_du_sett/widgets/terrain_map.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    super.initState();
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
                  TerrainMap(currentLocation: currentLocation),
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
