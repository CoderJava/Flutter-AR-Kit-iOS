import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:math' as math;

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ARKitController arKitController;

  @override
  void dispose() {
    arKitController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ARKit in Flutter'),
      ),
      body: ARKitSceneView(
        onARKitViewCreated: (arkitController) {
          this.arKitController = arkitController;
          final node = ARKitNode(
            geometry: ARKitSphere(radius: 0.1),
            position: vector.Vector3(0, 0, -0.5),
          );
          this.arKitController.add(node);
        },
      ),
    );
  }
}
