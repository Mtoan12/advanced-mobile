import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/router/app_router_constant.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();

    if (authProvider.user == null) {
      context.goNamed(AppRouterConstant.loginRouteName);
    }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'LetTutor',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/250?image=9'),
                ),
                SizedBox(width: 8),
                Expanded(child: Text(authProvider.user!.email)),
              ],
            ),
            onTap: () {
              context.goNamed(AppRouterConstant.teachersListRouteName);
            },
          ),
          LinkWidget(context, Icons.group_outlined, "Tutor",
              AppRouterConstant.teachersListRouteName),
          LinkWidget(context, Icons.event_available_outlined, "Schedule",
              AppRouterConstant.scheduleRouteName),
          LinkWidget(context, Icons.history_outlined, "History",
              AppRouterConstant.historyRouteName),
          LinkWidget(context, Icons.school_outlined, "Courses",
              AppRouterConstant.coursesRouteName),
          LinkWidget(context, Icons.logout_outlined, "Logout",
              AppRouterConstant.coursesRouteName),
        ],
      ),
    );
  }

  Widget LinkWidget(
      BuildContext context, IconData icon, String title, String routeName) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      onTap: () {
        context.goNamed(routeName);
      },
    );
  }
}
