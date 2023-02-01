// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelList _$UserModelListFromJson(Map<String, dynamic> json) =>
    UserModelList(
      (json['list'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelListToJson(UserModelList instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
