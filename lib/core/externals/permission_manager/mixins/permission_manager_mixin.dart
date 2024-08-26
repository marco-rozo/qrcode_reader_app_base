import 'package:code_bar_reader_base/core/externals/permission_manager/enums/permission_manager_status_enum.dart';
import 'package:permission_handler/permission_handler.dart';

mixin PermissionManagerMixin {
  PermissionManagerStatusEnum convertPermissionStatus(
      PermissionStatus permissionStatus) {
    return switch (permissionStatus) {
      PermissionStatus.denied => PermissionManagerStatusEnum.denied,
      PermissionStatus.granted => PermissionManagerStatusEnum.granted,
      PermissionStatus.limited => PermissionManagerStatusEnum.limited,
      PermissionStatus.restricted => PermissionManagerStatusEnum.restricted,
      PermissionStatus.permanentlyDenied =>
        PermissionManagerStatusEnum.permanentlyDenied,
      PermissionStatus.provisional => PermissionManagerStatusEnum.provisional,
    };
  }
}
