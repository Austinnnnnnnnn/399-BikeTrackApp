import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bike_tracking/controller/global.dart';
import 'package:bike_tracking/view/home_page.dart';
import 'package:bike_tracking/view/record_page.dart';
import 'package:bike_tracking/view/settings_page.dart';
import 'package:bike_tracking/view/tracking_page.dart';

void main() async {
  Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      Global.permissionGranted = true;
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      Global.permissionGranted = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Global.loadDataFromFile();
    _getStoragePermission();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomNavigationController(),
      ),
    );
  }
}

class BottomNavigationController extends StatefulWidget {
  //BottomNavigationController({Key key}) : super(key: key);

  @override
  _BottomNavigationControllerState createState() =>
      _BottomNavigationControllerState();
}

class _BottomNavigationControllerState
    extends State<BottomNavigationController> {
  //目前選擇頁索引值
  int _currentIndex = 0; //預設值
  final pages = [HomePage(), RecordPage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bike Tracking'),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'Record'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _currentIndex, //目前選擇頁索引值
        fixedColor: Colors.blue, //選擇頁顏色
        onTap: _onItemClick, //BottomNavigationBar 按下處理事件
      ),
    );
  }

  //BottomNavigationBar 按下處理事件，更新設定當下索引值
  void _onItemClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
