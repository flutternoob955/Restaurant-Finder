import '../DataLayer/location.dart';
import 'bloc.dart';
import 'dart:async';

class LocationBloc implements Bloc {
  Location _location;
  Location get selectedLocation => _location;

  final _locationController = StreamController<Location>();
  Stream<Location> get locationStream => _locationController.stream;

  void selectLocation(Location location) {
    _location = location;
    _locationController.sink.add(location);
  }

  // 4
  @override
  void dispose() {
    _locationController.close();
  }
}