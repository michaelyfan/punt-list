import 'package:flutter/material.dart';
import '../models/punt_list.dart';
import '../state/app_state.dart';

class DestinationDropdown extends StatelessWidget {
  final PuntList sourceList;
  final List<PuntList> allLists;
  final AppState appState;
  final void Function(VoidCallback) update;

  const DestinationDropdown({
    super.key,
    required this.sourceList,
    required this.allLists,
    required this.appState,
    required this.update,
  });

  @override
  Widget build(BuildContext context) {
    final options = allLists.where((l) => l.id != sourceList.id).toList();

    return DropdownButton<String?>(
      value: sourceList.destinationListId,
      isExpanded: true,
      onChanged: (value) => update(() {
        appState.setDestination(sourceList.id, value);
      }),
      items: [
        const DropdownMenuItem<String?>(
          value: null,
          child: Text('— No destination —'),
        ),
        ...options.map(
          (l) => DropdownMenuItem<String?>(
            value: l.id,
            child: Text(l.name),
          ),
        ),
      ],
    );
  }
}
