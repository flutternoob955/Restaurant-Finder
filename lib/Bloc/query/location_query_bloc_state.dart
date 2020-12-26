import 'package:equatable/equatable.dart';
import 'package:restaurant_finder/DataLayer/location.dart';

abstract class LocationQueryBlocState extends Equatable {
  const LocationQueryBlocState();

  @override
  List<Object> get props => [];
}

class LocationQueryEmpty extends LocationQueryBlocState {}

class LocationQueryLoading extends LocationQueryBlocState {}

class LocationQueryLoaded extends LocationQueryBlocState {
  final List<Location> locations;

  const LocationQueryLoaded({this.locations}) : super();

  @override
  List<Object> get props => [locations];
}

class LocationQueryError extends LocationQueryBlocState {}
