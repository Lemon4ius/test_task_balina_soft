import 'package:flutter/material.dart';
import 'package:test_task_balina_soft/src/features/registr_screen/registration_page.dart';

import '../auth_screen/authorization_page.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        bottom: TabBar(
          onTap: (value) {
            switch (value){
              case 0:
                _pageViewController.jumpToPage(value);
              case 1:
                _pageViewController.jumpToPage(value);
            }
          },
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          labelStyle: const TextStyle(color: Colors.white),
          tabs: const [
            Tab(
              text: 'Login',
            ),
            Tab(
              text: "Register",
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            children: const [AuthorizationPage(), RegistrationPage()],
          )
        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }
}
