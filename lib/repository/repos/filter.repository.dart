import 'package:bloc_test/repository/models/restaurant.m.dart';
import 'package:bloc_test/repository/services/filter.service.dart';

class RestaurantRepository {
  final RestaurantServices services;

  const RestaurantRepository({required this.services});

  Future<List<Restaurant>> getRestaurants({required int page, required int limit}) async =>
      services.getRestaurants(page: page, limit: limit);
}
