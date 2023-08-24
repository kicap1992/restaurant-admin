// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/views/admin_ui/makanan_list/add_edit_makanan/add_edit_makanan_text_form_dialog/add_edit_makanan_text_form_dialog_view.dart';
import '../ui/views/admin_ui/meja_list/meja_edit_status_dialog/meja_edit_status_dialog_view.dart';

enum DialogType {
  mejaEditStatusDialogView,
  addEditMakananTextFormDialogView,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.mejaEditStatusDialogView: (context, request, completer) =>
        MejaEditStatusDialogView(request: request, completer: completer),
    DialogType.addEditMakananTextFormDialogView:
        (context, request, completer) => AddEditMakananTextFormDialogView(
            request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
