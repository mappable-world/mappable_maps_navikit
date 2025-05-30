import 'dart:ffi' as ffi;
import 'package:mappable_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'dart:typed_data' as typed_data;
import 'package:mappable_maps_navikit/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:mappable_maps_navikit/src/bindings/common/exception.dart'
    as exception;
import 'package:mappable_maps_navikit/src/bindings/common/native_types.dart'
    as native_types;
import 'package:mappable_maps_navikit/src/bindings/common/string_map.dart'
    as string_map;
import 'package:mappable_maps_navikit/src/bindings/common/to_platform.dart'
    as to_platform;
import 'package:mappable_maps_navikit/src/bindings/common/vector.dart'
    as vector;
import 'package:mappable_maps_navikit/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:meta/meta.dart';

part 'recording.containers.dart';
part 'recording.impl.dart';

abstract class ReportData implements ffi.Finalizable {
  core.DateTime get startTime;
  core.DateTime get endTime;
  typed_data.ByteBuffer data();
}

abstract class ReportCollector implements ffi.Finalizable {
  /// Get all stored reports. The reports are not stored forever. There is
  /// an internal limit on the total size of all reports so older reports
  /// will be removed if space is needed for a newer report. The reports
  /// are sorted by their start time: the oldest report is first, the
  /// newest is last.
  core.List<ReportData> reports();

  core.bool isValid();
}

class ReportCollectorFactory {
  ReportCollectorFactory._();

  static ReportCollector get instance => _instance;
}
