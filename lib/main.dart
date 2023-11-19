import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 1;

  int get tabIndex => _tabIndex;

  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24))
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: double.infinity,
              height: 100,
              child: Image.asset(
            'assent/image/img.png',
            fit: BoxFit.cover,
          )),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24),topRight: Radius.circular(24)),
              color: Colors.black.withOpacity(0.5),
            ),
            height: 100,
            width: double.infinity,

          ),
          CircleNavBar(
            activeIcons: const [
              Icon(Icons.person, color: Colors.deepPurple),
              Icon(Icons.home, color: Colors.deepPurple),
              Icon(Icons.favorite, color: Colors.deepPurple),
            ],
            inactiveIcons: const [
              Text("My",style: TextStyle(color:Colors.white,fontSize: 20),),
              Text("Home",style: TextStyle(color:Colors.white,fontSize: 20),),
              Text("Like",style: TextStyle(color:Colors.white,fontSize: 20),),
            ],
            color: Colors.transparent,
            height: 100,
            circleWidth: 60,
            activeIndex: tabIndex,
            onTap: (index) {
              tabIndex = index;
              pageController.jumpToPage(tabIndex);
            },
            // padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
            cornerRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
              // bottomRight: Radius.circular(24),
              // bottomLeft: Radius.circular(24),
            ),
            circleColor: Colors.white,
            circleShadowColor: Colors.transparent,
             shadowColor: Colors.transparent,
            elevation: 10,
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red),
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.green),
          Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.blue),
        ],
      ),
    );
  }
}
