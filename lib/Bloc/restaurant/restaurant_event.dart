import 'package:equatable/equatable.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();

  @override
  List<Object> get props => [];
}

class FetchRestaurants extends RestaurantEvent {
  final String query;

  const FetchRestaurants({this.query});

  @override
  List<Object> get props => [query];
}