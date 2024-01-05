import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:provider/provider.dart';
import 'doas/todo_doa.dart';
import 'screens/home_page.dart';
import 'screens/third_page.dart';
import 'screens/second_page.dart';
import 'screens/search_page.dart';
import 'screens/novel_page.dart';
import 'screens/science_page.dart';
import 'screens/business_page.dart';
import 'screens/health_page.dart';

void main() {
  runApp(
    // 每一個 Provider 都是一個共享狀態
    // MultiProvider 裡面可以放 providers，分享多個狀態給 Flutter 主應用
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TodoDao())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 162, 197, 226),
        hintColor: Color.fromARGB(255, 10, 6, 79),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      routes: {
        "/": (BuildContext context) => HomeScreen(),
        "/second-screen": (BuildContext context) => SecondScreen(),
        "/third-screen": (BuildContext context) => ThirdScreen(),
        "/search-screen": (BuildContext context) => SearchScreen(),
        "/novel-screen": (BuildContext context) => NovelScreen(),
        "/science-screen": (BuildContext context) => ScienceScreen(),
        "/business-screen": (BuildContext context) => BusinessScreen(),
        "/health-screen": (BuildContext context) => HealthScreen(),
        "/task": (BuildContext context) => TodoInputDemoScreen(),
        // "/amount": (BuildContext context) => CountTodoDemoScreen()
      },
      initialRoute: "/",
    );
  }
}

class TodoInputDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 162, 197, 226),
        title: Text('Barcode scan screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _scanBarcode(context),
          child: Text('掃描條碼'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 162, 197, 226),
          ),
        ),
      ),
    );
  }

  Future<void> _scanBarcode(BuildContext context) async {
    try {
      String barcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // 掃描條碼時的掃描線顏色
        "取消", // 取消按鈕的文字
        true, // 是否顯示手電筒按鈕
        ScanMode.BARCODE, // 掃描模式，可以是條碼、QR 碼或全部
      );

      print("掃描到的條碼: $barcode");

      // 在這裡添加處理掃描到的條碼的邏輯
    } catch (e) {
      print("掃描條碼時發生錯誤: $e");
    }
  }
}
