import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';

class AddEditMakananViewModel extends CustomBaseViewModel {
  final log = getLogger('AddMakananViewModel');
  Future<void> init() async {
    globalVar.backPressed = 'backNormal';
  }
}
