import 'package:bloc_test/ui/home/widgets/list_restaurant.w/bloc/list_restaurant.bloc.dart';
import 'package:bloc_test/ui/home/widgets/list_restaurant.w/list_restaurant_error.w.dart';
import 'package:bloc_test/ui/home/widgets/list_restaurant.w/list_restaurant_success.w.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListRestaurantWidget extends StatelessWidget {
  const ListRestaurantWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListRestaurantBloc, ListRestaurantState>(
        // buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
      return state.status.isSuccess
          ? ListRestaurantSuccessWidget(
              list: state.list,
            )
          : state.status.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.status.isError
                  ? const Center(
                      child: ListRestaurantErrorWidget(),
                    )
                  : const SizedBox();
    });
  }
}
