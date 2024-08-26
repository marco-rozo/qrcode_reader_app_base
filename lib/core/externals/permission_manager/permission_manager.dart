import 'package:code_bar_reader_base/core/externals/permission_manager/enums/permission_manager_status_enum.dart';

abstract class PermissionManager {
  Future<PermissionManagerStatusEnum> requestCameraPermission();
}
