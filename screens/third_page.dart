import 'package:iot/screens/search_page.dart';
import 'package:flutter/material.dart';
import '../components/common_drawer.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My wished book list",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                // 添加分隔线
                color: Colors.grey,
                thickness: 1.5,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.topCenter,
                child: const Row(
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "[Book name]",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "[Author]",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Image(
                              image: AssetImage("images/novel5.jpg"),
                              width: 300,
                              height: 300,
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "[Book name]",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "[Author]",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                Image(
                                  image: AssetImage("images/business1.jpg"),
                                  width: 300,
                                  height: 300,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
