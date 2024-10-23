import 'dart:ffi' as ffi;
import 'package:mappable_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'package:mappable_maps_navikit/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:mappable_maps_navikit/src/bindings/common/async.dart'
    show runWithBlockUi;
import 'package:mappable_maps_navikit/src/bindings/common/exception.dart'
    as exception;
import 'package:mappable_maps_navikit/src/bindings/common/string_map.dart'
    as string_map;
import 'package:mappable_maps_navikit/src/bindings/common/vector.dart'
    as vector;
import 'package:mappable_maps_navikit/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:mappable_maps_navikit/src/directions/driving/driving_router.dart'
    as directions_driving_driving_router;
import 'package:meta/meta.dart';

part 'directions.containers.dart';
part 'directions.impl.dart';

abstract class Directions implements ffi.Finalizable {
  /// Creates a manager that builds driving routes.
  directions_driving_driving_router.DrivingRouter createDrivingRouter(
      directions_driving_driving_router.DrivingRouterType type);

  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

class DirectionsFactory {
  DirectionsFactory._();

  static Directions get instance => _instance;
}
