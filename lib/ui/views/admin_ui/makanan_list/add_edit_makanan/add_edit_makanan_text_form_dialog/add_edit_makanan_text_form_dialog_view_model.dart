import 'package:flutter/material.dart';

import '../../../../../../app/app.logger.dart';
import '../../../../../../app/core/custom_base_view_model.dart';

class AddEditMakananTextFormDialogViewModel extends CustomBaseViewModel {
  final log = getLogger('AddEditMakananTextFormDialogViewModel');
  late String title;
  late String description;
  late int maxLines;
  late bool keyboardType;

  TextEditingController textEditingController = TextEditingController();

  Future<void> init(data) async {
    log.i(data);

    title = data['title'];
    description = data['description'];
    maxLines = data['maxLines'];
    keyboardType = data['keyboardType'];
  }
}
