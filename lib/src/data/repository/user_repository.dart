import 'package:flutter_pjs_boilerplate/src/config/dio_mixin.dart';
import 'package:flutter_pjs_boilerplate/src/data/models/user_model_list.dart';

import '../models/user_model.dart';

class UserRepository with DioMixin {
  Future<UserModelList> fetchList() async {
    List<UserModel> list = [];

    final resp = await provideDio().get('/userMgmt/user');

    if (resp.data['total'] > 0) {
      for (var item in resp.data['rows']) {
        list.add(UserModel.fromJson(item['cell']));
      }
    }

    return UserModelList(list);
  }

  Future<void> create(UserModel userModel) async {
    await provideDio().post('/userMgmt/user', data: userModel);
  }

  Future<void> delete(String id) async {
    await provideDio().delete('/userMgmt/user/$id');
  }
}
