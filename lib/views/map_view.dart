import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mapas_app/themes/themes.dart';
import 'package:mapas_app/blocs/blocs.dart';

class MapView extends StatelessWidget {

  final LatLng initialLocation;
  final Set<Polyline> polylines;
  final Set<Marker> markers;

  const MapView({ 
    super.key, 
    required this.initialLocation,
    required this.polylines, 
    required this.markers,
  });

  @override
  Widget build(BuildContext context) {

    final mapBloc = BlocProvider.of<MapBloc>(context);

    final CameraPosition initialCameraPosition = CameraPosition(
        target: initialLocation,
        zoom: 15
    );

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Listener(
        onPointerMove: ( pointerMoveEvent )=> mapBloc.add( OnStartFollowingUserEvent() ),
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          polylines: polylines,
          markers: markers,
          compassEnabled: false,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          style: jsonEncode(darkMapTheme),
          onMapCreated: ( controller ) => mapBloc.add( OnMapInitializedEvent(controller) ),
          onCameraMove: ( position )  => mapBloc.mapCenter = position.target,
        ),
      ),
    );
  }
}