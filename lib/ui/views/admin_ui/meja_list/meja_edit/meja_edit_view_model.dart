import '../../../../../app/core/custom_base_view_model.dart';

class MejaEditViewModel extends CustomBaseViewModel {
  Future<void> init() async {
    globalVar.backPressed = 'backNormal';
  }
}
