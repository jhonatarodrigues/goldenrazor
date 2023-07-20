import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

import '../screens/home.dart';
import '../screens/schedule.dart';
import '../screens/scheduleService.dart';

var routes = <String, WidgetBuilder>{
  AppRoutes.home: (ctx) => HomeScreen(),
  AppRoutes.schedule: (ctx) => ScheduleScreen(),
  AppRoutes.scheduleService: (ctx) => ScheduleServiceScreen()
};
