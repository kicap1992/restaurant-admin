import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';
import '../../../../app/core/custom_base_view_model.dart';

class MakananListViewModel extends CustomBaseViewModel {
  final log = getLogger('MakananListViewModel');
  Future<void> init() async {
    globalVar.backPressed = 'exitApp';
  }

  goToDetailMakanan() {
    log.i('goToDetailMakanan');
    navigationService.navigateTo(Routes.detailMakananView);
  }
}
