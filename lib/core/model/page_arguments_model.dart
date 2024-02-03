import 'package:my_task/features/profile/data/myprofile_data_model.dart';

class PageRouteArguments {
  final String? fromPage;
  final String? toPage;
  final List<dynamic>? datas;
  final String? title;
  final String? role;
  final bool? booL;
  final dynamic data;
  final MyProfileDataModel? myProfileDataModel;

  // final ? storeListModel;

  PageRouteArguments(
      {this.booL,
      this.myProfileDataModel,
      this.title,
      this.role,
      this.fromPage,
      this.toPage,
      this.datas,
      this.data});
}
