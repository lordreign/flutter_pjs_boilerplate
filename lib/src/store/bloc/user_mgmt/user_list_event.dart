part of 'user_list_bloc.dart';

abstract class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object?> get props => [];
}

class FetchUserList extends UserListEvent {
  const FetchUserList();
}

class CreateUser extends UserListEvent {
  final String loginId, name;
  const CreateUser(this.loginId, this.name);

  @override
  List<Object?> get props => [loginId, name];
}

class DeleteUser extends UserListEvent {
  final String id;

  const DeleteUser(this.id);

  @override
  List<Object?> get props => [id];
}
