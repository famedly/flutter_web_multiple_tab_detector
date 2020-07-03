import 'package:web_multiple_tab_detector/web_multiple_tab_detector.dart';

void main() async {
  WebMultipleTabDetector.register();

  if (await WebMultipleTabDetector.isSingleTab()) {
    // only one open tab allowed!
  } else {
    // laucnh app normally
  }
}
