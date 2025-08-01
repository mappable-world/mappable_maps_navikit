import 'dart:ffi' as ffi;
import 'package:mappable_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'package:mappable_maps_navikit/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:mappable_maps_navikit/src/bindings/common/exception.dart'
    as exception;
import 'package:mappable_maps_navikit/src/bindings/common/string_map.dart'
    as string_map;
import 'package:mappable_maps_navikit/src/bindings/common/vector.dart'
    as vector;
import 'package:mappable_maps_navikit/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:mappable_maps_navikit/src/mapkit/map/callback.dart'
    as mapkit_map_callback;
import 'package:mappable_maps_navikit/src/mapkit/map/model_style.dart'
    as mapkit_map_model_style;
import 'package:mappable_maps_navikit/src/mapkit/map/placemark_presentation.dart'
    as mapkit_map_placemark_presentation;
import 'package:mappable_maps_navikit/src/runtime/data_provider_with_id.dart'
    as runtime_data_provider_with_id;
import 'package:meta/meta.dart';

part 'model.containers.dart';
part 'model.impl.dart';

/// describes model presentation of PlacemarkMapObject
abstract class Model
    implements
        mapkit_map_placemark_presentation.PlacemarkPresentation,
        ffi.Finalizable {
  /// The style properties (sclae, unitType, etc.) of the model placemark.
  /// Note: The current style cannot be modified directly - you must reset
  /// it to apply changes.
  mapkit_map_model_style.ModelStyle get modelStyle;
  set modelStyle(mapkit_map_model_style.ModelStyle val);

  /// Sets gltf data provider.
  ///
  /// The class maintains a strong reference to the object in
  /// the 'gltfDataProvider' parameter until it (the class) is invalidated.
  ///
  /// [onFinished] Called when the model is loaded.
  void setData(
      runtime_data_provider_with_id.DataProviderWithId gltfDataProvider,
      mapkit_map_callback.Callback onFinished);

  core.bool isValid();
}
