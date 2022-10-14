import 'dart:async';

import 'package:tuska_dashboard/presentation/pages/catalog_page.dart';
import 'package:tuska_dashboard/presentation/pages/create_product/create_product_page.dart';
import 'package:tuska_dashboard/presentation/pages/products_page.dart';
import 'package:tuska_dashboard/presentation/pages/sell_page.dart';
import 'package:tuska_dashboard/presentation/pages/settings_page.dart';
import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage(
      {Key? key,
      required this.title,
      required this.route,
      required this.navigatorKey,
      required this.showDrawer})
      : super(key: key);

  final String title;
  final String route;
  final bool showDrawer;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  // final _navigatorKey = GlobalKey<NavigatorState>();
  /// Drawer delay let's us have the Navigation Drawer close first
  /// before the navigating to the next Screen
  int drawerDelay = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: widget.showDrawer
          ? Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Drawer Header'),
                  ),
                  ListTile(
                    title: const Text('Vender'),
                    onTap: () {
                      // Close the drawer
                      Navigator.pop(context);

                      /// [drawerDelay] gives time to animate the closing of the Drawer
                      Timer(Duration(milliseconds: drawerDelay), () async {
                        widget.navigatorKey.currentState!
                            .pushNamed(Routes.sells);
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Produtos'),
                    onTap: () {
                      // Close the drawer
                      Navigator.pop(context);

                      Timer(Duration(milliseconds: drawerDelay), () async {
                        widget.navigatorKey.currentState!
                            .pushNamed(Routes.products);
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Catálogos'),
                    onTap: () {
                      // Close the drawer
                      Navigator.pop(context);

                      Timer(Duration(milliseconds: drawerDelay), () async {
                        widget.navigatorKey.currentState!
                            .pushNamed(Routes.catalogs);
                      });
                    },
                  ),
                  ListTile(
                    title: const Text('Settings'),
                    onTap: () {
                      // Close the drawer
                      Navigator.pop(context);

                      Timer(Duration(milliseconds: drawerDelay), () async {
                        widget.navigatorKey.currentState!
                            .pushNamed(Routes.settings);
                      });
                    },
                  ),
                ],
              ),
            )
          : null,
      body: Navigator(
        // key: _navigatorKey,

        /// initialRoute needs to be set to '/'
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          // Manage your route names here
          // switch (settings.name) {
          switch (widget.route) {

            /// Default page displayed on Home Screen
            case Routes.sells:
              builder = (BuildContext context) => _sellPage();
              break;
            case Routes.products:
              builder = (BuildContext context) => _productsPage();
              break;
            case Routes.catalogs:
              builder = (BuildContext context) => _catalogPage();
              break;
            case Routes.settings:
              builder = (BuildContext context) => _settingsPage();
              break;
            case Routes.createProduct:
              builder = (BuildContext context) => _createProductPage();
              break;
            default:
              builder = (BuildContext context) => const UnknownPage();
          }
          return MaterialPageRoute(
            builder: builder,
            settings: settings,
          );
        },
      ),
    );
  }

  Widget _sellPage() => SellPage(navigatorKey: widget.navigatorKey);
  Widget _catalogPage() => CatalogPage(navigatorKey: widget.navigatorKey);
  Widget _productsPage() => ProductsPage(navigatorKey: widget.navigatorKey);
  Widget _settingsPage() => SettingsPage(navigatorKey: widget.navigatorKey);
  Widget _createProductPage() =>
      CreateProductPage(navigatorKey: widget.navigatorKey);
}

class Routes {
  static const sells = '/sells';
  static const products = '/products';
  static const catalogs = '/catalogs';
  static const settings = '/settings';
  static const createProduct = '/createProduct';
}

class UnknownPage extends StatefulWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  State<UnknownPage> createState() => _UnknownPageState();
}

class _UnknownPageState extends State<UnknownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              '404',
            ),
          ],
        ),
      ),
    );
  }
}
