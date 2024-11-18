class Selector<T> {
  const Selector({
    required this.data,
    this.selected = false,
  });

  final T data;
  final bool selected;

  @override
  int get hashCode => Object.hashAll([data, selected]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Selector<T> && data == other.data && selected == other.selected;
}
