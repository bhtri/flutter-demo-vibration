import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> demo1() async {
    AudioCache audioCache = AudioCache();
    await audioCache.play('audio/aa.mp3');
    audioCache.clearAll();

    Vibration.hasCustomVibrationsSupport().then((value) {
      bool check = value ?? false;
      if (check) {
        Vibration.vibrate(
          pattern: [
            0,
            500,
          ],
          amplitude: 255, // 振幅
          intensities: Platform.isAndroid ? [0, 255] : [255], // 強度
        );
      }
    });
  }

  Future<void> demo2() async {
    AudioCache audioCache = AudioCache();
    await audioCache.play('audio/bb.mp3');
    audioCache.clearAll();

    Vibration.hasCustomVibrationsSupport().then((value) {
      bool check = value ?? false;

      if (check) {
        Vibration.vibrate(
          pattern: [
            0,
            300,
            100,
            300,
            100,
            300,
          ],
          amplitude: 255, // 振幅
          intensities: Platform.isAndroid
              ? [0, 255, 0, 255, 0, 255]
              : [255, 255, 255], // 強度
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
              onPressed: demo1,
              child: const Text('Button demo 1'),
            ),
          ],
        ),
      ),
    );
  }
}
