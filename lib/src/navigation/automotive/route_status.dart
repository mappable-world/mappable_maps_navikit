import 'dart:ffi' as ffi;

import 'dart:core' as core;
import 'package:ffi/ffi.dart';
import 'package:mappable_maps_navikit/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:mappable_maps_navikit/src/bindings/common/string_map.dart'
    as string_map;
import 'package:mappable_maps_navikit/src/bindings/common/vector.dart'
    as vector;

part 'route_status.containers.dart';
part 'route_status.impl.dart';

enum RouteStatus {
  OnRoute,
  NotOnRoute,
  RouteFinished,
  RouteLost,
  ReturnedToRoute,
  WayPointReached,
  ;
}
