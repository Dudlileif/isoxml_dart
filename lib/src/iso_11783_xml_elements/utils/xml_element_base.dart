// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso_11783_element.dart';

/// The base super class that has an [xmlElement] embedded. All attributes are
/// read from and saved to the [xmlElement], and all child elements of this
/// should use [_XmlSyncedList]s to automatically keep the [xmlElement] updated
/// with the correct children of this.
abstract class _XmlElementBase {
  /// The underlying XML element that this represents.
  late final XmlElement xmlElement;
}
