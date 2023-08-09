import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';

class MejaDetailViewModel extends CustomBaseViewModel {
  final log = getLogger('MejaDetailViewModel');

  late String mejaId;
  late String namaMeja;

  String? imgAsset;

  Future<void> init(String mejaId) async {
    log.i('MejaDetailViewModel init');
    log.i('mejaId : $mejaId');
    this.mejaId = mejaId;
    globalVar.backPressed = 'backNormal';
    // seperate the number from the string
    var number = int.parse(mejaId.replaceAll(RegExp(r'[^0-9]'), ''));
    // log.i('number : $number');
    if (number <= 4) {
      namaMeja = 'Gazebo';
      imgAsset = 'assets/reza_gazebo.jpeg';
    } else if (number >= 5 && number <= 12) {
      namaMeja = 'Meja';
      imgAsset = 'assets/reza_meja_1.jpeg';
    } else if (number >= 13 && number <= 22) {
      namaMeja = 'Meja';
      imgAsset = 'assets/reza_meja_2.jpeg';
    }

    namaMeja = '$namaMeja $number';

    log.i('imgAsset : $imgAsset');
  }
}
