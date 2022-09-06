import 'package:bloc_test/repository/models/restaurant.m.dart';
import 'package:dio/dio.dart';

class RestaurantServices {
  RestaurantServices();

  Future<List<Restaurant>> getRestaurants({required int page, required int limit}) async {
    Map<String, dynamic> headers = {
      'X-Province': "1",
    };

    Map<String, dynamic> params = {
      'page': page,
      'limit': limit,
      'myLat': "11.560497",
      'myLon': "107.81512768",
    };

    params['orderBy'] = "geo_distance";

    var response = await Dio().get("https://api.dev.villship.com/api/restaurants/V2/search",
        queryParameters: params, options: Options(headers: headers));

    return List.from(response.data["data"]).map((e) => Restaurant.fromJSON(e)).toList();
  }
}
