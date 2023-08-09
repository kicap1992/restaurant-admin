import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './meja_edit_view_model.dart';

class MejaEditView extends StatelessWidget {
  const MejaEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MejaEditViewModel>.reactive(
      viewModelBuilder: () => MejaEditViewModel(),
      onViewModelReady: (MejaEditViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MejaEditViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'MejaEditView',
            ),
          ),
        );
      },
    );
  }
}
