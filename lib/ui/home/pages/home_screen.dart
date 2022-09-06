import 'package:bloc_test/repository/repos/filter.repository.dart';
import 'package:bloc_test/repository/services/filter.service.dart';
import 'package:bloc_test/ui/home/widgets/list_restaurant.w/bloc/list_restaurant.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => RestaurantRepository(services: RestaurantServices()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ListRestaurantBloc>(
              create: (context) => ListRestaurantBloc(
                restaurantRepository: context.read<RestaurantRepository>(),
              )..add(GetListRestaurantEvent()),
            ),
          ],
          child: const ListRestaurantLayout(),
        ),
      ),
    );
  }
}
