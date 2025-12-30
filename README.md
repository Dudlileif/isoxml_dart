# ISOXML - A WIP dart library for interacting with ISO 11783-10 files

## [Documentation](https://dudlileif.github.io/isoxml_dart)

## Todo list

* Document everything
  * Some elements are missing descriptive documentation due to expensive standard documents.
* ~~Add ZIP read/write support for VM and web~~
* ~~Add external file separation from main task data document~~
* ~~Convert to and from TLG and GRD binary formats~~
* ~~Add ISO 11783-11 import of Data Directory Entities (DDE)~~
* ~~Add ISO 11783-6 colour palette~~
* Add a registry within TaskData to ensure no duplicates (ids) ~~and access to all ids/elements from anywhere.~~
* Add capabilty to TimeLog to write/append to binary file when items are added.
* ~~Implement Point binary file~~
* Further improve tests
* Add example(s)

## Dependencies

| Package | Usage |
| ------- | ----------- |
| [archive](https://pub.dev/packages/archive) | Encode and decode ZIP files. |
| [collection](https://pub.dev/packages/collection) | Handy extension methods on iterables. |
| [meta](https://pub.dev/packages/meta) | Annotations for immutable classes. |
| [web](https://pub.dev/packages/web) | Helps with handling JS and WASM compatibility on the web platform. |
| [xml](https://pub.dev/packages/xml) | Makes importing, parsing and exporting XML documents a breeze. |
| Dev packages | |
| [http](https://pub.dev/packages/http) | Download data dictionary file for testing. |
| [test](https://pub.dev/packages/test) | Unit testing. |
| [very_good_analysis](https://pub.dev/packages/very_good_analysis) | Nice set of lint rules. |
