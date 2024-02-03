import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_task/core/common_widget/common_app_bar_with_back.dart';
import 'package:my_task/core/utils/app_colors.dart';
import 'package:my_task/features/profile/logic/my_profile_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/common_widget/common_app_exit_show_dialog.dart';
import '../../../profile/logic/my_profile_event.dart';
import '../../logic/trade_list_bloc/trade_list_bloc.dart';
import '../../logic/trade_list_bloc/trade_list_event.dart';
import '../../logic/trade_list_bloc/trade_list_state.dart';
import '../widget/app_bar.dart';
import '../widget/bottom_sheet_widget.dart';
import '../widget/dashboard_drawer.dart';
import '../widget/item_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<MyProfileBloc>(context)
        .add(MyProfileFetched(context: context));
    BlocProvider.of<TradeListBloc>(context)
        .add(TradeListFetchEvent(context: context));
    super.didChangeDependencies();
  }

  Future<void> _refreshIndicator() async {
    BlocProvider.of<MyProfileBloc>(context)
        .add(MyProfileFetched(context: context));
    BlocProvider.of<TradeListBloc>(context)
        .add(TradeListFetchEvent(context: context));
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return CommonOnWillPop(context: context, isToHome: false);
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: DashboardAppBar(
          showAction: true,
          height: 15.0.h,
          title: "Dashboaed", //"Store List",
          leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Icon(
                Icons.menu,
                size: 4.0.h,
                color: AppColors.white,
              ),
            ),
          ),
          onRefresh: () {
            BlocProvider.of<MyProfileBloc>(context)
                .add(MyProfileFetched(context: context));
            BlocProvider.of<TradeListBloc>(context)
                .add(TradeListFetchEvent(context: context));
          },
        ),
        drawer: const DashboardDrawer(),
        bottomSheet: BlocBuilder<TradeListBloc, TradeListState>(
          builder: (context, state) {
            if (state is TradeListSuccessful) {
              return BottomSheetWidget(total: state.total.toString());
            }
            return SizedBox();
          },
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return _refreshIndicator();
          },
          child: BlocBuilder<TradeListBloc, TradeListState>(
            builder: (context, state) {
              if (state is TradeListLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TradeListSuccessful) {
                return SingleChildScrollView(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.tradeListData.length,
                    itemBuilder: (context, index) {
                      return ItemList(
                        tradeListData: state.tradeListData[index],
                      );
                    },
                  ),
                );
              }
              return Center(
                child: Text("data"),
              );
            },
          ),
        ),
      ),
    );
  }
}
