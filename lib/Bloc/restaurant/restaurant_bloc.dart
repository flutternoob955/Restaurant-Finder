import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:restaurant_finder/DataLayer/location.dart';
import 'package:restaurant_finder/DataLayer/restaurant.dart';
import 'package:restaurant_finder/DataLayer/zomato_client.dart';
import '../bloc.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final Location location;
  final _client = ZomatoClient();

  RestaurantBloc({this.location});

  @override
  RestaurantState get initialState => RestaurantEmpty();

  @override
  Stream<RestaurantState> mapEventToState(
    RestaurantEvent event,
  ) async* {
    yield RestaurantLoading();

    if (event is FetchRestaurants) {
      List<Restaurant> restaurants = await _client.fetchRestaurants(location, event.query);
      yield RestaurantLoaded(restaurants: restaurants);
    }
    //TODO : implement error
  }
}