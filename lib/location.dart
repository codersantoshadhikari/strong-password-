// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class LocationScreen extends StatefulWidget {
//   const LocationScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _LocationScreenState createState() => _LocationScreenState();
// }

// class _LocationScreenState extends State<LocationScreen> {
//   late GoogleMapController mapController;

//   final LatLng initialPosition =
//       const LatLng(37.7749, -122.4194); // San Francisco coordinates

//   @override
//   void dispose() {
//     mapController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Google Maps Example'),
//       ),
//       body: GoogleMap(
//         onMapCreated: (GoogleMapController controller) {
//           mapController = controller;
//         },
//         initialCameraPosition: CameraPosition(
//           target: initialPosition,
//           zoom: 12.0,
//         ),
//       ),
//     );
//   }
// }
