import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../store/cubit/nav/bottom_nav_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 1, right: 4, left: 4),
      elevation: 4,
      shadowColor: Theme.of(context).colorScheme.shadow,
      color: Theme.of(context).colorScheme.surfaceVariant,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: BlocBuilder<BottomNavCubit, int>(
          builder: (BuildContext context, int state) {
        return BottomNavigationBar(
          currentIndex: state,
          onTap: (int index) {
            context.read<BottomNavCubit>().updateIndex(index);
            // get current route name
            // ModalRoute.of(context).settings.name
            // String pageName = '/';
            // if (index == 1) {
            //   pageName
            // }
            // Navigator.pushNamed(context, indexPageName[0]);
          },
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Theme.of(context).textTheme.bodySmall!.color,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Ionicons.home_outline),
              label: tr('bottom_nav.first'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Ionicons.person_circle_outline),
              label: tr('bottom_nav.second'),
            ),
          ],
        );
      }),
    );
  }
}
