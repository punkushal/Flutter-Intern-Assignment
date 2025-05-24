import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_intern_assignment/data/models/music_model.dart';
import 'package:flutter_intern_assignment/data/repositories/music_service_repository.dart';

enum HomeViewState { loading, loaded, error }

class HomeViewModel extends ChangeNotifier {
  final _repository = MusicServiceRepository();

  List<MusicModel> _services = [];
  HomeViewState _state = HomeViewState.loading;
  String _errorMessage = '';

  List<MusicModel> get services => _services;
  HomeViewState get state => _state;
  String get errorMessage => _errorMessage;

  Future<void> loadServices() async {
    try {
      _services = await _repository.getAllServices();
      _state = HomeViewState.loaded;
      _errorMessage = '';
    } catch (e) {
      _state = HomeViewState.error;
      _errorMessage = e.toString();
      log(_errorMessage);
    }
    notifyListeners();
  }
}
