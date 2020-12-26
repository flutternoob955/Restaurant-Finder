import 'package:equatable/equatable.dart';
import 'package:restaurant_finder/DataLayer/location.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationEmpty extends LocationState {}

class LocationPushed extends LocationState {
  final Location location;

  const LocationPushed({this.location}) : super();

  @override
  List<Object> get props => [location];
}