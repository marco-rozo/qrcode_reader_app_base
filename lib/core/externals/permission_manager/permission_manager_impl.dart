import 'package:code_bar_reader_base/core/externals/permission_manager/enums/permission_manager_status_enum.dart';
import 'package:code_bar_reader_base/core/externals/permission_manager/mixins/permission_manager_mixin.dart';
import 'package:code_bar_reader_base/core/externals/permission_manager/permission_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManagerImpl
    with PermissionManagerMixin
    implements PermissionManager {
  @override
  Future<PermissionManagerStatusEnum> requestCameraPermission() async {
    final permission = await Permission.camera.request();
    return convertPermissionStatus(permission);
  }
}
