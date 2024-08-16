import 'dart:ffi' as ffi;
import 'package:mappable_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'package:mappable_maps_navikit/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:mappable_maps_navikit/src/bindings/common/string_map.dart'
    as string_map;
import 'package:mappable_maps_navikit/src/bindings/common/vector.dart'
    as vector;
import 'package:mappable_maps_navikit/src/directions/driving/route.dart'
    as directions_driving_route;
import 'package:mappable_maps_navikit/src/mapkit/navigation/route_position.dart'
    as mapkit_navigation_route_position;
import 'package:meta/meta.dart';

part 'alternative.containers.dart';
part 'alternative.impl.dart';

abstract class NavigationAlternative implements ffi.Finalizable {
  directions_driving_route.DrivingRoute get alternative;
  mapkit_navigation_route_position.RoutePosition get forkPositionOnAlternative;
  mapkit_navigation_route_position.RoutePosition get forkPositionOnCurrentRoute;
}
