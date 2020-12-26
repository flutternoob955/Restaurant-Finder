import 'package:equatable/equatable.dart';
import 'package:restaurant_finder/DataLayer/location.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class PushLocation extends LocationEvent {
  final Location location;

  const PushLocation({this.location});

  @override
  List<Object> get props => [location];
}