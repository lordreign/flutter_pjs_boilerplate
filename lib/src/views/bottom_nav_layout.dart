import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../store/cubit/nav/bottom_nav_cubit.dart';
import '../widgets/app_bar_gone.dart';
import '../widgets/bottom_nav_bar.dart';
import 'home/index.dart';
import 'userMgmt/index.dart';

class BottomNavLayout extends StatelessWidget {
  const BottomNavLayout({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> pageNavigation = <Widget>[
      HomeIndex(),
      UserMgmtIndex(),
    ];

    return BlocProvider<BottomNavCubit>(
        create: (BuildContext context) => BottomNavCubit(),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const AppBarGone(),
          body: BlocBuilder<BottomNavCubit, int>(
            builder: (BuildContext context, int state) {
              return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: pageNavigation.elementAt(state));
            },
          ),
          bottomNavigationBar: const BottomNavBar(),
          backgroundColor: Theme.of(context).colorScheme.background,
        ));
  }
}
