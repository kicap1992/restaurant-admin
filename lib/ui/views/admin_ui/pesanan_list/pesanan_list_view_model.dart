import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';

class PesananListViewModel extends CustomBaseViewModel {
  final log = getLogger('PesananListViewModel');
  Future<void> init() async {
    globalVar.backPressed = 'exitApp';
  }
}
