import 'package:mappable_maps_navikit/mapkit.dart';
import 'package:mappable_maps_navikit/mapkit_factory.dart';
import 'package:mappable_maps_navikit/src/bindings/widgets/platform_view_widget.dart';

class MappableMap extends PlatformViewWidget {
  MappableMap({
    super.key,
    super.platformViewType,
    super.textDirection,
    super.gestureRecognizers,
    super.hitTestBehavior,
    required this.onMapCreated,
    this.scale,
  }) : super(
          onViewCreated: (view) {
            final window = scale == null
                ? mapkit.createMapWindow(view)
                : mapkit.createMapWindowWithScale(view,
                    customScaleFactor: scale);
            onMapCreated(window);

            return true;
          },
        );

  final void Function(MapWindow) onMapCreated;
  final double? scale;
}
