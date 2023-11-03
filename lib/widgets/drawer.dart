import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/router/app_router_constant.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Tutor'),
            onTap: () {
              context.goNamed(AppRouterConstant.teachersListRouteName);
            },
          ),
          ListTile(
            title: const Text('Schedule'),
            onTap: () {
              context.goNamed(AppRouterConstant.scheduleRouteName);
            },
          ),
          ListTile(
            title: const Text('History'),
            onTap: () {
              context.goNamed(AppRouterConstant.historyRouteName);
            },
          ),
          ListTile(
            title: const Text('Courses'),
            onTap: () {
              context.goNamed(AppRouterConstant.coursesRouteName);
            },
          ),
        ],
      ),
    );
  }
}
