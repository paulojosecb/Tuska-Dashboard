import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateTo(String routerName) {
    Navigator.pushNamed(context, routerName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          // ListTile(
          //   title: const Text("Vender"),
          //   onTap: () {
          //     _navigateTo("/sell");
          //   },
          // ),
          ListTile(
            title: const Text("Produtos"),
            onTap: () {
              _navigateTo("/products");
            },
          ),
          ListTile(
            title: const Text("Catalogo"),
            onTap: () {
              _navigateTo("/catalog");
            },
          ),
          // ListTile(
          //   title: const Text("Histórico"),
          //   onTap: () {
          //     _navigateTo("/historic");
          //   },
          // ),
          ListTile(
            title: const Text("Configuraçõesß"),
            onTap: () {
              _navigateTo("/settings");
            },
          ),
        ],
      ),
    );
  }
}
