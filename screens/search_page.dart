import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<String> _dataList = List.generate(50, (index) => 'Item $index');

  List<String> _filteredDataList = []; // 初始為空列表

  @override
  void initState() {
    super.initState();
    _filteredDataList = []; // 初始為空列表
  }

  void _filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredDataList = []; // 如果搜尋字串為空，將列表清空
      });
      return;
    }

    List<String> searchList = _dataList
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      _filteredDataList = searchList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 162, 197, 226),
          toolbarHeight: 100,
          title: TextField(
            controller: _searchController,
            onChanged: (value) {
              _filterSearchResults(value);
            },
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _searchController.clear();
                  _filteredDataList = _dataList;
                });
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _filteredDataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_filteredDataList[index]),
          );
        },
      ),
    );
  }
}
