import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:restaurant_finder/DataLayer/location.dart';
import 'package:restaurant_finder/DataLayer/zomato_client.dart';
import '../bloc.dart';

class LocationQueryBloc extends Bloc<LocationQueryBlocEvent, LocationQueryBlocState> {
  final _client = ZomatoClient();

  @override
  LocationQueryBlocState get initialState => LocationQueryEmpty();

  @override
  Stream<LocationQueryBlocState> mapEventToState(
    LocationQueryBlocEvent event,
  ) async* {
    yield LocationQueryLoading();

    if (event is FetchLocation) {
      List<Location> locations = await _client.fetchLocations(event.query);
      yield LocationQueryLoaded(locations: locations);
    }
    //TODO : implement error
  }
}
