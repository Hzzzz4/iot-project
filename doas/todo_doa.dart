import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TodoDao())],
      child: MyApp(),
    ),
  );
}

class Todo {
  bool completed;
  String content;

  Todo(this.completed, this.content);
}

class TodoDao extends ChangeNotifier {
  List<Todo> todoList = [];

  void addBookFromScan(String scannedData) {
    Todo newBook = Todo(false, scannedData);
    todoList.add(newBook);
    notifyListeners();
  }

  void insertTodo(String inputValue) {}

  getTodos() {}
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoInputDemoScreen(),
    );
  }
}

class TodoInputDemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 162, 197, 226),
          title: Text('Barcode scan screen'),
        ),
      ),
    );
  }

  Future<void> _scanBarcode(BuildContext context) async {
    try {
      String barcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "取消",
        true,
        ScanMode.BARCODE,
      );

      print("掃描到的條碼: $barcode");

      // 在這裡呼叫 TodoDao 中的方法來處理條碼資料
      TodoDao todoDao = Provider.of<TodoDao>(context, listen: false);
      todoDao.addBookFromScan(barcode);
    } catch (e) {
      print("掃描條碼時發生錯誤: $e");
    }
  }
}
