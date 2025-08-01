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
import 'package:mappable_maps_navikit/src/bindings/image/animated_image_provider.dart'
    as animated_image_provider;
import 'package:mappable_maps_navikit/src/mapkit/map/callback.dart'
    as mapkit_map_callback;
import 'package:mappable_maps_navikit/src/mapkit/map/icon_style.dart'
    as mapkit_map_icon_style;
import 'package:mappable_maps_navikit/src/mapkit/map/placemark_presentation.dart'
    as mapkit_map_placemark_presentation;
import 'package:meta/meta.dart';

part 'placemark_animation.containers.dart';
part 'placemark_animation.impl.dart';

/// Provides an interface to load and control animation of placemark.
abstract class PlacemarkAnimation
    implements
        mapkit_map_placemark_presentation.PlacemarkPresentation,
        ffi.Finalizable {
  /// If true, animation will be played in the reverse direction. Default
  /// value is false.
  core.bool get reversed;
  set reversed(core.bool val);

  /// Sets the animated image and icon style. The new animation will be in
  /// the paused state.
  void setIcon(animated_image_provider.AnimatedImageProvider image,
      mapkit_map_icon_style.IconStyle style);

  /// Sets the animated image and icon style. The new animation will be in
  /// the paused state.
  ///
  /// [onFinished] is called when the icon is loaded.
  void setIconWithCallback(
      animated_image_provider.AnimatedImageProvider image,
      mapkit_map_icon_style.IconStyle style,
      mapkit_map_callback.Callback onFinished);

  /// Changes the icon style.
  void setIconStyle(mapkit_map_icon_style.IconStyle style);

  /// Starts animation. Removes the current play callback. Same as
  /// play(null).
  void play();

  /// Starts animation and handles the callback.
  ///
  /// [onFinished] is called when animation finishes and replaces the
  /// previous callback.
  void playWithCallback(mapkit_map_callback.Callback onFinished);

  /// Resumes paused animation. Callback (if any) is NOT removed.
  void resume();

  /// Stops animation. Animation returns to the initial paused state.
  void stop();

  /// Pauses animation.
  void pause();

  core.bool isValid();
}
