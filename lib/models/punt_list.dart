import 'punt_item.dart';

class PuntList {
  final String id;
  String name;
  final List<PuntItem> items;
  String? destinationListId;

  PuntList({
    required this.id,
    required this.name,
    List<PuntItem>? items,
    this.destinationListId,
  }) : items = items ?? [];

  List<PuntItem> get activeItems => items.where((i) => !i.isChecked).toList();
  List<PuntItem> get checkedItems => items.where((i) => i.isChecked).toList();
}
