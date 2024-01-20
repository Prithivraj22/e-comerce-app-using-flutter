import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/New Project.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: CircularProgressIndicator(),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Text(
                  'Hello !',
                  style: TextStyle(
                    fontSize: 33.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark().copyWith(
          primary: Colors.black,
          onPrimary: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.black,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.white,
            padding: EdgeInsets.all(16.0),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black54,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.black26,
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/login': (context) => LoginPage(),
        '/searchList': (context) => SearchListWidget(),
        '/': (context) => LoadingPage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('inropng/app3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 60.0),
            Text(
              'Welcome to Quick Drop',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 550),
                  child: ElevatedButton(
                    child: Text(
                      'Shop Now',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/searchList');
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchListWidget extends StatefulWidget {
  @override
  _SearchListWidgetState createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
  List<Item> itemList = [
    Item(
      name: 'Flight Controller',
      imagePath: 'assets/flightcontroller.png',
    ),
    Item(
      name: 'kk2.1.5 board',
      imagePath: 'assets/kk2.1.5board.png',
    ),
    Item(
      name: 'Gps module',
      imagePath: 'assets/gpsmodule.png',
    ),
    Item(
      name: 'Arduino board',
      imagePath: 'assets/arduinoboard.png',
    ),
    Item(
      name: 'Raspberry Pi',
      imagePath: 'assets/raspberrypi.png',
    ),
    Item(
      name: 'Battery',
      imagePath: 'assets/battery.png',
    ),
    Item(
      name: 'Tablet',
      imagePath: 'assets/tablet.png',
    ),
    Item(
      name: 'Smartphone',
      imagePath: 'assets/smartphone.png',
    ),
    Item(
      name: 'Transistor',
      imagePath: 'assets/transistor.png',
    ),
    Item(
      name: 'esp30',
      imagePath: 'assets/esp.png',
    ),
  ];

  List<Item> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchResults = itemList;
  }

  void searchItems(String searchTerm) {
    if (searchTerm.isEmpty) {
      setState(() {
        searchResults = itemList;
      });
      return;
    }

    List<Item> results = [];
    for (Item item in itemList) {
      if (item.name.toLowerCase().contains(searchTerm.toLowerCase())) {
        results.add(item);
      }
    }
    setState(() {
      searchResults = results;
    });
  }

  void showPicture(BuildContext context, Item item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetailsPage(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Drop'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                searchItems(value);
              },
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
              ),
              itemCount: searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    showPicture(context, searchResults[index]);
                  },
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          searchResults[index].imagePath,
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(height: 8.0),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: 16.0),
                            child: Text(
                              searchResults[index].name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String name;
  final String imagePath;

  Item({required this.name, required this.imagePath});
}

class ItemDetailsPage extends StatelessWidget {
  final Item item;

  ItemDetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50.0),
            Image.asset(
              item.imagePath,
              width: 400,
              height: 400,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 90.0),
            ElevatedButton(
              child: Text('Buy Now'),
              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}