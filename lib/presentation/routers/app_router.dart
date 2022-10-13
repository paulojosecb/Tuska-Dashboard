import 'package:tuska_dashboard/presentation/navigator_page.dart';
import 'package:flutter/material.dart';

class AppRouter extends StatelessWidget {
  AppRouter({super.key});

  final _mainNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routed demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          elevation: 1,
        ),
      ),
      navigatorKey: _mainNavigatorKey,
      navigatorObservers: [Helper.routeObserver],
      initialRoute: Routes.sells,
      routes: {
        Routes.sells: (context) => NavigatorPage(
              title: 'Vender',
              route: Routes.sells,
              navigatorKey: _mainNavigatorKey,
              showDrawer: true,
            ),
        Routes.products: (context) => NavigatorPage(
              title: 'Produtos',
              route: Routes.products,
              navigatorKey: _mainNavigatorKey,
              showDrawer: true,
            ),
        Routes.catalogs: (context) => NavigatorPage(
              title: 'Catalogos',
              route: Routes.catalogs,
              navigatorKey: _mainNavigatorKey,
              showDrawer: true,
            ),
        Routes.settings: (context) => NavigatorPage(
              title: 'Configuracao',
              route: Routes.settings,
              navigatorKey: _mainNavigatorKey,
              showDrawer: true,
            ),
        Routes.createProduct: (context) => NavigatorPage(
            title: 'Criar produto',
            route: Routes.createProduct,
            navigatorKey: _mainNavigatorKey,
            showDrawer: true)
      },
    );
  }
}

class Helper {
  static final RouteObserver<ModalRoute> routeObserver =
      RouteObserver<ModalRoute>();
}
