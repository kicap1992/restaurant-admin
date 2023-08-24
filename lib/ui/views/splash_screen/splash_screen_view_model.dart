import 'package:reza_admin/app/app.locator.dart';

import '../../../app/app.router.dart';

import '../../../app/core/custom_base_view_model.dart';
import '../../../services/my_socket_io_client.dart';
// import '../../../services/my_socket_io_client.dart';

class SplashScreenViewModel extends CustomBaseViewModel {
  final socketIoClient = locator<MySocketIoClient>();
  Future<void> init() async {
    // MySocketIoClient().init();
    socketIoClient.init();
    await Future.delayed(const Duration(seconds: 2));
    await navigationService.navigateToLoginUserView();
  }
}
