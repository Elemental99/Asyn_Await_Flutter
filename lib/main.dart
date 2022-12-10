import 'package:async_await_project/services/mockapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async Await App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Async Await App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MockApi mockApi = MockApi();
  int getFerrari = 0;
  int getHyundai = 0;
  int getFisherPrice = 0;
  int widthFerrari = 0;
  int widthHyundai = 0;
  int widthFisherPrice = 0;
  int timeFerrari = 0;
  int timeHyundai = 0;
  int timeFisherPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              iconSize: 100,
              onPressed: () async {
                setState(() {
                  widthFerrari = 300;
                  timeFerrari = 1;
                });
                getFerrari = await mockApi.getFerrariInteger();
                setState(() {
                  widthFerrari = 0;
                  timeFerrari = 0;
                });
              },
              icon: const Icon(CupertinoIcons.home),
            ),
            getAnimation(
              width: widthFerrari,
              time: timeFerrari,
              getData: getFerrari,
              color: Colors.green,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            IconButton(
              onPressed: () async {
                setState(() {
                  widthHyundai = 300;
                  timeHyundai = 3;
                });
                getHyundai = await mockApi.getHyundaiInteger();
                setState(() {
                  widthHyundai = 0;
                  timeHyundai = 0;
                });
              },
              iconSize: 100,
              icon: const Icon(CupertinoIcons.car_fill),
            ),
            getAnimation(
              width: widthHyundai,
              time: timeHyundai,
              getData: getHyundai,
              color: Colors.amber,
            ),
            const Divider(
              color: Colors.transparent,
            ),
            IconButton(
              onPressed: () async {
                setState(() {
                  widthFisherPrice = 300;
                  timeFisherPrice = 10;
                });
                getFisherPrice = await mockApi.getFisherPriceInteger();
                setState(() {
                  widthFisherPrice = 0;
                  timeFisherPrice = 0;
                });
              },
              iconSize: 100,
              icon: const Icon(CupertinoIcons.person),
            ),
            getAnimation(
              width: widthFisherPrice,
              time: timeFisherPrice,
              getData: getFisherPrice,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}

Widget getAnimation({
  required int width,
  required int time,
  required int getData,
  required Color color,
}) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: AnimatedContainer(
          width: width.toDouble(),
          height: 20,
          duration: Duration(
            seconds: time,
          ),
          decoration: BoxDecoration(
            color: color,
          ),
        ),
      ),
      Text(
        getData.toString(),
        style: const TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
