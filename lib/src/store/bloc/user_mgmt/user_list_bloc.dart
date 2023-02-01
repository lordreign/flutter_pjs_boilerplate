import 'package:equatable/equatable.dart';
import 'package:flutter_pjs_boilerplate/src/data/repository/user_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../data/models/user_model.dart';
import '../../../data/models/user_model_list.dart';

part 'user_list_state.dart';
part 'user_list_event.dart';

class UserListBloc extends HydratedBloc<UserListEvent, UserListState> {
  final UserRepository _userRepo;

  UserListBloc({required UserRepository userRepo})
      : _userRepo = userRepo,
        super(const UserListLoaded(UserModelList([]))) {
    on<FetchUserList>(_onFetchList);
    on<CreateUser>(_onCreate);
    on<DeleteUser>(_onDelete);
  }

  Future<void> _onFetchList(
    FetchUserList event,
    Emitter<UserListState> emit,
  ) async {
    emit(const UserListLoading());
    // emit(state.copyWith(status: () => UserListStatus.loading));
    // // TODO respository call
    // // success;
    // await userRepo.fetchList();
    // emit(state.copyWith(status: () => UserListStatus.success));
    final UserModelList list = await _userRepo.fetchList();
    emit(UserListLoaded(list));
  }

  Future<void> _onCreate(
    CreateUser event,
    Emitter<UserListState> emit,
  ) async {
    emit(const UserListLoading());
    await _userRepo.create(UserModel(
      null,
      event.loginId,
      event.name,
    ));
    final UserModelList list = await _userRepo.fetchList();
    emit(UserListLoaded(list));
  }

  Future<void> _onDelete(
    DeleteUser event,
    Emitter<UserListState> emit,
  ) async {
    emit(const UserListLoading());
    await _userRepo.delete(event.id);
    final UserModelList list = await _userRepo.fetchList();
    emit(UserListLoaded(list));
  }

  @override
  UserListState? fromJson(Map<String, dynamic> json) {
    print(json['list']);
    // (json['list'] as List).map((e) => )
    final list = (json['list'] as List)
        .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return UserListLoaded(UserModelList(list));
  }

  @override
  Map<String, dynamic>? toJson(UserListState state) {
    if (state is UserListLoaded) {
      return {'list': state.list};
    }
    return null;
  }
}
