import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../user_preferences/user_preferences.dart';

class MapsWidget extends StatefulWidget {
  const MapsWidget({super.key, required this.controllerMap});
  final Completer<GoogleMapController> controllerMap;
  // final List<dynamic> markerUser;

  @override
  State<MapsWidget> createState() => _MapsWidgetState();
}

class _MapsWidgetState extends State<MapsWidget> {
  final prefs = PreferenciasUsuario();
  Set<Marker> markers = <Marker>{};

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: LatLng(double.parse(prefs.position[0]),double.parse(prefs.position[1])), zoom: 14),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      markers: markers,
      onMapCreated: (GoogleMapController controller) { //method called when map is created
        widget.controllerMap.complete(controller);
      // markers.clear();
      // markers.add(Marker(markerId: const MarkerId('currentLocation'),position: LatLng(double.parse(widget.markerUser[3][0]), double.parse(widget.markerUser[3][1]))));

    },
    // mapController?.animateCamera(CameraUpdate.newLatLngZoom(LatLng(double.parse(prefs.position[0]), double.parse(prefs.position[1])), zoom: 14)),
      
      
      );
  }
}

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Flutter Google Maps Demo',
//       home: MapSample(),
//     );
//   }
// }

// class MapSample extends StatefulWidget {
//   const MapSample({Key? key}) : super(key: key);

//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller = Completer();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       ),
//     );
//   }

//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }