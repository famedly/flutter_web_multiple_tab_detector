/*
 *   Memory File Picker
 *   Copyright (C) 2020 Christian Pauly
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

int getTabs(String name) {
  try {
    final n = int.parse(window.localStorage[name]);
    return n < 0 : 0 : n;
  } catch (_) {
    return 0;
  }
}

void setTabs(String name, int number) {
  window.localStorage[name] = number.toString();
}

void register(String name) {
  setTabs(name, getTabs(name) + 1);

  window.onUnload.listen((_) {
    setTabs(name, getTabs(name) - 1);
  });
}
