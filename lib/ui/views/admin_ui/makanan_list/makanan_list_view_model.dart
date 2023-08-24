import 'package:reza_admin/model/makanan_model.dart';
import 'package:reza_admin/model/my_model.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../services/my_socket_io_client.dart';

class MakananListViewModel extends CustomBaseViewModel {
  final log = getLogger('MakananListViewModel');
  final socketIoClient = locator<MySocketIoClient>();
  List<MakananModel> listMakanan = [];
  Future<void> init() async {
    globalVar.backPressed = 'exitApp';
    getData();
    socketIoClient.on('makanan_user', (data) {
      log.i('data : $data');
      listMakanan.clear();
      getData();
      // webViewController!.reload();
    });
  }

  getData() async {
    setBusy(true);
    easyLoading.showLoading();
    try {
      var res = await httpService.get('table/makanan');
      MyModel myModel = MyModel.fromJson(res.data);

      if (myModel.data.length > 0) {
        for (var item in myModel.data) {
          listMakanan.add(MakananModel.fromJson(item));
        }
      }
      log.i(listMakanan);
    } catch (e) {
      log.e(e.toString());
    } finally {
      easyLoading.dismiss();
      setBusy(false);
    }
  }

  goToDetailMakanan() {
    log.i('goToDetailMakanan');
    navigationService.navigateTo(Routes.detailMakananView);
  }
}
