import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  LatLng myCurrentLocation = const LatLng(30.3753, 69.3451);

  late GoogleMapController googleMapController;
  Set<Marker> marker = {};
  // BitmapDescriptor bitmapDescriptor = BitmapDescriptor.defaultMarker;
  // @override
  // void initState() {
  //   customMarker();
  //   super.initState();
  // }

  // void customMarker() {
  //   BitmapDescriptor.asset(ImageConfiguration(), "assets/25530.jpg").then((
  //     icon,
  //   ) {
  //     setState(() {
  //       bitmapDescriptor = icon;
  //     });
  //   });
  // }

  Future<Position> CurrentLocation() async {
    bool serviceEnable;
    LocationPermission permission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Location services are disabled');
    }
    // check if the service location is enabled or not
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(
          target: myCurrentLocation,
          zoom: 14,
        ),
        markers: marker,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },

        // markers: {
        //   Marker(
        //     markerId: MarkerId("marker id"),
        //     position: myCurrentLocation,
        //     onDragEnd: (value) {},
        //     infoWindow: InfoWindow(
        //       title: 'title of the marker',
        //       snippet: 'This is a Snippet',
        //     ),

        //     icon: bitmapDescriptor,
        //   ),
        // },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          Position position = await CurrentLocation();
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14,
              ),
            ),
          );

          marker.clear();
          marker.add(
            Marker(
              markerId: MarkerId('This is my current location'),
              position: LatLng(position.latitude, position.longitude),
            ),
          );
          setState(() {
            
          });
        },
        child: Icon(Icons.my_location, size: 30.sp),
      ),
    );
  }
}
