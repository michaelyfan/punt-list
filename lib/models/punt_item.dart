class PuntItem {
  final String id;
  final String text;
  final bool isChecked;

  const PuntItem({
    required this.id,
    required this.text,
    this.isChecked = false,
  });

  PuntItem copyWith({String? text, bool? isChecked}) {
    return PuntItem(
      id: id,
      text: text ?? this.text,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}
