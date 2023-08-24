import 'package:dio/dio.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';

class MejaEditStatusDialogViewModel extends CustomBaseViewModel {
  final log = getLogger('MejaEditStatusDialogViewModel');

  int? idMeja;
  String status = 'Tersedia';

  List<String> statusList = ['Tersedia', 'Tidak Tersedia'];

  Future<void> init(data) async {
    log.i("data : ${data['idMeja']}");
    idMeja = data['idMeja'];
  }

  Future<bool> editStatus() async {
    easyLoading.showLoading();
    setBusy(true);
    try {
      var formData = FormData.fromMap({
        'id_meja': idMeja,
        'status': status,
      });
      var response = await httpService.postWithFormData(
          'table/reservation/$idMeja', formData);
      log.i('response : $response');
      return true;
    } catch (e) {
      log.e('error : $e');
      return false;
    } finally {
      setBusy(false);
      easyLoading.dismiss();
    }
  }
}
