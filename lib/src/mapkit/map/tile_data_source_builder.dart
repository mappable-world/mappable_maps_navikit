import 'dart:ffi' as ffi;
import 'package:mappable_maps_navikit/src/bindings/common/library.dart' as lib;

import 'dart:core' as core;
import 'package:mappable_maps_navikit/src/bindings/annotations/annotations.dart'
    as bindings_annotations;
import 'package:mappable_maps_navikit/src/bindings/common/async.dart'
    show runWithBlockUi;
import 'package:mappable_maps_navikit/src/bindings/common/dispatcher.dart'
    as nativeBinding;
import 'package:mappable_maps_navikit/src/bindings/common/exception.dart'
    as exception;
import 'package:mappable_maps_navikit/src/bindings/common/string_map.dart'
    as string_map;
import 'package:mappable_maps_navikit/src/bindings/common/vector.dart'
    as vector;
import 'package:mappable_maps_navikit/src/bindings/common/weak_interface_wrapper.dart'
    as weak_interface_wrapper;
import 'package:mappable_maps_navikit/src/mapkit/geometry/geo/projection.dart'
    as mapkit_geometry_geo_projection;
import 'package:mappable_maps_navikit/src/mapkit/layers/tile_format.dart'
    as mapkit_layers_tile_format;
import 'package:mappable_maps_navikit/src/mapkit/map/base_data_source_builder.dart'
    as mapkit_map_base_data_source_builder;
import 'package:mappable_maps_navikit/src/mapkit/tiles/tile_provider.dart'
    as mapkit_tiles_tile_provider;
import 'package:mappable_maps_navikit/src/mapkit/tiles/url_provider.dart'
    as mapkit_tiles_url_provider;
import 'package:mappable_maps_navikit/src/mapkit/zoom_range.dart'
    as mapkit_zoom_range;
import 'package:meta/meta.dart';

part 'tile_data_source_builder.containers.dart';
part 'tile_data_source_builder.impl.dart';

abstract class BaseTileDataSourceBuilder
    implements
        mapkit_map_base_data_source_builder.BaseDataSourceBuilder,
        ffi.Finalizable {
  /// The class does not retain the object in the 'urlProvider' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setTileUrlProvider(
      mapkit_tiles_url_provider.TilesUrlProvider urlProvider);

  /// The class does not retain the object in the 'tileProvider' parameter.
  /// It is your responsibility to maintain a strong reference to
  /// the target object while it is attached to a class.
  void setTileProvider(mapkit_tiles_tile_provider.TileProvider tileProvider);

  void setProjection(mapkit_geometry_geo_projection.Projection projection);

  void setZoomRanges(core.List<mapkit_zoom_range.ZoomRangeIdl> zoomRanges);

  void setTileFormat(mapkit_layers_tile_format.TileFormat format);

  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

abstract class TileDataSourceBuilder
    implements BaseTileDataSourceBuilder, ffi.Finalizable {
  /// Usable only in [runWithBlockUi] or listener handlers.
  core.bool isValid();
}

abstract final class CreateTileDataSource {
  factory CreateTileDataSource(
      {required void Function(TileDataSourceBuilder builder)
          createTileDataSource}) {
    return CreateTileDataSourceImpl(
      createTileDataSource: createTileDataSource,
    );
  }

  /// User defined factory, which sets up TileDataSourceBuilder. Will be
  /// called only once.
  void createTileDataSource(TileDataSourceBuilder builder);
}
