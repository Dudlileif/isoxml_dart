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
    required String xmlTag,
    Iterable<E>? values,
  }) : _xmlElement = xmlElement,
       _xmlTag = xmlTag,
       super([...?values]) {
    addAll(values);
  }

  final XmlElement _xmlElement;
  final String _xmlTag;

  @override
  void add(E value) {
    assert(
      value._xmlTag == _xmlTag,
      'value must have correct XML tag `$_xmlTag`: ${value._xmlTag}',
    );
    super.add(value);
    final xmlElement = value.xmlElement;
    if (xmlElement.hasParent) {
      xmlElement.remove();
    }
    _xmlElement.children.add(xmlElement);
  }

  @override
  void addAll(Iterable<E>? iterable) {
    final items = switch (iterable) {
      <E>[...] => iterable,
      final Iterable<E> iterable => iterable.toList(),
      _ => null,
    };
    if (items case <E>[...]) {
      super.addAll(items);
      _xmlElement.children.addAll(
        items.map((e) {
          assert(
            e._xmlTag == _xmlTag,
            'value must have correct XML tag `$_xmlTag`: ${e._xmlTag}',
          );
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
    assert(value is E, 'value must be of correct type');
    (value! as _XmlElementBase).xmlElement.remove();
    return super.remove(value);
  }

  @override
  void clear() {
    super.clear();
    _xmlElement.children.removeWhere(
      (e) => switch (e) {
        XmlElement(name: XmlName(:final local)) when local == _xmlTag => true,
        _ => false,
      },
    );
  }
}
