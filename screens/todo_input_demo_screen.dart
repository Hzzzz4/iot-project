import 'package:iot/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/common_drawer.dart';
import '../doas/todo_doa.dart';



/// 透過 createState 函數，調動 _TodoInputDemoScreen 這個 State 類別
class TodoInputDemoScreen extends StatefulWidget {
  
  
  // StatefulWidget 的變化笑過出自於這個 createState 函數。
  @override
  State createState() {
    return _TodoInputDemoScreen();
  }
}

class _TodoInputDemoScreen extends State<TodoInputDemoScreen> {
  // 每次畫面渲染所執行的函數
  @override
  Widget build(BuildContext context) {
    // 在使用 TextField 的時候，輸入完成後，先前的內容仍會留在上面
    // 為使用文字消息，必需使用新的 TextEditingController，並當 TextField 的參數
    var textEditingController = TextEditingController();

    // 文字輸入框
    Widget userInputTextField = Container(
      width: 500,
      child: TextField(
        
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: '請輸入想交換的書，成功換得請打勾',
          hoverColor: Color.fromARGB(255, 59, 113, 222),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 59, 204, 204), 
            ),
          ),
        ),
        cursorColor: Colors.black,
        
        controller: textEditingController,
        
        onSubmitted: (inputValue) {
          setState(() {
            ，
            // 調用 insertTodo 函數，插入資料
            context.read<TodoDao>().insertTodo(inputValue);
            // 清空輸入文字框
            textEditingController.clear();
          });
        },
      ),
    );

    // 回傳頁面
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 162, 197, 226),
          toolbarHeight: 100,
          title: const Text(
            'InkOT',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/");
                  },
                  child: const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/third-screen");
                  },
                  child: const Text(
                    "Wish list",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/second-screen");
                  },
                  child: const Text(
                    "My account",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
      drawer: CommonDrawer.getDrawer(context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            // 文字輸入框
            userInputTextField,
            // 用戶所輸入的內容
            // 三個點是使該 List 成為 children 內的元素
            
            ...context
                .watch<TodoDao>()
                .getTodos()
                .map((taskTodo) => Container(child: TodoComponent(taskTodo)))
                .toList()
          ],
        ),
      ),
    );
  }
}

class TodoComponent extends StatelessWidget {
  final String taskTodo;

  TodoComponent(this.taskTodo);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
