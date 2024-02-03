import 'package:flutter/material.dart';
import 'package:my_task/features/dashboard/data/trade_list_data_model.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/model/page_arguments_model.dart';
import '../../../../../route_name.dart';
import '../../../../core/utils/app_colors.dart';

class ItemList extends StatefulWidget {
  const ItemList({
    Key? key,
    required this.tradeListData,
  }) : super(key: key);

  final TradeListDataModel? tradeListData;

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 1.0.h),
      margin: EdgeInsets.only(left: 3.0.w, right: 3.0.w, top: 1.0.h),

      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.tradeListData!.symbol ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 21),
                        ),
                        Text(
                          "${"Current Price"}: ${widget.tradeListData!.currentPrice}",
                          style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Color(0XFF676767),
                              fontSize: 13),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${"Open Price"}: ${widget.tradeListData!.openPrice}",
                            maxLines: 1,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.normal,
                                color: Color(0XFF676767),
                                fontSize: 12),
                          ),
                        ),
                        Text(
                          "${"Profit"}: ${widget.tradeListData!.profit}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.dsrmain,
                              fontSize: 11.sp),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
