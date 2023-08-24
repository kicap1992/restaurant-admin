import 'package:reza_admin/app/app.locator.dart';
import 'package:reza_admin/app/app.logger.dart';
import 'package:reza_admin/model/my_model.dart';
import 'package:reza_admin/model/reservasi_meja_model.dart';
import 'package:reza_admin/model/user_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../app/core/custom_base_view_model.dart';
import '../../../../services/my_socket_io_client.dart';

class MejaListViewModel extends CustomBaseViewModel {
  final log = getLogger('MejaListViewModel');
  WebViewController? webViewController;
  final socketIoClient = locator<MySocketIoClient>();

  List<ReservasiMejaModel> reservasiMejaList = [];
  List<UserModel?> userModelList = [];

  Future<void> init() async {
    globalVar.backPressed = 'exitApp';
    socketIoClient.on('table_admin', (data) {
      log.i('data : $data');
      getData();
      webViewController!.reload();
    });
    getData();
  }

  getData() async {
    setBusy(true);
    easyLoading.showLoading();
    try {
      var response = await httpService.get('table/detail');
      // log.i('response : ${response.data}');
      MyModel myModel = MyModel.fromJson(response.data);

      if (myModel.data != null) {
        for (var item in myModel.data!) {
          reservasiMejaList.add(ReservasiMejaModel.fromJson(item));
        }
        // log.i('reservasiMejaList : $reservasiMejaList');
      }

      for (var item in reservasiMejaList) {
        if (item.idUser != null) {
          UserModel? userModel = await getUserDetail(item.idUser!);
          userModelList.add(userModel!);
        } else {
          userModelList.add(null);
        }
      }
      log.i('userModelList : $userModelList');
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
      easyLoading.dismiss();
    }
  }

  Future<UserModel?> getUserDetail(int id) async {
    setBusy(true);
    easyLoading.showLoading();
    try {
      var response = await httpService.get('table/user/$id');
      log.i('response : ${response.data}');
      MyModel myModel = MyModel.fromJson(response.data);
      return UserModel.fromJson(myModel.data);
    } catch (e) {
      log.e(e);
      return null;
    } finally {
      setBusy(false);
      easyLoading.dismiss();
      // return null;
    }
  }
}
