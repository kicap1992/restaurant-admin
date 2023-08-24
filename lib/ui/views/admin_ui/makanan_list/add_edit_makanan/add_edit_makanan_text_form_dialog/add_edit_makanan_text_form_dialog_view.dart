import 'package:flutter/material.dart';
import 'package:reza_admin/app/themes/app_text.dart';
import 'package:reza_admin/ui/widgets/my_textformfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import './add_edit_makanan_text_form_dialog_view_model.dart';

class AddEditMakananTextFormDialogView extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const AddEditMakananTextFormDialogView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddEditMakananTextFormDialogViewModel>.reactive(
      viewModelBuilder: () => AddEditMakananTextFormDialogViewModel(),
      onViewModelReady: (AddEditMakananTextFormDialogViewModel model) async {
        await model.init(request!.data);
      },
      builder: (
        BuildContext context,
        AddEditMakananTextFormDialogViewModel model,
        Widget? child,
      ) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                MyTextFormField(
                  hintText: model.description,
                  maxLines: model.maxLines,
                  controller: model.textEditingController,
                  keyboardType: model.keyboardType
                      ? TextInputType.number
                      : TextInputType.text,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        completer!(DialogResponse(confirmed: false));
                      },
                      child: Text(
                        'Cancel',
                        style: boldTextStyle.copyWith(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (model.textEditingController.text.isNotEmpty) {
                          completer!(DialogResponse(
                            confirmed: true,
                            data: model.textEditingController.text,
                          ));
                        } else {
                          model.snackbarService.showSnackbar(
                            message: 'Please fill the form',
                            title: 'Error',
                          );
                        }

                        // completer!(DialogResponse(
                        //   confirmed: true,
                        //   responseData: model.status,
                        // ));
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
