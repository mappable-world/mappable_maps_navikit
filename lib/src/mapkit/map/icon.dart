import 'dart:ffi' as ffi;
import 'package:mappable_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'package:mappable_maps_navikit/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:mappable_maps_navikit/src/bindings/common/exception.dart'
    as exception;
import 'package:mappable_maps_navikit/src/bindings/common/string_map.dart'
    as string_map;
import 'package:mappable_maps_navikit/src/bindings/common/to_native.dart'
    as to_native;
import 'package:mappable_maps_navikit/src/bindings/common/vector.dart'
    as vector;
import 'package:mappable_maps_navikit/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:mappable_maps_navikit/src/bindings/image/image_provider.dart'
    as image_provider;
import 'package:mappable_maps_navikit/src/mapkit/map/callback.dart'
    as mapkit_map_callback;
import 'package:mappable_maps_navikit/src/mapkit/map/icon_style.dart'
    as mapkit_map_icon_style;
import 'package:mappable_maps_navikit/src/mapkit/map/placemark_presentation.dart'
    as mapkit_map_placemark_presentation;
import 'package:meta/meta.dart';

part 'icon.containers.dart';
part 'icon.impl.dart';

/// Provides an interface to set icon and its style for a placemark.
abstract class Icon
    implements
        mapkit_map_placemark_presentation.PlacemarkPresentation,
        ffi.Finalizable {
  /// The style properties (scale, zIndex, etc.) of the icon placemark.
  /// Note: The current style cannot be modified directly - you must reset
  /// it to apply changes.
  mapkit_map_icon_style.IconStyle get style;
  set style(mapkit_map_icon_style.IconStyle val);

  /// Sets the image with the given style for the icon.
  void setImage(image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style);

  /// Sets the image with the given style for the icon. The callback will
  /// be called immediately after the icon finished loading.
  ///
  /// [onFinished] Called when the icon is loaded.
  void setImageWithCallback(
      image_provider.ImageProvider image,
      mapkit_map_icon_style.IconStyle style,
      mapkit_map_callback.Callback onFinished);

  core.bool isValid();
}
