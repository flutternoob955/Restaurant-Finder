import 'dart:async';
import 'package:bloc/bloc.dart';
import '../bloc.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  @override
  LocationState get initialState => LocationEmpty();

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is PushLocation) {
      yield LocationPushed(location: event.location);
    }
  }
}
