import 'dart:ffi' as ffi;
import 'package:mappable_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'package:mappable_maps_navikit/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:mappable_maps_navikit/src/bindings/common/async.dart'
    show runWithBlockUi;
import 'package:mappable_maps_navikit/src/bindings/common/string_map.dart'
    as string_map;
import 'package:mappable_maps_navikit/src/bindings/common/vector.dart'
    as vector;
import 'package:mappable_maps_navikit/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:meta/meta.dart';

part 'error.containers.dart';
part 'error.impl.dart';

/// An error has occurred.
abstract class Error implements ffi.Finalizable {
  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}
