import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';

class MejaEditViewModel extends CustomBaseViewModel {
  final log = getLogger('MejaEditViewModel');
  late String mejaId;
  late String namaMeja;
  Future<void> init(String mejaId) async {
    globalVar.backPressed = 'backNormal';
    log.i('MejaEditViewModel init mejaId : $mejaId');

    this.mejaId = mejaId;

    // seperate the number from the string
    var number = int.parse(mejaId.replaceAll(RegExp(r'[^0-9]'), ''));
    // log.i('number : $number');
    if (number <= 4) {
      namaMeja = 'Gazebo';
    } else if (number >= 5 && number <= 12) {
      namaMeja = 'Meja';
    } else if (number >= 13 && number <= 22) {
      namaMeja = 'Meja';
    }
    namaMeja = '$namaMeja $number';
    notifyListeners();
    log.i('backPressed : ${globalVar.backPressed}');
  }
}
