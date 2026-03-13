import 'package:flutter/material.dart';
import '../models/punt_item.dart';
import '../models/punt_list.dart';

String _newId() => DateTime.now().microsecondsSinceEpoch.toString();

class AppState {
  final List<PuntList> lists;
  ThemeMode themeMode;

  AppState({List<PuntList>? lists, this.themeMode = ThemeMode.system})
      : lists = lists ?? [];

  // --- Lists ---

  PuntList addList() {
    final list = PuntList(id: _newId(), name: 'New List');
    lists.add(list);
    return list;
  }

  void deleteList(String listId) {
    // Clear this list as a destination from any other list
    for (final l in lists) {
      if (l.destinationListId == listId) {
        l.destinationListId = null;
      }
    }
    lists.removeWhere((l) => l.id == listId);
  }

  void renameList(String listId, String newName) {
    _findList(listId)?.name = newName;
  }

  void setDestination(String listId, String? destId) {
    final list = _findList(listId);
    if (list != null) list.destinationListId = destId;
  }

  // --- Items ---

  void addItem(String listId, String text) {
    _findList(listId)?.items.add(PuntItem(id: _newId(), text: text));
  }

  void deleteItem(String listId, String itemId) {
    _findList(listId)?.items.removeWhere((i) => i.id == itemId);
  }

  void toggleItem(String listId, String itemId) {
    final list = _findList(listId);
    if (list == null) return;
    final index = list.items.indexWhere((i) => i.id == itemId);
    if (index == -1) return;
    list.items[index] = list.items[index].copyWith(
      isChecked: !list.items[index].isChecked,
    );
  }

  void editItemText(String listId, String itemId, String newText) {
    final list = _findList(listId);
    if (list == null) return;
    final index = list.items.indexWhere((i) => i.id == itemId);
    if (index == -1) return;
    list.items[index] = list.items[index].copyWith(text: newText);
  }

  void moveItem(String sourceListId, String itemId) {
    final source = _findList(sourceListId);
    if (source == null || source.destinationListId == null) return;
    final dest = _findList(source.destinationListId!);
    if (dest == null) return;

    final index = source.items.indexWhere((i) => i.id == itemId);
    if (index == -1) return;
    final item = source.items[index].copyWith(isChecked: false);
    source.items.removeAt(index);
    dest.items.add(item);
  }

  // --- Theme ---

  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
  }

  // --- Helpers ---

  PuntList? _findList(String id) {
    try {
      return lists.firstWhere((l) => l.id == id);
    } catch (_) {
      return null;
    }
  }
}
