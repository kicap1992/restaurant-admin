import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './akun_admin_view_model.dart';

class AkunAdminView extends StatelessWidget {
  const AkunAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AkunAdminViewModel>.reactive(
      viewModelBuilder: () => AkunAdminViewModel(),
      onViewModelReady: (AkunAdminViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        AkunAdminViewModel model,
        Widget? child,
      ) {
        return WillPopScope(
          onWillPop: () async {
            // model.log.d('onWillPop ini akun');
            if (model.globalVar.backPressed == 'exitApp') {
              model.quitApp(context);
              model.globalVar.backPressed = 'exitApp';
              return false;
            }
            return false;
          },
          child: const Scaffold(
            body: Center(
              child: Text(
                'AkunAdminView',
              ),
            ),
          ),
        );
      },
    );
  }
}
