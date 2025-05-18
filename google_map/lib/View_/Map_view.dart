import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        onPressed: (){},
        child: Icon(Icons.my_location, size: 30.sp,),),
    );
  }
}
