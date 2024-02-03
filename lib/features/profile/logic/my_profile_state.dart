import 'package:equatable/equatable.dart';

import '../data/myprofile_data_model.dart';

abstract class MyProfileState extends Equatable {
  const MyProfileState();
  @override
  List<Object> get props => [];
}

//# initilize State
class MyProfileInitialState extends MyProfileState {}

//#Loading State
class MyProfileLoadingState extends MyProfileState {
  @override
  List<Object> get props => [];
}

//#Successful State
class MyProfileLoadedState extends MyProfileState {
  final MyProfileDataModel profiledata;
  final String phone;
  const MyProfileLoadedState({
    required this.profiledata,
    required this.phone,
  });

  @override
  List<Object> get props => [profiledata, phone];
}

//#unSuccessful State
class MyProfileLoadingUnsuccessfulState extends MyProfileState {
  final String message;
  const MyProfileLoadingUnsuccessfulState({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}
