import 'package:equatable/equatable.dart';
import 'package:restaurant_finder/DataLayer/restaurant.dart';

abstract class FavoriteEvent extends Equatable {

  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class ToggleRestaurant extends FavoriteEvent {
  final Restaurant restaurant;

  const ToggleRestaurant({this.restaurant});

  @override
  List<Object> get props => [restaurant];
}