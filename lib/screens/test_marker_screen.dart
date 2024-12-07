import 'package:flutter/material.dart';
import 'package:mapas_app/markers/markers.dart';

class TestMarkerScreen extends StatelessWidget {
   
   const TestMarkerScreen({super.key});
   
   @override
   Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
         child: Container(
           color: Colors.red,
           width: 350,
           height: 150,
           child: CustomPaint(
             painter: EndMarkerPainter(
               destination: 'Roosters Rest & Snack Bar',
               kilometers: 50
             ),
           ),
         )
      ),
   );
   }
}