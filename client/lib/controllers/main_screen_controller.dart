import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MainScreenController extends GetxController {
  static MainScreenController get to => Get.find();

  final _openModal = false.obs;

  get openModal => this._openModal.value;

  set openModal(value) => this._openModal.value = value;

  final _connectionStatus = 0.obs;

  get connectionStatus => _connectionStatus.value;

  set connectionStatus(value) => _connectionStatus.value = value;

  late StreamSubscription<InternetConnectionStatus> _listener;

  @override
  void onInit() {
    super.onInit();
    _listener = InternetConnectionChecker()
        .onStatusChange
        .listen((InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          connectionStatus = 1;
          break;
        case InternetConnectionStatus.disconnected:
          connectionStatus = 0;
          break;
      }
    });
  }

  // void refreshContent() {
  //   String date = GetStorage().read("prevDate");
  //   DateTime dateTime = DateTime.parse(date).toLocal();
  //   var currentDay = DateTime.now().day;

  //   if (dateTime.day != currentDay) {
  //     // Get.offNamed('/priority-task');
  //   }
  // }

  final _tabIndex = 0.obs;

  get tabIndex => this._tabIndex.value;

  set tabIndex(value) => this._tabIndex.value = value;

  @override
  void onReady() {
    super.onReady();
    // GetStorage().write("prevDate", DateTime.now().toUtc().toIso8601String());
  }

  void changeTabIndex(int index) {
    tabIndex = index;
  }

  @override
  void onClose() {
    super.onClose();
    _listener.cancel();
  }
}
