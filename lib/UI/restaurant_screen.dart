import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_finder/Bloc/bloc.dart';
import 'package:restaurant_finder/UI/restaurant_tile.dart';
import '../DataLayer/location.dart';
import '../DataLayer/restaurant.dart';
import 'favorite_screen.dart';
import 'location_screen.dart';

class RestaurantScreen extends StatelessWidget {
  final Location location;

  RestaurantScreen({Key key, @required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => RestaurantBloc(location: location),
      child: Scaffold(
        appBar: AppBar(
          title: Text(location.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => FavoriteScreen())),
            )
          ],
        ),
        body: RestaurantSubScreen(location: location),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit_location),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LocationScreen(
                    isFullScreenDialog: true,
                  ),
              fullscreenDialog: true)),
        ),
      ),
    );
  }
}

class RestaurantSubScreen extends StatelessWidget {
  final Location location;

  const RestaurantSubScreen({Key key, @required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What do you want to eat?'),
            onChanged: (query) => BlocProvider.of<RestaurantBloc>(context)
                .add(FetchRestaurants(query: query)),
          ),
        ),
        Expanded(child: BlocBuilder<RestaurantBloc, RestaurantState>(
          builder: (context, state) {
            if (state is RestaurantLoaded) {
              final restaurants = state.restaurants;

              if (restaurants.isEmpty) {
                return Center(child: Text('No Results'));
              }

              if (restaurants == null) {
                return Center(
                    child: Text('Enter a restaurant name or cuisine type'));
              }
              return _buildSearchResults(restaurants);
            }
            return Center(
                child: Text('Enter a restaurant name or cuisine type'));
          },
        ))
      ],
    );
  }

  Widget _buildSearchResults(List<Restaurant> results) {
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        final restaurant = results[index];
        return RestaurantTile(restaurant: restaurant);
      },
    );
  }
}
