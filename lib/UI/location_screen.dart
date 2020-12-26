import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../DataLayer/location.dart';
import 'package:restaurant_finder/Bloc/bloc.dart';

class LocationScreen extends StatelessWidget {
  final bool isFullScreenDialog;
  const LocationScreen({Key key, this.isFullScreenDialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationQueryBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('Where do you want to eat?')),
        body: LocationSubScreen(isFullScreenDialog: isFullScreenDialog),
      ),
    );
  }
}


class LocationSubScreen extends StatelessWidget {
  final bool isFullScreenDialog;
  const LocationSubScreen({Key key, this.isFullScreenDialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter a location'),
            onChanged: (query) => BlocProvider.of<LocationQueryBloc>(context)
                .add(FetchLocation(query: query)),
          ),
        ),
        Expanded(
          child: _buildResults(),
        )
      ],
    );
  }

  Widget _buildResults() {
    return BlocBuilder<LocationQueryBloc, LocationQueryBlocState>(
        builder: (context, state) {
      if (state is LocationQueryLoaded) {
        final locations = state.locations;

        if (locations == null) {
          return Center(child: Text('Enter a location'));
        }

        if (locations.isEmpty) {
          return Center(child: Text('No Results'));
        }

        return _buildSearchResults(locations);
      }
      return Center(child: Text('Enter a location'));
    });
  }

  Widget _buildSearchResults(List<Location> locations) {
    return ListView.separated(
      itemCount: locations.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        final location = locations[index];
        return ListTile(
          title: Text(location.title),
          onTap: () {
              BlocProvider.of<LocationBloc>(context).add(PushLocation(location: location));
              if (isFullScreenDialog) {
                Navigator.of(context).pop();
              }
          },
        );
      },
    );
  }
}
