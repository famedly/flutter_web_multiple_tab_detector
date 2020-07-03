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

import 'dart:html';
import 'dart:math';

String randomString([int length = 50]) {
  var result = '';
  final chars = 'abcdefghijklmnopqrstuvwxyz-_1234567890=';
  final charsLen = chars.length;
  final random = Random();
  for (var i = 0; i < length; i++) {
    result += chars[random.nextInt(charsLen)];
  }
  return result;
}

int getTabs(String name) {
  try {
    final n = int.parse(window.localStorage[name]);
    return n < 0 ? 0 : n;
  } catch (_) {
    return 0;
  }
}

void setTabs(String name, int number) {
  window.localStorage[name] = number.toString();
}

bool _pongReceived = false;
String _instanceId = '';

void register(String name) {
  _instanceId = randomString();
  setTabs(name, getTabs(name) + 1);

  window.onUnload.listen((_) {
    setTabs(name, getTabs(name) - 1);
  });

  window.onStorage.listen((evt) {
    if (evt.key == '$name-ping') {
      final val = evt.newValue;
      if (val.split('|')[0] != _instanceId) {
        window.localStorage['$name-pong'] =
            _instanceId + '|' + DateTime.now().toString();
      }
    }
    if (evt.key == '$name-pong') {
      _pongReceived = true;
    }
  });
}

Future<bool> isSingleTab(String name) async {
  if (getTabs(name) <= 1) {
    // short-circuit out
    return true;
  }
  // send ping to other tabs
  window.localStorage['$name-ping'] =
      _instanceId + '|' + DateTime.now().toString();
  int counter = 100;
  while (!_pongReceived && counter > 0) {
    await Future.delayed(Duration(milliseconds: 50));
    counter--;
  }
  if (!_pongReceived) {
    // okay, we are single tab, let's correct the cache
    setTabs(name, 1);
    return true;
  }
  return false;
}
