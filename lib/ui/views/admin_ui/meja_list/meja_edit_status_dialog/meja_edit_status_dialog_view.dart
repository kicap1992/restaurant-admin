import 'package:flutter/material.dart';
import 'package:reza_admin/app/themes/app_colors.dart';
import 'package:reza_admin/app/themes/app_text.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import './meja_edit_status_dialog_view_model.dart';

class MejaEditStatusDialogView extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const MejaEditStatusDialogView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MejaEditStatusDialogViewModel>.reactive(
      viewModelBuilder: () => MejaEditStatusDialogViewModel(),
      onViewModelReady: (MejaEditStatusDialogViewModel model) async {
        await model.init(request!.data);
      },
      builder: (
        BuildContext context,
        MejaEditStatusDialogViewModel model,
        Widget? child,
      ) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Edit Status',
                  style: regularTextStyle,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Status',
                  ),
                  value: model.status,
                  onChanged: (String? value) {
                    model.status = value!;
                  },
                  items: model.statusList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: regularTextStyle),
                    );
                  }).toList(),
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
                        'Batal',
                        style: regularTextStyle.copyWith(color: redColor),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        bool res = await model.editStatus();
                        if (res) {
                          completer!(DialogResponse(
                            confirmed: true,
                          ));
                        } else {
                          completer!(DialogResponse(
                            confirmed: false,
                          ));
                        }
                        completer!(DialogResponse(
                          confirmed: true,
                          // responseData: model.status,
                        ));
                      },
                      child: Text(
                        'Simpan',
                        style: regularTextStyle.copyWith(color: greenColor),
                      ),
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
