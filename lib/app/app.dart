import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';

import '../services/global_var.dart';
import '../services/http_services.dart';
import '../services/my_easyloading.dart';
import '../services/other_function.dart';
import '../ui/views/admin_ui/admin_index_tracking/admin_index_tracking_view.dart';
import '../ui/views/admin_ui/akun_admin/akun_admin_view.dart';
import '../ui/views/admin_ui/makanan_list/add_edit_makanan/add_edit_makanan_view.dart';
import '../ui/views/admin_ui/makanan_list/detail_makanan/detail_makanan_view.dart';
import '../ui/views/admin_ui/makanan_list/makanan_list_view.dart';
import '../ui/views/admin_ui/meja_list/meja_detail/meja_detail_view.dart';
import '../ui/views/admin_ui/meja_list/meja_edit/meja_edit_view.dart';
import '../ui/views/admin_ui/meja_list/meja_history_log/meja_history_log_view.dart';
import '../ui/views/admin_ui/meja_list/meja_list_view.dart';
import '../ui/views/admin_ui/pesanan_list/pesanan_list_view.dart';
import '../ui/views/login_user/login_user_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: LoginUserView),
    MaterialRoute(
      page: AdminIndexTrackingView,
      // fullscreenDialog: true,
      children: [
        MaterialRoute(page: MejaListView, initial: true),
        MaterialRoute(page: MakananListView),
        MaterialRoute(page: PesananListView),
        MaterialRoute(page: AkunAdminView),
      ],
    ),
    MaterialRoute(page: DetailMakananView),
    MaterialRoute(page: AddEditMakananView),
    MaterialRoute(page: MejaDetailView),
    MaterialRoute(page: MejaEditView),
    MaterialRoute(page: MejaHistoryLogView),
  ],
  // dialogs: [
  //   StackedDialog(classType: AddSiswaDialogView),
  // ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    //

    LazySingleton(classType: MyEasyLoading),
    LazySingleton(classType: MyHttpServices),
    LazySingleton(classType: OtherFunction),
    LazySingleton(classType: GlobalVar),
  ],
  logger: StackedLogger(),
)
class App {}
