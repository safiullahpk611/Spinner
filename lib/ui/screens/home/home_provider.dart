import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:spinzy/core/enums/view_state.dart';
import 'package:spinzy/core/models/base_view_model.dart';
import 'package:spinzy/core/models/proposal-model.dart';
import 'package:spinzy/core/services/database_services.dart';

import '../web_view/web_view.dart';

bool onEnd = false;

class HomeScreenProvider extends BaseViewModal {
  Stream<QuerySnapshot>? stream;
  final StreamController dividerController = StreamController<int>();
  List<LinkAddress> bloodPressureList = [];
  final wheelNotifier = StreamController<double>();
  final databaseServices = DatabaseServices();
  bool inmated = false;
  StreamController<int> selected = StreamController.broadcast();

  LinkAddress linkAddress = LinkAddress();

  // StreamController<int> selected = StreamController<int>();
  HomeScreenProvider() {
    initData();
  }
  initData() {
    linkAddress =
        LinkAddress(prizeItems: ["0", "0", "0", "0", "0", "0", "0", "0"]);

    getLinkData();

    notifyListeners();
  }


  final items = <String>[
    '10 \$',
    'Zero',
    '100\$',
    '15\$',
    '90\$',
    '25\$',
    '70\$',
    'Ahoka',
  ];
  void onAnimatedStart() {
    inmated = false;
    notifyListeners();
  }

  void onAnimatedEnd() {
    inmated = true;
    notifyListeners();
  }

  ///
  /// adding elemnt to furtune list
  ///
  void addItemToFortune() {
    selected.add(Fortune.randomInt(0, items.length));
    notifyListeners();
  }

  bool check = false;

  onWeelStop(val) async {
    dividerController.add;
    onEnd = true;
    notifyListeners();
  }

  onEndfun(val) {
    onEnd = val;
    notifyListeners();
  }

  onWheelUpdate(val) {
    onEnd = false;
    notifyListeners();
  }

  bool isLoading = false;
  getLinkData() async {
    setState(ViewState.busy);
    stream = await databaseServices.getLinkAdress();

    // getWeeklyWeight(locateUser.appUser.appUserId.toString());
    stream!.listen((event) {
      if (event.docs.length > 0) {
        print(
            "total length of bloodPressure :: " + event.docs.length.toString());

        event.docs.forEach((element) {
          print(element.data());

          LinkAddress.fromJson(element, element.id);

          linkAddress = LinkAddress.fromJson(element, element.id);

          linkAddress.prizeItems!;

          setState(ViewState.idle);

          notifyListeners();
        });
      }
    });
  }
}
