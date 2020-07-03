# Web Multiple Tab Detector
This package makes it possible to detect how many browser tabs in the webbrowser your flutter app is currently running in.

If you are not in a webbrowser, this will always return 0.

If you want to ensure that your flutter app is only running one in the webbrowser then don't start the app if the number of tabs is `>1`.

## Example

```dart
import 'package:web_multiple_tab_detector/web_multiple_tab_detector.dart';

void main() async {
  WebMultipleTabDetector.register();

  if (await WebMultipleTabDetector.isSingleTab()) {
    // only one open tab allowed!
  } else {
    // laucnh app normally
  }
}
```
