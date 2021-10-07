import 'package:flutter/material.dart';
import 'package:jobswire/model/model.dart';
import 'package:jobswire/service/api_manager.dart';

enum HomeState {
  Initial,
  Loading,
  Loaded,
  Error,
}

class JobModel extends ChangeNotifier {
  HomeState _homeState = HomeState.Initial;
  List<Model> jobs = [];
  String message = '';

  JobModel() {
    _fetchUsers();
  }

  HomeState get homeState => _homeState;

  Future<void> _fetchUsers() async {
    _homeState = HomeState.Loading;
    try {
      await Future.delayed(Duration(seconds: 5));
      final apijobs = await ApiManager.instance!.getAllModel();
      jobs = apijobs;
      _homeState = HomeState.Loaded;
    } catch (e) {
      message = '$e';
      _homeState = HomeState.Error;
    }
    notifyListeners();
  }
}
