# ISOXML - A dart library for interacting with ISO 11783-10 files

## Todo list

* Document everything
  * Some elements are missing descriptive documentation due to expensive standard documents.
* Add ZIP read/write support for ~~VM~~ and web
* Add external file separation from main task data document
* ~~Convert to and from TLG and GRD binary formats~~
* ~~Add ISO 11783-11 import of Data Directory Entities (DDE)~~
* Add ISO 11783-6 colour palette
* Add a regstry within taskdata to ensure no duplicates (ids) and access to all ids/elements from anywhere.

## Dependencies

| Package | Usage |
| ------- | ----------- |
| [archive](https://pub.dev/packages/archive) | Encode and decode ZIP files. |
| [collection](https://pub.dev/packages/collection) | Handy extension methods on iterables. |
| [copy_with_extension](https://pub.dev/packages/copy_with_extension) | Annotations for generating copyWith methods. |
| [equatable](https://pub.dev/packages/equatable) | Reduce biolerplate for overriding `==` and `hashCode`. |
| [xml](https://pub.dev/packages/xml) | Makes importing, parsing and exporting XML documents a breeze. |
| [xml_annotation](https://pub.dev/packages/xml_annotation) | Annotations for generating objects with `xml_serializable`. |
| Dev packages| |
| [build_runner](https://pub.dev/packages/build_runner) | Used to generate files for `xml_serializable`. |
| [copy_with_extension_gen](https://pub.dev/packages/copy_with_extension_gen) | Used to generate files for `copy_with_extension`. |
| [http](https://pub.dev/packages/http) | Download data dictionary file for testing. |
| [test](https://pub.dev/packages/test) | Unit testing. |
| [very_good_analysis](https://pub.dev/packages/very_good_analysis) | Nice set of lint rules. |
| [xml_serializable](https://pub.dev/packages/xml_serializable) | Make objects serializable to and from XML with the help of code generation. |
