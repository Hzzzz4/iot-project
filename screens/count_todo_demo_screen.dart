// import 'package:bb/screen/search_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../components/common_drawer.dart';
// import '../doas/todo_doa.dart';

// class CountTodoDemoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(80),
//         child: AppBar(
//           backgroundColor: Color.fromARGB(255, 162, 197, 226),
//           toolbarHeight: 100,
//           title: const Text(
//             'InkOT',
//             style: TextStyle(
//               fontSize: 30,
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           centerTitle: true,
//           actions: [
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SearchScreen()),
//                 );
//               },
//             ),
//             Row(
//               children: [
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, "/");
//                   },
//                   child: const Text(
//                     'Home',
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 15),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, "/third-screen");
//                   },
//                   child: const Text(
//                     "Wish list",
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 15),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, "/second-screen");
//                   },
//                   child: const Text(
//                     "My account",
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//               ],
//             ),
//           ],
//         ),
//       ),
//       drawer: CommonDrawer.getDrawer(context),
//       // 請context讀取TodoDao，並調度此共享狀態的getTodos函數，取得todoList，
//       // 並量測數量，轉為字串，貼回
//       body: Container(
//         child: Text("目前的許願清單數量為 " +
//             context.read<TodoDao>().getTodos().length.toString()),
//       ),
//     );
//   }
// }
