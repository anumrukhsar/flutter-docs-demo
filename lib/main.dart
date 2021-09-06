import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Docs Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DocsListingPage(),
    );
  }
}

class DocsListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Flutter Docs Demo'))),
      body: DocsListingScreen(),
    );
  }
}

class DocsListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: ListView(children: [
        IntroWidget(),
        LayoutWidget(),
        NavigationWidget(),
        AppStateMangementWidget(),
      ]),
    );
  }
}

class IntroWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          WidgetsIntro(title: 'Introduction Widget')))
            },
        child: Text('Introduction Widget'));
  }
}

class LayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LayoutAWidget(title: 'Layout a widget')))
            },
        child: Text('Layout Widget'));
  }
}

class NavigationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NavigationRouteWidget(title: 'Navigation Widget')))
            },
        child: Text('Navigation Widget'));
  }
}

class AppStateMangementWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {}, child: Text('AppStateMangement Widget'));
  }
}

class WidgetsIntro extends StatelessWidget {
  final String title;

  const WidgetsIntro({required this.title});

  @override
  Widget build(BuildContext context) {
    // A Center widget that shows Hello World
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello World'),
              GestureDetector(
                onTap: () {
                  print("I was Tapped");
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.deepPurpleAccent),
                  child: Text('Gesture Detector',
                      style: TextStyle(
                          fontSize: 12.0, fontStyle: FontStyle.normal)),
                ),
              ),
              Counter(),
              ShoppingList(items: ['Chips', 'Ice Cream']),
            ],
          ),
        ));
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Count:$counter'),
        Container(
            margin: EdgeInsets.all(10.0),
            child:
                ElevatedButton(onPressed: increment, child: Text('Increase'))),
        Container(
            child:
                ElevatedButton(onPressed: decrement, child: Text('Decrease')))
      ],
    );
  }

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      if (counter > 0) counter--;
    });
  }
}

class ShoppingList extends StatefulWidget {
  final List<String> items;

  const ShoppingList({required this.items, Key? key}) : super(key: key);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  bool inCart = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {
        setState(() => {inCart = !inCart})
      },
      leading: CircleAvatar(
        child: Text(widget.items[0][0]),
        backgroundColor: inCart ? Colors.blue : Colors.grey,
      ),
      title: Text(
        widget.items[0],
        style: TextStyle(
            color: inCart ? Colors.blue : Colors.grey,
            decoration: inCart ? TextDecoration.lineThrough : null),
      ),
    );
    ListView(
      children: widget.items
          .map((e) => ListTile(
                onTap: () => {
                  setState(() => {inCart = !inCart})
                },
                leading: CircleAvatar(child: Text(e[0])),
                title: Text(
                  e,
                  style: TextStyle(
                      color: inCart ? Colors.blue : Colors.grey,
                      decoration: inCart ? TextDecoration.lineThrough : null),
                ),
              ))
          .toList(),
    );
  }
}

class NavigationRouteWidget extends StatelessWidget {
  final title;

  const NavigationRouteWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: GestureDetector(
          onTap: () {
            goToNewPage(context);
          },
          child: Container(
              padding: EdgeInsets.all(10.0), child: Text("Go To New page")),
        )));
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('New Page'),
            ),
            body: Center(
                child: GestureDetector(
              onTap: () => {goBack(context)},
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Text("Go Back"),
              ),
            ))));
  }
}

void goToNewPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage()));
}

void goBack(BuildContext context) {
  Navigator.pop(context);
}

class NavigationWidgetUsingRoutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => Home(),
        '/details': (context) => DetailPage(),
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ElevatedButton(
        onPressed: () => {Navigator.pushNamed(context, '/details/2')},
        child: Text("Detail"),
      ),
    ));
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: ElevatedButton(
        onPressed: () => {Navigator.pop(context)},
        child: Text("Back Home"),
      ),
    ));
  }
}

class NavWidgetUsingRoutesWithParams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // Handle '/'
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => Home());
        }

        // Handle '/details/:id'
        var uri = Uri.parse(settings.name.toString());
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'details') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(builder: (context) => DetailScreen(id: id));
        }

        // return MaterialPageRoute(builder: (context) => UnknownScreen());
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  final id;

  DetailScreen({this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Detail $id'),
        ),
      ),
    );
  }
}

class LayoutAWidget extends StatelessWidget {
  final title;

  const LayoutAWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(children: [
                Expanded(
                    child: Image.network('https://picsum.photos/250?image=9')),
                Expanded(
                    flex: 2,
                    child: Image.network('https://picsum.photos/250?image=9')),
                Expanded(
                    child: Image.network('https://picsum.photos/250?image=9')),
              ]),
              Column(
                children: [
                  Text(
                    'Strawberry Paravola',
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(Icons.star),
                          Icon(
                            Icons.star,
                            color: Colors.deepPurple,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.deepPurple,
                          ),
                        ],
                      ),
                      Text('153 Reviews'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.timelapse),
                          Text('TimeLapse'),
                          Text('14 hrs'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.food_bank),
                          Text('Feeds'),
                          Text('4-6'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.timelapse_sharp),
                          Text('Preperation'),
                          Text('25 min'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
           Stack(
             alignment: Alignment(0.6,0.6),
             children: [
               CircleAvatar(
                 backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
                 radius: 100,
               ),
               Container(
                 color: Colors.black45,
                 child: Text('Mira',style: TextStyle(color: Colors.white),),

               )
             ],
           ),
            ],
          ),
        ));
  }
}
