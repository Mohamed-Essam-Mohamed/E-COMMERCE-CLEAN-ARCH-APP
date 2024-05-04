import 'package:e_commerce/src/feature/home/view/widget/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => ProductItem(
        pathImage: 'assets/image/item_2.png',
        descriptionImage: 'Xiaomi Redmi Watch 2 Lite 5ATM',
        price: 'EGP 1,800',
        onTapLove: () {},
        onTapAddCard: () {},
      ),
      itemCount: 10,
      separatorBuilder: (context, index) => Gap(10.w),
    );
  }
}
