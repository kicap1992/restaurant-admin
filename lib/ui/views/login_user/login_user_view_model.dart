import 'package:flutter/material.dart';
import 'package:reza_admin/app/app.router.dart';

import '../../../app/app.logger.dart';
import '../../../app/core/custom_base_view_model.dart';

class LoginUserViewModel extends CustomBaseViewModel {
  final log = getLogger('LoginUserViewModel');

  TextEditingController noHpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool showPassword = true;

  Future<void> init() async {}

  login() async {
    setBusy(true);
    globalVar.backPressed = 'cantBack';
    easyLoading.showLoading();
    await Future.delayed(const Duration(seconds: 2));
    easyLoading.dismissLoading();
    setBusy(false);
    globalVar.backPressed = 'backNormal';
    notifyListeners();
    await navigationService.navigateToAdminIndexTrackingView();
  }
}
