import 'package:bloc_test/repository/models/restaurant.m.dart';
import 'package:bloc_test/ui/home/widgets/list_restaurant.w/restaurant.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/list_restaurant.bloc.dart';

class ListRestaurantSuccessWidget extends StatefulWidget {
  const ListRestaurantSuccessWidget({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<Restaurant> list;

  @override
  State<ListRestaurantSuccessWidget> createState() => _ListRestaurantSuccessWidgetState();
}

class _ListRestaurantSuccessWidgetState extends State<ListRestaurantSuccessWidget> {
  ScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();

    scrollController?.dispose();
  }

  Future<void> _scrollListener() async {
    if (scrollController!.position.pixels == scrollController!.position.maxScrollExtent) {
      context.read<ListRestaurantBloc>().add(LoadMoreListRestaurantEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          // AspectRatio(
          //   aspectRatio: 2,
          //   child: Container(
          //     color: Colors.white,
          //     width: double.infinity,
          //     child: CachedNetworkImage(
          //       imageUrl: item.image,
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            width: 30,
            height: 2,
            color: Colors.grey,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "item.desc!",
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          // const VillDividerSpace(
          //   height: 2,
          // ),
          // Container(
          //   height: 60.h,
          //   padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 12.w),
          //   child: Row(
          //     children: [
          //       Text("Lọc:  ",
          //           style:
          //               TextStyle(fontSize: ScreenUtil().setSp(16), fontWeight: FontWeight.w500, color: Colors.black)),
          //       ListView.separated(
          //         separatorBuilder: (context, index) => const SizedBox(
          //           width: 6,
          //         ),
          //         itemCount: _.listFilters.length,
          //         shrinkWrap: true,
          //         scrollDirection: Axis.horizontal,
          //         itemBuilder: (context, index) {
          //           var item = _.listFilters[index];

          //           return FilterRestaurantItem(
          //             item: item,
          //             onTap: () {
          //               if (_.canClickFilter) {
          //                 _.toggleItemFilter(item);
          //               }
          //             },
          //           );
          //         },
          //       )
          //     ],
          //   ),
          // ),
          // const VillDividerSpace(
          //   height: 2,
          // ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            separatorBuilder: (context, index) => const Divider(height: 0, thickness: 0.4),
            itemCount: widget.list.length,
            itemBuilder: (context, index) {
              var item = widget.list[index];

              return RestaurantItem(
                item: item,
                index: index,
              );
            },
          ),
          // const LoadMoreWidget(),
        ],
      ),
    );
  }
}
