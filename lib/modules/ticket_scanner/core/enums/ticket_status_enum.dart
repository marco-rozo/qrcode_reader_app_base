import 'package:code_bar_reader_base/core/theme/styles/app_colors.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/core/consts/ticket_consts.dart';
import 'package:flutter/material.dart';

enum TicketStatusEnum {
  canceled(AppColors.negative, TicketConsts.canceled),
  purchased(AppColors.warning, TicketConsts.purchased),
  finished(AppColors.positive, TicketConsts.finished);

  final Color color;
  final String name;

  const TicketStatusEnum(this.color, this.name);
}
