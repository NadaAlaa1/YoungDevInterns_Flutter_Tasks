import 'package:flutter/material.dart';
import 'package:flutter_calculator/imports.dart';
import 'package:flutter_calculator/model/historyitem.dart';
import 'package:flutter_calculator/provider/calculator_provider.dart';
import 'package:flutter_calculator/screens/calculator.dart';
import 'package:flutter_calculator/screens/history.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryItemAdapter());
  await Hive.openBox<HistoryItem>('history');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorProvider>(
      create: (_) => CalculatorProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(
            color: backgroundColor,
            elevation: 0.0,
          ),
          textTheme: TextTheme(
            displaySmall: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
              fontSize: 18.0,
            ),
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: orangeColor),
        ),
        routes: {
          '/': (context) => const Calculator(),
          '/history': (context) => History(),
        },
      ),
    );
  }
}
