import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './meja_history_log_view_model.dart';

class MejaHistoryLogView extends StatelessWidget {
  const MejaHistoryLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MejaHistoryLogViewModel>.reactive(
      viewModelBuilder: () => MejaHistoryLogViewModel(),
      onViewModelReady: (MejaHistoryLogViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        MejaHistoryLogViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'MejaHistoryLogView',
            ),
          ),
        );
      },
    );
  }
}
