import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_balina_soft/src/features/gallery_screen/gallery_page.dart';
import 'package:test_task_balina_soft/src/features/map_screen/map_page.dart';

import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;
  String userName = '';
  final _screens = [
    const GalleryPage(),
    const MapPage(),
  ];

  _onChangeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(OnHomeInitialDataEvent()),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeInitialState) {
            setState(() {userName = state.userName;});
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            leading: Builder(
              builder: (context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ));
              },
            ),
          ),
          drawer: Drawer(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            child: ListView(
              padding: const EdgeInsets.all(0.0),
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.green),
                  child: Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        userName,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      )),
                ),
                ListTile(
                  selected: _selectedIndex == 0,
                  selectedColor: Colors.grey,
                  selectedTileColor: Colors.grey,
                  title: const Row(
                    children: [
                      Icon(
                        Icons.people_alt,
                        size: 40,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Photos',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    _onChangeScreen(0);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  selected: _selectedIndex == 1,
                  selectedTileColor: Colors.grey,
                  title: const Row(
                    children: [
                      Icon(
                        Icons.map,
                        size: 40,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Map',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    _onChangeScreen(1);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: _screens[_selectedIndex],
        ),
      ),
    );
  }
}
