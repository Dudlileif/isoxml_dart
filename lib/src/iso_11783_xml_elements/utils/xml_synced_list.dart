part of '../iso_11783_element.dart';

/// A list of [Iso11783Element]s that automatically updates the parent
/// [XmlElement] with the correct children in this list.
class _XmlSyncedList<E extends _XmlElementBase> extends DelegatingList<E> {
  /// Default constructor for creating an [_XmlSyncedList] with the required
  /// [xmlElement] which children should be synced with the list.
  ///
  ///  Optional initial [values] can also be set.
  _XmlSyncedList({
    required XmlElement xmlElement,
    Iterable<E>? values,
  }) : _xmlElement = xmlElement,
       super([...?values]) {
    addAll(values);
  }

  final XmlElement _xmlElement;

  @override
  void operator []=(int index, E value) {
    super[index] = value;
    value.xmlElement.replace(value.xmlElement);
  }

  @override
  void add(E value) {
    super.add(value);
    final xmlElement = value.xmlElement;
    if (xmlElement.hasParent) {
      xmlElement.remove();
    }
    _xmlElement.children.add(xmlElement);
  }

  @override
  void addAll(Iterable<E>? iterable) {
    if (iterable case <E>[...]) {
      super.addAll(iterable);
      _xmlElement.children.addAll(
        iterable.map((e) {
          final xmlElement = e.xmlElement;
          if (xmlElement.hasParent) {
            xmlElement.remove();
          }
          return xmlElement;
        }),
      );
    }
  }

  @override
  bool remove(Object? value) {
    _xmlElement.children.remove(value);
    return super.remove(value);
  }

  @override
  void clear() {
    super.clear();
    _xmlElement.children.removeWhere((e) => e is E);
  }
}
