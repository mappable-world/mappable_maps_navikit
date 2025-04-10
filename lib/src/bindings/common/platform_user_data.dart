import 'package:mappable_maps_navikit/src/bindings/common/library.dart';

import 'dart:ffi';

final void Function(Pointer<Void>) _removeDeletedHandle = library
    .lookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'mappable_maps_flutter_remove_delete_handle')
    .asFunction();

void removeDeletedUserData(Pointer<Void> ptr) {
  _removeDeletedHandle(ptr);
}
