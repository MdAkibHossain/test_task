import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class MyProfileEvent extends Equatable {
  const MyProfileEvent();
}

class MyProfileFetched extends MyProfileEvent {
  final BuildContext context;
  const MyProfileFetched({required this.context});
  @override
  List<Object?> get props => [context];
}
