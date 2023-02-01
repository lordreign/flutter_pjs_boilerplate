import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pjs_boilerplate/src/data/repository/user_repository.dart';
import 'package:flutter_pjs_boilerplate/src/store/bloc/user_mgmt/user_list_bloc.dart';
import 'package:ionicons/ionicons.dart';

import 'widgets/create.dart';

class UserMgmtIndex extends StatelessWidget {
  const UserMgmtIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserListBloc>(
      create: (context) => UserListBloc(
        userRepo: UserRepository(),
      )..add(const FetchUserList()),
      child: Material(
        child: BlocBuilder<UserListBloc, UserListState>(
          builder: (BuildContext context, state) {
            if (state is UserListLoaded) {
              return ListView(
                children: [
                  for (var item in state.list.list)
                    Card(
                      elevation: 2,
                      shadowColor: Theme.of(context).colorScheme.shadow,

                      /// Example: Many items have their own colors inside of the ThemData
                      /// You can overwrite them in [config/theme.dart].
                      color: Theme.of(context).colorScheme.surface,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: ListTile(
                        // onTap: _launchUrl,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        trailing: FloatingActionButton(
                          onPressed: () async {
                            final result = await showDialog<bool>(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('삭제'),
                                  content: const Text('삭제할꺼에요???'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('CANCEL'),
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('CONFIRM'),
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                        // BlocProvider.of<UserListBloc>(context)
                                      },
                                    )
                                  ],
                                );
                              },
                            );

                            if (result == true) {
                              // ignore: use_build_context_synchronously
                              context
                                  .read<UserListBloc>()
                                  .add(DeleteUser('${item.id}'));
                            }
                          },
                          backgroundColor: Colors.red,
                          child: const Icon(
                            Ionicons.remove_circle_outline,
                          ),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'id: ${item.id}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(fontWeightDelta: 2),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'name: ${item.name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(fontWeightDelta: 2),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'loginId: ${item.loginId}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .apply(fontWeightDelta: 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: FloatingActionButton(
                          onPressed: () async {
                            // https://blog.codefactory.ai/flutter/form/
                            // 여기 참고 필요....
                            final result =
                                await showDialog<Map<String, dynamic>>(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  title: Text('등록'),
                                  content: Create(),
                                );
                              },
                            );

                            if (result != null || result?['result'] == true) {
                              // ignore: use_build_context_synchronously
                              context.read<UserListBloc>().add(CreateUser(
                                    result?['loginId'] as String,
                                    result?['name'] as String,
                                  ));
                            }
                          },
                          child: const Icon(Ionicons.pencil_outline),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }

            return const Center(
              child: Text('Loading 중...'),
            );
          },
        ),
      ),
    );
  }
}
