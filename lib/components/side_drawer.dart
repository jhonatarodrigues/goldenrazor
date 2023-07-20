import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  void _navigateScreen(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              print('element 1');
              _navigateScreen(context, AppRoutes.home);
            },
          ),
          ListTile(
            title: const Text('Schedule'),
            onTap: () {
              print('element 2');
              _navigateScreen(context, AppRoutes.schedule);
            },
          ),
        ],
      ),
    );
  }
}
