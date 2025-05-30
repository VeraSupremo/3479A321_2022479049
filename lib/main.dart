import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'pages/my_home_page.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'provider/changeNotifier.dart';
import 'servicios/database_helper.dart';

final _logger = Logger('MyApp');
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    _logger.info('Logger is working!');

    return ChangeNotifierProvider<AppData>(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Clicker 3000',
        theme: ThemeData(
          fontFamily: 'Minecraft',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
          useMaterial3: true,
        ),
        home: MyHomePage(title: 'Pagina super mega clicker 3000 demo'),
      ),
    );
  }
}
