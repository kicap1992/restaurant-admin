import 'package:reza_admin/app/app.logger.dart';

import '../../../../app/core/custom_base_view_model.dart';

class MejaListViewModel extends CustomBaseViewModel {
  final log = getLogger('MejaListViewModel');
  Future<void> init() async {
    globalVar.backPressed = 'exitApp';
  }
}
