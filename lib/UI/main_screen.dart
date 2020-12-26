import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_finder/Bloc/bloc.dart';
import 'package:restaurant_finder/UI/restaurant_screen.dart';
import 'location_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(builder: (context, state) {
      if (state is LocationPushed) {
        final location = state.location;
        return RestaurantScreen(location: location);
      }
      return LocationScreen();
    });
  }
}
