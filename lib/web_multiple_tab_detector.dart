/*
 *   Web Multiple Tab Detector
 *   Copyright (C) 2020 Famedly
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU Affero General Public License as
 *   published by the Free Software Foundation, either version 3 of the
 *   License, or (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU Affero General Public License for more details.
 *
 *   You should have received a copy of the GNU Affero General Public License
 *   along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

library web_multiple_tab_detector;

import 'src/default.dart' if (dart.library.html) 'src/web.dart' as api;

abstract class WebMultipleTabDetector {
  static String _name;

  /// Registers the current tab / flutter instance.
  /// Optionally a [name] can be set which will be used
  /// as localstorage identifier. The [name] must be the same
  /// for all instances of the flutter app.
  static void register([String name = 'tabs']) {
    _name = name;
    api.register(_name);
  }

  /// Get the amount of tabs that are currently open.
  /// In a non-web instance this will always return 0.
  static int getTabs() {
    return api.getTabs(_name);
  }
}
