import '../../../../../app/core/custom_base_view_model.dart';

class MejaHistoryLogViewModel extends CustomBaseViewModel {
  Future<void> init() async {
    globalVar.backPressed = 'backNormal';
  }
}
