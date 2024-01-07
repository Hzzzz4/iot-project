import 'package:iot/screens/search_page.dart';
import 'package:flutter/material.dart';
import '../components/common_drawer.dart';

class NovelScreen extends StatelessWidget {
  const NovelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
          color: Color.fromARGB(255, 0, 0, 0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Novel books",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage("images/novel1.jpg"),
                        width: 250,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "[Book name]",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Image(
                        image: AssetImage("images/novel2.jpg"),
                        width: 250,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "[Book name]",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Image(
                        image: AssetImage("images/novel5.jpg"),
                        width: 250,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "[Book name]",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Column(
                children: [
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Back",
                          style: TextStyle(
                            color: Color.fromARGB(255, 162, 197, 226),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/");
                        },
                        child: const Text(
                          "My Home page",
                          style: TextStyle(
                            color: Color.fromARGB(255, 162, 197, 226),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
