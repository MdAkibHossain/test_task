import 'package:equatable/equatable.dart';

abstract class LogInEvent extends Equatable {
  const LogInEvent();
}

// login ///

class LoginEvent extends LogInEvent {
  final String userId;
  final String password;

  LoginEvent({
    required this.userId,
    required this.password,
  });
  @override
  List<Object?> get props => [userId, password];
}
