import 'package:flutter/material.dart';
import 'package:web_multiple_tab_detector/web_multiple_tab_detector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WebMultipleTabDetector.register();

  var isOnlyTab = true;

  if (await WebMultipleTabDetector.isSingleTab()) {
    debugPrint('First tab.');
  } else {
    debugPrint('Second tab!!!');
    isOnlyTab = false;
  }
  runApp(MyApp(isOnlyTab: isOnlyTab));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isOnlyTab = true});
  final bool isOnlyTab;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Multiple Tab Detector',
      home: Home(isOnlyTab: isOnlyTab),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key, this.isOnlyTab = true});
  final bool isOnlyTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(isOnlyTab ? 'All Good =)!' : 'There is another tab!!!'),
      ),
    );
  }
}
