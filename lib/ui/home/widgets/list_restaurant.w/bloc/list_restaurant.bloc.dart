import 'package:bloc_test/repository/models/restaurant.m.dart';
import 'package:bloc_test/repository/repos/filter.repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_restaurant.event.dart';
part 'list_restaurant.state.dart';

class ListRestaurantBloc extends Bloc<ListRestaurantEvent, ListRestaurantState> {
  ListRestaurantBloc({
    required this.restaurantRepository,
  }) : super(const ListRestaurantState()) {
    on<GetListRestaurantEvent>(_mapGetListRestaurantEventToState);
    on<LoadMoreListRestaurantEvent>(_mapLoadMoreListRestaurantEventToState);
  }

  final RestaurantRepository restaurantRepository;

  void _mapGetListRestaurantEventToState(GetListRestaurantEvent event, Emitter<ListRestaurantState> emit) async {
    try {
      emit(state.copyWith(status: ListRestaurantStatus.loading));

      final list = await restaurantRepository.getRestaurants(page: state.page, limit: state.limit);
      emit(state.copyWith(status: ListRestaurantStatus.success, list: list, page: state.page + 1, limit: 10));
    } catch (e) {
      emit(state.copyWith(status: ListRestaurantStatus.error));
    }
  }

  void _mapLoadMoreListRestaurantEventToState(
      LoadMoreListRestaurantEvent event, Emitter<ListRestaurantState> emit) async {
    try {
      // emit(state.copyWith(status: ListRestaurantStatus.loading));

      final list = await restaurantRepository.getRestaurants(page: state.page, limit: state.limit);
      emit(state.copyWith(status: ListRestaurantStatus.success, list: [...state.list, ...list], page: state.page + 1));
      // emit(state.copyWith(status: ListRestaurantStatus.success, list: list));
    } catch (e) {
      emit(state.copyWith(status: ListRestaurantStatus.error));
    }
  }
}
