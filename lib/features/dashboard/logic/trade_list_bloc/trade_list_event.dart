import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class TradeListEvent extends Equatable {
  const TradeListEvent();
}

class TradeListFetchEvent extends TradeListEvent {
  final BuildContext context;
  TradeListFetchEvent({required this.context});
  @override
  List<Object?> get props => [context];
}
