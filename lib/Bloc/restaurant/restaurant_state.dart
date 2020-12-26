import 'package:equatable/equatable.dart';
import 'package:restaurant_finder/DataLayer/restaurant.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantEmpty extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {
  final List<Restaurant> restaurants;

  const RestaurantLoaded({this.restaurants}) : super();

  @override
  List<Object> get props => [restaurants];
}

class RestaurantError extends RestaurantState {}