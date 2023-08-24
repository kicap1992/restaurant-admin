import 'package:reza_admin/model/my_model.dart';

import '../../../../../app/app.dialogs.dart';
import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';

class MejaDetailViewModel extends CustomBaseViewModel {
  final log = getLogger('MejaDetailViewModel');

  late String mejaId;
  late String namaMeja;
  late int idMeja;

  String? imgAsset;

  bool theBool = false;

  Future<void> init(String mejaId) async {
    // log.i('MejaDetailViewModel init');
    // log.i('mejaId : $mejaId');
    this.mejaId = mejaId;
    globalVar.backPressed = 'backNormal';
    // seperate the number from the string
    var number = int.parse(mejaId.replaceAll(RegExp(r'[^0-9]'), ''));
    idMeja = number;
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

    // log.i('imgAsset : $imgAsset');
    getData();
  }

  getData() async {
    easyLoading.showLoading();
    setBusy(true);
    try {
      var response = await httpService.get('table/detail/$idMeja');
      // log.i('response : $response');
      MyModel myModel = MyModel.fromJson(response.data);
      theBool = myModel.theBool!;
      log.i('theBool : $theBool');
    } catch (e) {
      log.e('error : $e');
    } finally {
      setBusy(false);
      easyLoading.dismiss();
    }
  }

  editStatus() async {
    var res = await dialogService.showCustomDialog(
      variant: DialogType.mejaEditStatusDialogView,
      data: {'idMeja': idMeja},
    );

    if (res!.confirmed) {
      getData();
    }
  }
}
