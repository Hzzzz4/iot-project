import 'package:iot/screens/search_page.dart';
import 'package:flutter/material.dart';
import '../components/common_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

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
            'IOT',
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
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Updated ImageRow widget
              ImageRow(images: [
                "images/health1.jpg",
                "images/business2.jpg",
              ]),
              const SizedBox(
                height: 30,
                width: 30,
              ),
              // Updated ImageRow widget
              ImageRow(images: [
                "images/health3.jpg",
                "images/business3.jpg",
              ], imageWidth: 200, spacing: 30),
              SizedBox(
                height: 10,
              ),
              TextButton(
                child: const Text(
                  "Add book",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 162, 197, 226),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/task");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Updated ImageRow widget
class ImageRow extends StatelessWidget {
  final List<String> images;
  final double imageWidth;
  final double spacing;

  const ImageRow({
    Key? key,
    required this.images,
    this.imageWidth = 200,
    this.spacing = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: images
          .map(
            (imagePath) => Container(
              margin: EdgeInsets.symmetric(horizontal: spacing),
              child: Column(
                children: [
                  Image(
                    image: AssetImage(imagePath),
                    width: imageWidth,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '[Book name]',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text('[Author]'),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
