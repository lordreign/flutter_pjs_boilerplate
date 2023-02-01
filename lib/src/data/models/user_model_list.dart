import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_model.dart';

part 'user_model_list.g.dart';

@JsonSerializable()
class UserModelList extends Equatable {
  final List<UserModel> list;
  const UserModelList(this.list);

  factory UserModelList.fromJson(Map<String, dynamic> json) =>
      _$UserModelListFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelListToJson(this);

  @override
  List<Object?> get props => [list];
}
