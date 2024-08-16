import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'package:mappable_maps_navikit/src/bindings/weak_interfaces_meta.g.dart';
import 'package:mappable_maps_navikit/src/bindings/common/library.dart';

final Pointer<Utf8> Function(Pointer<Void>) _get_id = library
    .lookup<NativeFunction<Pointer<Utf8> Function(Pointer<Void>)>>(
        'mappable_flutter_weak_interface_wrapper_id')
    .asFunction(isLeaf: true);

T createFromNative<T>(Pointer<Void> ptr) {
  final String name = _get_id(ptr).toDartString();

  return weakInterfacesMeta[name]!(ptr) as T;
}
