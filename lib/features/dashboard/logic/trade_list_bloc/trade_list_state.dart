// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../data/trade_list_data_model.dart';

abstract class TradeListState extends Equatable {
  const TradeListState();
}

class TradeListInitial extends TradeListState {
  @override
  List<Object> get props => [];
}

class TradeListLoading extends TradeListState {
  @override
  List<Object> get props => [];
}

class TradeListSuccessful extends TradeListState {
  final List<TradeListDataModel> tradeListData;
  final double total;

  TradeListSuccessful({required this.tradeListData, required this.total});

  @override
  List<Object> get props => [tradeListData, total];
}

class TradeListUnsuccessful extends TradeListState {
  final String message;

  const TradeListUnsuccessful({
    required this.message,
  });
  @override
  List<Object> get props => [
        message,
      ];
}
