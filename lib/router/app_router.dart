import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/router/app_router_constant.dart';
import 'package:lettutor/screens/course_detail_screen/course_detail_screen.dart';
import 'package:lettutor/screens/courses_screen/courses_screen.dart';
import 'package:lettutor/screens/history_screen/history_screen.dart';
import 'package:lettutor/screens/lesson_detail_screen/lesson_detail_screen.dart';
import 'package:lettutor/screens/login_screen/login_screen.dart';
import 'package:lettutor/screens/register_screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:lettutor/screens/register_screen/register_screen.dart';
import 'package:lettutor/screens/schedule_screen/schedule_screen.dart';
import 'package:lettutor/screens/teacher_detail_screen/teacher_detail_screen.dart';
import 'package:lettutor/screens/teachers_list_screen/teachers_list_screen.dart';
import 'package:lettutor/screens/video_call_screen/video_call_screen.dart';

class AppRouter {
  AuthProvider authProvider;

  AppRouter(this.authProvider);
  GoRouter router = GoRouter(
      // redirect: (BuildContext context, GoRouterState state) {
      //   if (authProvider.user != null) {
      //     return '/';
      //   } else {
      //     return null;
      //   }
      // },
      routes: [
        GoRoute(
          name: AppRouterConstant.loginRouteName,
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage(child: LoginScreen());
          },
        ),
        GoRoute(
          name: AppRouterConstant.registerRouteName,
          path: '/register',
          pageBuilder: (context, state) {
            return MaterialPage(child: RegisterScreen());
          },
        ),
        GoRoute(
          name: AppRouterConstant.forgotPasswordRouteName,
          path: '/forgot-password',
          pageBuilder: (context, state) {
            return MaterialPage(child: ForgotPasswordScreen());
          },
        ),
        GoRoute(
          name: AppRouterConstant.teachersListRouteName,
          path: '/teachers-list',
          pageBuilder: (context, state) {
            return MaterialPage(child: TeachersListScreen());
          },
        ),
        GoRoute(
          name: AppRouterConstant.courseDetailRouteName,
          path: '/course-detail',
          pageBuilder: (context, state) {
            return MaterialPage(child: CourseDetailScreen());
          },
        ),
        GoRoute(
          name: AppRouterConstant.coursesRouteName,
          path: '/courses',
          pageBuilder: (context, state) {
            return MaterialPage(child: CoursesScreen());
          },
        ),
        GoRoute(
          name: AppRouterConstant.historyRouteName,
          path: '/history',
          pageBuilder: (context, state) {
            return MaterialPage(child: HistoryScreen());
          },
        ),
        GoRoute(
          name: AppRouterConstant.lessonDetailRouteName,
          path: '/lesson',
          pageBuilder: (context, state) {
            return MaterialPage(child: LessonDetailScreen());
          },
        ),
        GoRoute(
          name: AppRouterConstant.scheduleRouteName,
          path: '/schedule',
          pageBuilder: (context, state) {
            return MaterialPage(child: ScheduleScreen());
          },
        ),
        GoRoute(
          name: AppRouterConstant.teacherDetailRouteName,
          path: '/teacher-detail',
          pageBuilder: (context, state) {
            return MaterialPage(child: TeacherDetailScreen());
          },
        ),
        GoRoute(
          name: AppRouterConstant.videoCallRouteName,
          path: '/video-call',
          pageBuilder: (context, state) {
            return MaterialPage(child: VideoCallScreen());
          },
        ),
      ]);
}
