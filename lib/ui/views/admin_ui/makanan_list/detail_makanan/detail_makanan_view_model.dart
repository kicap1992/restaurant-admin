import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';

class DetailMakananViewModel extends CustomBaseViewModel {
  final log = getLogger('DetailMakananViewModel');

  Future<void> init() async {
    globalVar.backPressed = 'backNormal';
  }
}
