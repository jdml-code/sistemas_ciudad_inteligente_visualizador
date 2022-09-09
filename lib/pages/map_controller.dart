import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController{

  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  final initialCameraPosition = const CameraPosition(
    target: LatLng(6.2656272,-75.5663369),
    zoom: 15);

  void onTapI(LatLng position){
    final markerId = MarkerId(_markers.length.toString());
    final marker = Marker(
      markerId: markerId,
      position: position
    );
    _markers[markerId] = marker;
    
  }
}