import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:restaurant_finder/DataLayer/restaurant.dart';
import '../bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {

  var _restaurants = <Restaurant>[];

  @override
  FavoriteState get initialState => FavoriteEmpty();

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {

    if (event is ToggleRestaurant) {
      if (_restaurants.contains(event.restaurant)) {
        _restaurants.remove(event.restaurant);
      } else {
        _restaurants.add(event.restaurant);
      }
    }

    final newRestaurants = [..._restaurants];
    yield FavoriteUpdated(restaurants: newRestaurants);
  }
}