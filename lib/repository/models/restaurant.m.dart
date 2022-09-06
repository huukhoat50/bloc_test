class Restaurant {
  String id = "";
  String? name;
  String? address;
  String? description;
  String? phone;
  String? information;
  String? latitude;
  String? longitude;
  double? distance;
  bool? star;
  int? freeship;
  String? imageUrl;
  double? rating;
  int? totalReviews;
  String? frameUrl;
  // List<Food> foods = [];
  // List<Menu> menus = <Menu>[];
  String? operatingStatus;
  DateTime? reopenTime;
  // List<BusinessHours>? businessHours = [];
  int? totalOrders;
  // RestauranReviewSumaryM? restaurantReviewSumary;
  String? thumbnails;

  Restaurant({
    required this.id,
    this.name,
    this.address,
    this.description,
    this.phone,
    this.information,
    this.latitude,
    this.longitude,
    this.distance,
    this.star,
    this.freeship,
    this.imageUrl,
    this.rating,
    this.totalReviews,
    this.frameUrl,
    // this.foods = const [],
    // this.menus = const [],
    this.operatingStatus,
    this.reopenTime,
    // this.businessHours = const [],
    this.totalOrders,
    // this.restaurantReviewSumary,
    this.thumbnails,
  });

  Restaurant copyWith({
    String id = "",
    String? name,
    String? address,
    String? description,
    String? phone,
    String? information,
    String? latitude,
    String? longitude,
    double? distance,
    bool? star,
    int? freeship,
    String? imageUrl,
    double? rating,
    int? totalReviews,
    String? frameUrl,
    // List<Food> foods = const [],
    // List<Menu> menus = const [],
    String? operatingStatus,
    DateTime? reopenTime,
    // List<BusinessHours> businessHours = const [],
    int? totalOrders,
    // RestauranReviewSumaryM? restaurantReviewSumary,
    String? thumbnails,
  }) =>
      Restaurant(
        id: id,
        name: name ?? this.name,
        address: address ?? this.address,
        description: description ?? this.description,
        phone: phone ?? this.phone,
        information: information ?? this.information,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        distance: distance ?? this.distance,
        star: star ?? this.star,
        freeship: freeship ?? this.freeship,
        imageUrl: imageUrl ?? this.imageUrl,
        rating: rating ?? this.rating,
        totalReviews: totalReviews ?? this.totalReviews,
        frameUrl: frameUrl ?? this.frameUrl,
        // foods: foods.map((e) => e).toList(),
        // menus: menus.map((e) => e).toList(),
        operatingStatus: operatingStatus ?? this.operatingStatus,
        reopenTime: reopenTime ?? this.reopenTime,
        // businessHours: businessHours.map((e) => e.copyWith()).toList(),
        totalOrders: totalOrders ?? this.totalOrders,
        // restaurantReviewSumary: (restaurantReviewSumary?.copyWith()) ?? this.restaurantReviewSumary?.copyWith(),
        thumbnails: thumbnails ?? this.thumbnails,
      );

  Restaurant.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      name = jsonMap['name'];
      imageUrl = jsonMap['image'];
      address = jsonMap['address'];
      description = jsonMap['description'];
      phone = jsonMap['phone'];
      information = jsonMap['information'];
      latitude = jsonMap['latitude'];
      longitude = jsonMap['longitude'];
      star = jsonMap['star'];
      distance = jsonMap['distance'] != null ? double.parse(jsonMap['distance'].toString()) : 0.0;
      freeship = jsonMap['freeship'];
      rating = jsonMap['rating'] != null ? double.parse(jsonMap['rating'].toStringAsFixed(1)) : 0.0;
      totalReviews = jsonMap['total_reviews'];
      // foods = jsonMap['foods'] != null ? List.from(jsonMap['foods']).map((food) => Food.fromJSON(food)).toList() : [];
      // menus = jsonMap['menu'] != null ? List.from(jsonMap['menu']).map((_menu) => Menu.fromJSON(_menu)).toList() : [];
      frameUrl = jsonMap['frame'] != null ? jsonMap['frame']['frame_url'] : null;
      operatingStatus = jsonMap['operating_status'];
      reopenTime =
          jsonMap['reopen_time'] != null ? DateTime.parse(jsonMap['reopen_time']).add(const Duration(hours: 7)) : null;
      // businessHours = jsonMap['businessHours'] != null
      //     ? List.from(jsonMap['businessHours']).map((e) => BusinessHours.fromJSON(e)).toList()
      //     : [];
      totalOrders = jsonMap['total_orders'];
      // restaurantReviewSumary = jsonMap['restaurantReviewSumary'] != null
      //     ? RestauranReviewSumaryM.fromJson(jsonMap['restaurantReviewSumary'])
      //     : null;
      thumbnails = jsonMap['thumbnails'];
    } catch (e) {
      id = '';
      name = '';
      address = '';
      description = '';
      phone = '';
      information = '';
      latitude = '0';
      longitude = '0';
      distance = 0.0;

      print("Restaurant.fromJSON error ${e.toString()}");
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": imageUrl,
        // "restaurantReviewSumary": restaurantReviewSumary?.toJson(),
        "total_reviews": totalReviews,
        "address": address,
        "description": description,
        "phone": phone,
        "information": information,
        "latitude": latitude,
        "longitude": longitude,
        "rating": rating,
        "frame": frameUrl,
        "operating_status": operatingStatus,
        "total_orders": totalOrders,
        "thumbnails": thumbnails,
      };

  // String getImage() {
  //   try {
  //     if (thumbnails != null) {
  //       return getCacheImage(thumbnails!.trim());
  //     } else if (imageUrl != null) {
  //       return getCacheImage(imageUrl!.trim());
  //     }

  //     return "";
  //   } catch (e) {
  //     print('getImage restaurant error ${e.toString()}');
  //     return "";
  //   }
  // }

  String getAddressWithFormat() {
    try {
      if (address != null && address!.isNotEmpty) {
        return address!.trim();
      }

      return "";
    } catch (e) {
      print('getAddressWithFormat restaurant error ${e.toString()}');
      return "";
    }
  }

  // String getRestaurantName() {
  //   try {
  //     if (name != null && name!.isNotEmpty) {
  //       return name!.trim();
  //     }

  //     if (foods[0].restaurant?.name != null && foods[0].restaurant!.name!.isNotEmpty) {
  //       return foods[0].restaurant!.name!.trim();
  //     }

  //     return "";
  //   } catch (e) {
  //     print('getRestaurantName restaurant error ${e.toString()}');
  //     return "";
  //   }
  // }

  bool isValidLatLng() {
    try {
      return latitude != null && longitude != null && latitude!.isNotEmpty && longitude!.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
