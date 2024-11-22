import 'package:flutter/material.dart';
import 'package:tourism_app/models/destination.dart';
import 'package:tourism_app/models/destinations.dart';
import 'package:tourism_app/services/local_service.dart';

class TourismProvider extends ChangeNotifier {
  final LocalService service;
  TourismProvider(this.service);

  LoadingState? state;
  List<Destination>? destination;

  void getTourismData() async {
    state = LoadingState.loading;
    notifyListeners();

    try {
      final destinations = await service.getDestinations() as Destinations;
      destination = destinations.destinations;

      state = LoadingState.loaded;
      notifyListeners();
    } catch (e) {
      state = LoadingState.error;
      notifyListeners();
    }
  }
}

enum LoadingState {
  loading,
  loaded,
  error;
}
