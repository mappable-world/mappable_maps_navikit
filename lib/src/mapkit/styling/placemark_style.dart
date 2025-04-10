import 'dart:ffi' as ffi;
import 'package:mappable_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'dart:math' as math;
import 'package:mappable_maps_navikit/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:mappable_maps_navikit/src/bindings/common/exception.dart'
    as exception;
import 'package:mappable_maps_navikit/src/bindings/common/native_types.dart'
    as native_types;
import 'package:mappable_maps_navikit/src/bindings/common/string_map.dart'
    as string_map;
import 'package:mappable_maps_navikit/src/bindings/common/to_native.dart'
    as to_native;
import 'package:mappable_maps_navikit/src/bindings/common/vector.dart'
    as vector;
import 'package:mappable_maps_navikit/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:mappable_maps_navikit/src/bindings/image/animated_image_provider.dart'
    as animated_image_provider;
import 'package:mappable_maps_navikit/src/bindings/image/image_provider.dart'
    as image_provider;
import 'package:mappable_maps_navikit/src/mapkit/map/model_style.dart'
    as mapkit_map_model_style;
import 'package:mappable_maps_navikit/src/runtime/data_provider_with_id.dart'
    as runtime_data_provider_with_id;
import 'package:meta/meta.dart';

part 'placemark_style.containers.dart';
part 'placemark_style.impl.dart';

abstract class PlacemarkStyle implements ffi.Finalizable {
  /// Set the placemark to be an 3D arrow. Usable only for user position
  /// placemark.
  void setArrowModel();

  /// The class maintains a strong reference to the object in
  /// the 'model' parameter until it (the class) is invalidated.
  void setGltfModel(runtime_data_provider_with_id.DataProviderWithId model,
      mapkit_map_model_style.ModelStyle modelStyle);

  void setImage(image_provider.ImageProvider image);

  void setAnimatedImage(
      animated_image_provider.AnimatedImageProvider iconImage);

  /// Icon anchor, (0, 0) is top left and (1.0, 1.0) is bottom right.
  void setIconAnchor(math.Point<core.double> iconAnchor);

  /// Piecewise linear scale function. See Placemark's scale function.
  void setScaleFunction(core.List<math.Point<core.double>> points);

  /// Minimal zoom for placemark to be visible.
  void setMinZoomVisible(core.double? minZoom);

  core.bool isValid();
}
