part of 'user_list_bloc.dart';

// enum UserListStatus { initial, loading, success, failure }

// class UserListState extends Equatable {
//   const UserListState({
//     this.status = UserListStatus.initial,
//     this.list = const [],
//   });

//   final UserListStatus status;
//   final List<UserModel> list;

//   UserListState copyWith({
//     UserListStatus Function()? status,
//     List<UserModel> Function()? list,
//   }) {
//     return UserListState(
//       status: status != null ? status() : this.status,
//       list: list != null ? list() : this.list,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         status,
//         list,
//       ];
// }

abstract class UserListState extends Equatable {
  const UserListState();
}

class UserListLoading extends UserListState {
  const UserListLoading();

  @override
  List<Object?> get props => [];
}

class UserListLoaded extends UserListState {
  final UserModelList list;
  const UserListLoaded(this.list);

  @override
  List<Object?> get props => [list];
}

class UserListError extends UserListState {
  final String message;
  const UserListError(this.message);

  @override
  List<Object?> get props => [];
}
