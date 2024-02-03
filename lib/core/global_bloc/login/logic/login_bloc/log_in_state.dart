// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../data/user_info_model.dart';

abstract class LogInState extends Equatable {
  const LogInState();
}

class LogInInitial extends LogInState {
  @override
  List<Object> get props => [];
}

class LogInLoading extends LogInState {
  @override
  List<Object> get props => [];
}

class LogInSuccessful extends LogInState {
  final String? token;

  LogInSuccessful({required this.token});

  @override
  List<Object> get props => [token!];
}

class LogInUnsuccessful extends LogInState {
  final String message;

  const LogInUnsuccessful({
    required this.message,
  });
  @override
  List<Object> get props => [
        message,
      ];
}
