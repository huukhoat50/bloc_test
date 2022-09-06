part of 'list_restaurant.bloc.dart';

enum ListRestaurantStatus { initial, success, error, loading }

extension ListRestaurantStatusX on ListRestaurantStatus {
  bool get isInitial => this == ListRestaurantStatus.initial;
  bool get isSuccess => this == ListRestaurantStatus.success;
  bool get isError => this == ListRestaurantStatus.error;
  bool get isLoading => this == ListRestaurantStatus.loading;
}

class ListRestaurantState extends Equatable {
  const ListRestaurantState({
    this.status = ListRestaurantStatus.initial,
    List<Restaurant>? list,
    int? page,
    int? limit,
  }) : list = list ?? const <Restaurant>[];

  final List<Restaurant> list;
  final ListRestaurantStatus status;
  final limit = 10;
  final page = 1;

  @override
  List<Object?> get props => [status, list, limit, page];

  ListRestaurantState copyWith({
    ListRestaurantStatus? status,
    List<Restaurant>? list,
    int? page,
    int? limit,
  }) {
    return ListRestaurantState(
      status: status ?? this.status,
      list: list ?? this.list,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }
}
