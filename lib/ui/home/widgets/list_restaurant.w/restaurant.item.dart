import 'package:bloc_test/repository/models/restaurant.m.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/list_restaurant.bloc.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({Key? key, required this.item, required this.index}) : super(key: key);

  final Restaurant item;
  final int index;

  @override
  Widget build(BuildContext context) {
    print('RestaurantItem');
    return BlocBuilder<ListRestaurantBloc, ListRestaurantState>(
        buildWhen: (previous, current) => previous.list[index] != current.list[index],
        builder: (context, _) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 50,
            color: Colors.blueAccent,
            child: Text(item.name!, style: const TextStyle(color: Colors.white)),
          );
        });
  }
}
