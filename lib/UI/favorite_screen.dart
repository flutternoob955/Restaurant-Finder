import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_finder/Bloc/bloc.dart';
import 'package:restaurant_finder/UI/restaurant_tile.dart';

class FavoriteScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(

      builder: (context, state) {

          if (state is FavoriteUpdated) {
            final favorites = state.restaurants;

            if (favorites == null || favorites.isEmpty) {
              return Center(child: Text('No Favorites'));
            }

            return ListView.separated(
              itemCount: favorites.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final restaurant = favorites[index];
                return RestaurantTile(restaurant: restaurant);
              },
            );
          }
          return Center(child: Text('No Favorites'));
        }
      ),

      /*body: StreamBuilder<List<Restaurant>>(
        stream: bloc.favoritesStream,
        // 1
        initialData: bloc.favorites,
        builder: (context, snapshot) {
          // 2
          List<Restaurant> favorites =
          (snapshot.connectionState == ConnectionState.waiting)
              ? bloc.favorites
              : snapshot.data;

          if (favorites == null || favorites.isEmpty) {
            return Center(child: Text('No Favorites'));
          }

          return ListView.separated(
            itemCount: favorites.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final restaurant = favorites[index];
              return RestaurantTile(restaurant: restaurant);
            },
          );
        },
      ),*/
    );
  }
}
