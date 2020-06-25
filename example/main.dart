import 'package:web_multiple_tab_detector/web_multiple_tab_detector.dart';

void main() {
  WebMultipleTabDetector.register();

  if (WebMultipleTabDetector.getTabs() > 1) {
    // only one open tab allowed!
  } else {
    // laucnh app normally
  }
}
