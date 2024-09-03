import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shop_a_z/auth/auth_service.dart';
import 'package:shop_a_z/pages/add_telescope_page.dart';
import 'package:shop_a_z/pages/brand_page.dart';
import 'package:shop_a_z/pages/dashboard_page.dart';
import 'package:shop_a_z/pages/login_page.dart';
import 'package:shop_a_z/pages/view_telescope_page.dart';
import 'package:shop_a_z/providers/telescope_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TelescopeProvider(),)
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SkyLens',
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
  
  final _router = GoRouter(
    initialLocation: DashboardPage.routeName,
    redirect: (context, state) {
      if(AuthService.currentUser == null) {
        return LoginPage.routeName;
      }
      return null;
    },
    routes: [
      GoRoute(
        name: DashboardPage.routeName,
        path: DashboardPage.routeName,
        builder: (context, state) => const DashboardPage(),
        routes: [
          GoRoute(
            name: AddTelescopePage.routeName,
            path: AddTelescopePage.routeName,
            builder: (context, state) => const AddTelescopePage(),
          ),
          GoRoute(
            name: ViewTelescopePage.routeName,
            path: ViewTelescopePage.routeName,
            builder: (context, state) => const ViewTelescopePage(),
          ),
          GoRoute(
            name: BrandPage.routeName,
            path: BrandPage.routeName,
            builder: (context, state) => const BrandPage(),
          ),
        ],
      ),

      GoRoute(
        name: LoginPage.routeName,
        path: LoginPage.routeName,
        builder: (context, state) => const LoginPage(),
      ),
    ]
  );
  
}

