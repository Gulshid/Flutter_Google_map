import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapprovider with ChangeNotifier{
  LatLng myCurrentLocation = const LatLng(30.3753, 69.3451);
  Set<Marker> markers = {};
  GoogleMapController? googleMapController;

  Future<void> getCurrentLocation() async {
    bool serviceEnable;
    LocationPermission permission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      throw Exception('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission permanently denied');
    }
    Position position = await Geolocator.getCurrentPosition();
    myCurrentLocation = LatLng(position.latitude, position.longitude);
    markers.clear();
    markers.add(
      Marker(
        markerId: MarkerId('current_location'),
        position: myCurrentLocation,
      ),
    );
    notifyListeners();
    googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: myCurrentLocation, zoom: 14),
      ),
    );
  }

  void setMapController(GoogleMapController controller) {
    googleMapController = controller;
    notifyListeners();
  }
  
}