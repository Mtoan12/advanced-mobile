import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/models/user.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/router/app_router_constant.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = context.watch<AuthProvider>();

    if (authProvider.auth == null) {
      context.goNamed(AppRouterConstant.loginRouteName);
      return const SizedBox();
    }

    User user = authProvider.auth!.user;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
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
            title: GestureDetector(
              onTap: () {
                context.goNamed(AppRouterConstant.profileRouteName);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar!),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      child: Text(
                    user.name!.isNotEmpty ? user.name ?? '' : user.email ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  )),
                ],
              ),
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
          LinkWidget(context, Icons.settings, "Settings",
              AppRouterConstant.settingRouteName,
              isPush: true),
          LinkWidget(context, Icons.logout_outlined, "Logout", ''),
        ],
      ),
    );
  }

  Widget LinkWidget(
      BuildContext context, IconData icon, String title, String routeName,
      {bool? isPush = false}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
        size: 32,
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      onTap: () {
        if (routeName.isEmpty) {
          context.read<AuthProvider>().logout();
          context.goNamed(AppRouterConstant.loginRouteName);
          return;
        }

        if (isPush!) {
          context.pushNamed(routeName);
          return;
        }

        context.goNamed(routeName);
      },
    );
  }
}
