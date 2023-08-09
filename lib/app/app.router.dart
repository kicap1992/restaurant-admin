// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i10;
import 'package:flutter/material.dart';
import 'package:reza_admin/ui/views/admin_ui/admin_index_tracking/admin_index_tracking_view.dart'
    as _i4;
import 'package:reza_admin/ui/views/admin_ui/akun_admin/akun_admin_view.dart'
    as _i14;
import 'package:reza_admin/ui/views/admin_ui/makanan_list/add_edit_makanan/add_edit_makanan_view.dart'
    as _i6;
import 'package:reza_admin/ui/views/admin_ui/makanan_list/detail_makanan/detail_makanan_view.dart'
    as _i5;
import 'package:reza_admin/ui/views/admin_ui/makanan_list/makanan_list_view.dart'
    as _i12;
import 'package:reza_admin/ui/views/admin_ui/meja_list/meja_detail/meja_detail_view.dart'
    as _i7;
import 'package:reza_admin/ui/views/admin_ui/meja_list/meja_edit/meja_edit_view.dart'
    as _i8;
import 'package:reza_admin/ui/views/admin_ui/meja_list/meja_history_log/meja_history_log_view.dart'
    as _i9;
import 'package:reza_admin/ui/views/admin_ui/meja_list/meja_list_view.dart'
    as _i11;
import 'package:reza_admin/ui/views/admin_ui/pesanan_list/pesanan_list_view.dart'
    as _i13;
import 'package:reza_admin/ui/views/login_user/login_user_view.dart' as _i3;
import 'package:reza_admin/ui/views/splash_screen/splash_screen_view.dart'
    as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i15;

class Routes {
  static const splashScreenView = '/';

  static const loginUserView = '/login-user-view';

  static const adminIndexTrackingView = '/admin-index-tracking-view';

  static const detailMakananView = '/detail-makanan-view';

  static const addEditMakananView = '/add-edit-makanan-view';

  static const mejaDetailView = '/meja-detail-view';

  static const mejaEditView = '/meja-edit-view';

  static const mejaHistoryLogView = '/meja-history-log-view';

  static const all = <String>{
    splashScreenView,
    loginUserView,
    adminIndexTrackingView,
    detailMakananView,
    addEditMakananView,
    mejaDetailView,
    mejaEditView,
    mejaHistoryLogView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i2.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.loginUserView,
      page: _i3.LoginUserView,
    ),
    _i1.RouteDef(
      Routes.adminIndexTrackingView,
      page: _i4.AdminIndexTrackingView,
    ),
    _i1.RouteDef(
      Routes.detailMakananView,
      page: _i5.DetailMakananView,
    ),
    _i1.RouteDef(
      Routes.addEditMakananView,
      page: _i6.AddEditMakananView,
    ),
    _i1.RouteDef(
      Routes.mejaDetailView,
      page: _i7.MejaDetailView,
    ),
    _i1.RouteDef(
      Routes.mejaEditView,
      page: _i8.MejaEditView,
    ),
    _i1.RouteDef(
      Routes.mejaHistoryLogView,
      page: _i9.MejaHistoryLogView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
      );
    },
    _i3.LoginUserView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginUserView(),
        settings: data,
      );
    },
    _i4.AdminIndexTrackingView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.AdminIndexTrackingView(),
        settings: data,
      );
    },
    _i5.DetailMakananView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.DetailMakananView(),
        settings: data,
      );
    },
    _i6.AddEditMakananView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.AddEditMakananView(),
        settings: data,
      );
    },
    _i7.MejaDetailView: (data) {
      final args = data.getArgs<MejaDetailViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i7.MejaDetailView(key: args.key, mejaId: args.mejaId),
        settings: data,
      );
    },
    _i8.MejaEditView: (data) {
      final args = data.getArgs<MejaEditViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.MejaEditView(key: args.key, mejaId: args.mejaId),
        settings: data,
      );
    },
    _i9.MejaHistoryLogView: (data) {
      final args = data.getArgs<MejaHistoryLogViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i9.MejaHistoryLogView(key: args.key, mejaId: args.mejaId),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MejaDetailViewArguments {
  const MejaDetailViewArguments({
    this.key,
    required this.mejaId,
  });

  final _i10.Key? key;

  final String mejaId;

  @override
  String toString() {
    return '{"key": "$key", "mejaId": "$mejaId"}';
  }

  @override
  bool operator ==(covariant MejaDetailViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.mejaId == mejaId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ mejaId.hashCode;
  }
}

class MejaEditViewArguments {
  const MejaEditViewArguments({
    this.key,
    required this.mejaId,
  });

  final _i10.Key? key;

  final String mejaId;

  @override
  String toString() {
    return '{"key": "$key", "mejaId": "$mejaId"}';
  }

  @override
  bool operator ==(covariant MejaEditViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.mejaId == mejaId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ mejaId.hashCode;
  }
}

class MejaHistoryLogViewArguments {
  const MejaHistoryLogViewArguments({
    this.key,
    required this.mejaId,
  });

  final _i10.Key? key;

  final String mejaId;

  @override
  String toString() {
    return '{"key": "$key", "mejaId": "$mejaId"}';
  }

  @override
  bool operator ==(covariant MejaHistoryLogViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.mejaId == mejaId;
  }

  @override
  int get hashCode {
    return key.hashCode ^ mejaId.hashCode;
  }
}

class AdminIndexTrackingViewRoutes {
  static const mejaListView = '';

  static const makananListView = 'makanan-list-view';

  static const pesananListView = 'pesanan-list-view';

  static const akunAdminView = 'akun-admin-view';

  static const all = <String>{
    mejaListView,
    makananListView,
    pesananListView,
    akunAdminView,
  };
}

class AdminIndexTrackingViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.mejaListView,
      page: _i11.MejaListView,
    ),
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.makananListView,
      page: _i12.MakananListView,
    ),
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.pesananListView,
      page: _i13.PesananListView,
    ),
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.akunAdminView,
      page: _i14.AkunAdminView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i11.MejaListView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.MejaListView(),
        settings: data,
      );
    },
    _i12.MakananListView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.MakananListView(),
        settings: data,
      );
    },
    _i13.PesananListView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.PesananListView(),
        settings: data,
      );
    },
    _i14.AkunAdminView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.AkunAdminView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i15.NavigationService {
  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginUserView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginUserView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminIndexTrackingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDetailMakananView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.detailMakananView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddEditMakananView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addEditMakananView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMejaDetailView({
    _i10.Key? key,
    required String mejaId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mejaDetailView,
        arguments: MejaDetailViewArguments(key: key, mejaId: mejaId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMejaEditView({
    _i10.Key? key,
    required String mejaId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mejaEditView,
        arguments: MejaEditViewArguments(key: key, mejaId: mejaId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMejaHistoryLogView({
    _i10.Key? key,
    required String mejaId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mejaHistoryLogView,
        arguments: MejaHistoryLogViewArguments(key: key, mejaId: mejaId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedMejaListViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(AdminIndexTrackingViewRoutes.mejaListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedMakananListViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(AdminIndexTrackingViewRoutes.makananListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedPesananListViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(AdminIndexTrackingViewRoutes.pesananListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedAkunAdminViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(AdminIndexTrackingViewRoutes.akunAdminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginUserView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginUserView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAdminIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.adminIndexTrackingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDetailMakananView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.detailMakananView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddEditMakananView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addEditMakananView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMejaDetailView({
    _i10.Key? key,
    required String mejaId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.mejaDetailView,
        arguments: MejaDetailViewArguments(key: key, mejaId: mejaId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMejaEditView({
    _i10.Key? key,
    required String mejaId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.mejaEditView,
        arguments: MejaEditViewArguments(key: key, mejaId: mejaId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMejaHistoryLogView({
    _i10.Key? key,
    required String mejaId,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.mejaHistoryLogView,
        arguments: MejaHistoryLogViewArguments(key: key, mejaId: mejaId),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedMejaListViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(AdminIndexTrackingViewRoutes.mejaListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedMakananListViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(AdminIndexTrackingViewRoutes.makananListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedPesananListViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(AdminIndexTrackingViewRoutes.pesananListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedAkunAdminViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(AdminIndexTrackingViewRoutes.akunAdminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
