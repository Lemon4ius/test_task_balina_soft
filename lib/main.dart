import 'package:flutter/material.dart';
import 'package:test_task_balina_soft/src/core/constans.dart';
import 'package:test_task_balina_soft/src/core/data_store.dart';
import 'package:test_task_balina_soft/src/features/authentication_screen/authentication_page.dart';
import 'package:test_task_balina_soft/src/features/main_screen/home_page.dart';
import 'package:yandex_maps_mapkit_lite/init.dart' as init;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BaseDataStore().initSharedPreferences();
  await init.initMapkit(apiKey: const String.fromEnvironment('MAPKIT_API_KEY'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'balina soft',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final bool _alreadyLogin;

  @override
  void initState() {
    super.initState();
    _alreadyLogin = BaseDataStore().getBool(ConstantsShared.alreadyLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _alreadyLogin ? const HomePage() : const AuthenticationPage(),
    );
  }
}
