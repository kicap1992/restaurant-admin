import '../../../app/app.router.dart';

import '../../../app/core/custom_base_view_model.dart';

class SplashScreenViewModel extends CustomBaseViewModel {
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    await navigationService.navigateToLoginUserView();
  }
}
