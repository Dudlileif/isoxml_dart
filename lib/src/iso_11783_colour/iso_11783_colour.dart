// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

/// A class with a static method for getting the colour values according to
/// ISO 11783-6. The colours with index 0-231 are defined in the standard,
/// whilst the colours 232-255 are proprietary to the virtual terminal
/// design, and therefore not strictly defined.
class Iso11783Colour {
  /// A class with a static method for getting the colour values according to
  /// ISO 11783-6. The colours with index 0-231 are defined in the standard,
  /// whilst the colours 232-255 are [proprietaryColours] to the virtual
  /// terminal design, and therefore not strictly defined.
  ///
  /// The [proprietaryColours] default to a simple palette with hue from
  /// 0 to 360 separated with equal spacing (red-green-blue-red).
  const Iso11783Colour({
    this.proprietaryColours = defaultProprietaryColours,
  }) : assert(
          proprietaryColours.length == 24,
          'proprietaryColours must have a length of 24.',
        );

  /// The proprietary colours for the virtual termnial design, corresponds to
  /// indices 232-255.
  final List<int> proprietaryColours;

  /// Returns (A)RGB values for [index] of the 256 possible colours, where
  /// the 0-15 first are specified colours, the 16-231 are gradually increasing
  /// each channel value, whilst 232-255 are mapped to the [proprietaryColours].
  ///
  /// If [alpha] is not null, then the value will be prepended so that
  /// the returned value will follow 0xAARRGGBB. Default is 0xFF.
  /// If [alpha] is null, the returned value will follow 0xRRGGBB.
  int fromIndex(int index, {bool withAlpha = true, int alpha = 0xFF}) {
    assert(
      index >= 0 && index <= 255,
      'index must be between 0 and 231 for predefined colours.',
    );
    if (withAlpha) {
      assert(
        alpha >= 0 && alpha <= 0xFF,
        'alpha must be between 0x00 and 0xFF. (0 and 255)',
      );
    }
    if (index < 232) {
      return predefinedFromIndex(index, withAlpha: withAlpha, alpha: alpha);
    }
    if (withAlpha) {
      return (alpha << 24) + proprietaryColours[index - 232];
    }

    return proprietaryColours[index - 232];
  }

  /// Returns (A)RGB values for [index] of the 232 first predefined colours,
  /// where the 0-15 first are specified colours, and 16-231 are made with
  /// gradually increasing channel values from 0x00 to 0xFF in 0x33 steps,
  /// blue first, then green, then red.
  ///
  /// If [alpha] is not null, then the value will be prepended so that
  /// the returned value will follow 0xAARRGGBB. Default is 0xFF.
  /// If [alpha] is null, the returned value will follow 0xRRGGBB.
  static int predefinedFromIndex(
    int index, {
    bool withAlpha = true,
    int alpha = 0xFF,
  }) {
    assert(
      index >= 0 && index <= 231,
      'index must be between 0 and 231 for predefined colours.',
    );
    if (withAlpha) {
      assert(
        alpha >= 0 && alpha <= 0xFF,
        'alpha must be between 0x00 and 0xFF. (0 and 255)',
      );
    }
    var value = 0;
    if (index <= 15) {
      value = firstColours[index];
    } else {
      value = webSafeColours[index - 16];
    }
    if (withAlpha) {
      return (alpha << 24) + value;
    }
    return value;
  }

  /// The first 16 colours of the ISO 11783-6 standard.
  static const firstColours = [
    0x000000,
    0xFFFFFF,
    0x009900,
    0x009999,
    0x990000,
    0x990099,
    0x999900,
    0xCCCCCC,
    0x999999,
    0x0000FF,
    0x00FF00,
    0x00FFFF,
    0xFF0000,
    0xFF00FF,
    0xFFFF00,
    0x000099,
  ];

  /// The standard 216 colours web browser safe palette.
  static const webSafeColours = [
    0x000000,
    0x000033,
    0x000066,
    0x000099,
    0x0000CC,
    0x0000FF,
    0x003300,
    0x003333,
    0x003366,
    0x003399,
    0x0033CC,
    0x0033FF,
    0x006600,
    0x006633,
    0x006666,
    0x006699,
    0x0066CC,
    0x0066FF,
    0x009900,
    0x009933,
    0x009966,
    0x009999,
    0x0099CC,
    0x0099FF,
    0x00CC00,
    0x00CC33,
    0x00CC66,
    0x00CC99,
    0x00CCCC,
    0x00CCFF,
    0x00FF00,
    0x00FF33,
    0x00FF66,
    0x00FF99,
    0x00FFCC,
    0x00FFFF,
    0x330000,
    0x330033,
    0x330066,
    0x330099,
    0x3300CC,
    0x3300FF,
    0x333300,
    0x333333,
    0x333366,
    0x333399,
    0x3333CC,
    0x3333FF,
    0x336600,
    0x336633,
    0x336666,
    0x336699,
    0x3366CC,
    0x3366FF,
    0x339900,
    0x339933,
    0x339966,
    0x339999,
    0x3399CC,
    0x3399FF,
    0x33CC00,
    0x33CC33,
    0x33CC66,
    0x33CC99,
    0x33CCCC,
    0x33CCFF,
    0x33FF00,
    0x33FF33,
    0x33FF66,
    0x33FF99,
    0x33FFCC,
    0x33FFFF,
    0x660000,
    0x660033,
    0x660066,
    0x660099,
    0x6600CC,
    0x6600FF,
    0x663300,
    0x663333,
    0x663366,
    0x663399,
    0x6633CC,
    0x6633FF,
    0x666600,
    0x666633,
    0x666666,
    0x666699,
    0x6666CC,
    0x6666FF,
    0x669900,
    0x669933,
    0x669966,
    0x669999,
    0x6699CC,
    0x6699FF,
    0x66CC00,
    0x66CC33,
    0x66CC66,
    0x66CC99,
    0x66CCCC,
    0x66CCFF,
    0x66FF00,
    0x66FF33,
    0x66FF66,
    0x66FF99,
    0x66FFCC,
    0x66FFFF,
    0x990000,
    0x990033,
    0x990066,
    0x990099,
    0x9900CC,
    0x9900FF,
    0x993300,
    0x993333,
    0x993366,
    0x993399,
    0x9933CC,
    0x9933FF,
    0x996600,
    0x996633,
    0x996666,
    0x996699,
    0x9966CC,
    0x9966FF,
    0x999900,
    0x999933,
    0x999966,
    0x999999,
    0x9999CC,
    0x9999FF,
    0x99CC00,
    0x99CC33,
    0x99CC66,
    0x99CC99,
    0x99CCCC,
    0x99CCFF,
    0x99FF00,
    0x99FF33,
    0x99FF66,
    0x99FF99,
    0x99FFCC,
    0x99FFFF,
    0xCC0000,
    0xCC0033,
    0xCC0066,
    0xCC0099,
    0xCC00CC,
    0xCC00FF,
    0xCC3300,
    0xCC3333,
    0xCC3366,
    0xCC3399,
    0xCC33CC,
    0xCC33FF,
    0xCC6600,
    0xCC6633,
    0xCC6666,
    0xCC6699,
    0xCC66CC,
    0xCC66FF,
    0xCC9900,
    0xCC9933,
    0xCC9966,
    0xCC9999,
    0xCC99CC,
    0xCC99FF,
    0xCCCC00,
    0xCCCC33,
    0xCCCC66,
    0xCCCC99,
    0xCCCCCC,
    0xCCCCFF,
    0xCCFF00,
    0xCCFF33,
    0xCCFF66,
    0xCCFF99,
    0xCCFFCC,
    0xCCFFFF,
    0xFF0000,
    0xFF0033,
    0xFF0066,
    0xFF0099,
    0xFF00CC,
    0xFF00FF,
    0xFF3300,
    0xFF3333,
    0xFF3366,
    0xFF3399,
    0xFF33CC,
    0xFF33FF,
    0xFF6600,
    0xFF6633,
    0xFF6666,
    0xFF6699,
    0xFF66CC,
    0xFF66FF,
    0xFF9900,
    0xFF9933,
    0xFF9966,
    0xFF9999,
    0xFF99CC,
    0xFF99FF,
    0xFFCC00,
    0xFFCC33,
    0xFFCC66,
    0xFFCC99,
    0xFFCCCC,
    0xFFCCFF,
    0xFFFF00,
    0xFFFF33,
    0xFFFF66,
    0xFFFF99,
    0xFFFFCC,
    0xFFFFFF,
  ];

  /// The default [proprietaryColours], which is a simple palette with hue from
  /// 0 to 360 separated with equal spacing (red-green-blue-red).
  static const List<int> defaultProprietaryColours = [
    0xFF0000,
    0xFF4000,
    0xFF8000,
    0xFFBF00,
    0xFFFF00,
    0xBFFF00,
    0x80FF00,
    0x40FF00,
    0x00FF00,
    0x00FF40,
    0x00FF80,
    0x00FFBF,
    0x00FFFF,
    0x00BFFF,
    0x0080FF,
    0x0040FF,
    0x0000FF,
    0x4000FF,
    0x8000FF,
    0xBF00FF,
    0xFF00FF,
    0xFF00BF,
    0xFF0080,
    0xFF0040,
  ];

  /// Names for the 16 [firstColours].
  static const firstColoursNames = [
    'Black',
    'White',
    'Green',
    'Teal',
    'Maroon',
    'Purple',
    'Olive',
    'Silver',
    'Grey',
    'Blue',
    'Lime',
    'Cyan',
    'Red',
    'Magenta',
    'Yellow',
    'Navy',
  ];
}
