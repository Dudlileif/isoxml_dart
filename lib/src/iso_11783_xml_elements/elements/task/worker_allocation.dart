// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes the allocation of [Worker]s to a [Task].
///
/// The [AllocationStamp] entry describes the start/stop time of worker
/// allocations and the changes of the [WorkerAllocation]s inside a [Task].
class WorkerAllocation extends Iso11783Element with _AllocationStampMixin {
  /// Default factory for creating a [WorkerAllocation] with verified
  /// arguments.
  factory WorkerAllocation({
    required String workerIdRef,
    AllocationStamp? allocationStamp,
  }) {
    ArgumentValidation.checkId(
      id: workerIdRef,
      idRefPattern: Worker.staticIdRefPattern,
      idName: 'workerIdRef',
    );
    return WorkerAllocation._(
      workerIdRef: workerIdRef,
      allocationStamp: allocationStamp,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  WorkerAllocation._({
    required String workerIdRef,
    AllocationStamp? allocationStamp,
  }) : super(
         elementType: Iso11783ElementType.workerAllocation,
         description: 'WorkerAllocation',
       ) {
    this.workerIdRef = workerIdRef;
    this.allocationStamp = allocationStamp;
  }

  /// Reference to a [Worker].
  String get workerIdRef => parseString('A');
  set workerIdRef(String value) => setString('A', value);
}
