import 'package:equatable/equatable.dart';
import 'package:restaurant_finder/DataLayer/restaurant.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteEmpty extends FavoriteState {}

class FavoriteUpdated extends FavoriteState {
  final List<Restaurant> restaurants;

  const FavoriteUpdated({this.restaurants}) : super();

  @override
  List<Object> get props => [restaurants];

}