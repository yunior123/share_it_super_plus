import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_it_super_plus/models/share_data.dart';
import 'package:share_it_super_plus/share_it_super_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _platformVersion = 'Unknown';
  final _shareItSuperPlusPlugin = ShareItSuperPlus();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      const fileName = 'TestPdfFile.pdf';
      final file = await _writeFileToLocal(
        fileName,
        Uint8List.fromList([
          0x00,
          0x01,
          0x02,
          0x03,
          0x04,
          0x05,
          0x06,
          0x07,
          0x08,
          0x09,
          0x0a,
          0x0b,
          0x0c,
          0x0d,
          0x0e,
          0x0f
        ]),
      );

      final shareData = ShareData(
        mimeType: "application/pdf",
        subject: "Subject",
        path: file.path,
        text: "Test",
      );
      result = await _shareItSuperPlusPlugin.presentShareSheet(shareData) ??
          'no result';

      print(result);
    } catch (e) {
      result = 'Failed to get platform version.';
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<File> _writeFileToLocal(
    final String fileName,
    final Uint8List bytes,
  ) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/$fileName');
    // Write the file
    return file.writeAsBytes(bytes);
  }
}
