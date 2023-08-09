import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';
import '../../../../services/global_var.dart';

class AdminIndexTrackingViewModel extends IndexTrackingViewModel {
  final log = getLogger('AdminIndexTrackingViewModel');
  final globalVar = locator<GlobalVar>();
  final navigationService = locator<NavigationService>();

  final _bottomNavBarList = [
    {
      'name': 'Meja',
      'icon': Icons.table_restaurant_outlined,
      'header': 'RESERVASI MEJA',
    },
    {
      'name': 'Makanan',
      'icon': Icons.food_bank_outlined,
      'header': 'LIST MAKANAN',
    },
    {
      'name': 'Pesanan',
      'icon': Icons.shopping_cart_outlined,
      'header': 'LIST PESANAN',
    },
    {
      'name': 'Akun',
      'icon': Icons.person_outline,
      'header': 'AKUN',
    },
  ];

  String header = 'RESERVASI MEJA';

  List<Map<String, dynamic>> get bottomNavBarList => _bottomNavBarList;

  final List<String> _views = [
    AdminIndexTrackingViewRoutes.mejaListView,
    AdminIndexTrackingViewRoutes.makananListView,
    AdminIndexTrackingViewRoutes.pesananListView,
    AdminIndexTrackingViewRoutes.akunAdminView,
  ];

  Future<void> init() async {
    globalVar.backPressed = 'exitApp';
  }

  void handleNavigation(int index) {
    // log.d("handleNavigation: $index");
    // log.d("currentIndex: $currentIndex");

    if (currentIndex == index) return;

    setIndex(index);
    header = _bottomNavBarList[index]['header'] as String;
    navigationService.navigateTo(
      _views[index],
      id: 2,
    );
  }
}
