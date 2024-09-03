import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_a_z/auth/auth_service.dart';
import 'package:shop_a_z/customwidgets/dashboard_item_view.dart';
import 'package:shop_a_z/models/dashboard_model.dart';
import 'package:shop_a_z/pages/login_page.dart';
import 'package:shop_a_z/providers/telescope_provider.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/';
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void didChangeDependencies() {
    Provider.of<TelescopeProvider>(context, listen: false).getAllBrands();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              AuthService.logout().then((value) => context.goNamed(LoginPage.routeName));
            },
            icon: const Icon(Icons.logout)
          )
        ]
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dashboardModelList.length,
        itemBuilder: (context, index) {
          final model = dashboardModelList[index];
          return DashboardItemView(model: model, onPress: (route) => context.goNamed(route));
        },
      )
    );
  }
}
