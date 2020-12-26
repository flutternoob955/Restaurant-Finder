import 'package:equatable/equatable.dart';

abstract class LocationQueryBlocEvent extends Equatable {
  const LocationQueryBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchLocation extends LocationQueryBlocEvent {
  final String query;

  const FetchLocation({this.query});

  @override
  List<Object> get props => [query];
}