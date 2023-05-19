import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'api/fetch_news.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> news = [];
  final List<String> time = [];

  @override
  void initState() {
    super.initState();
    ApiKeys.fetchNews().then((newsPublished) {
      newsPublished.forEach((title, publishedAt) {
        setState(() {
          news.add(title);
          time.add(publishedAt);
        });
      });
    }).catchError((error) {
      print('Error: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    ApiKeys.fetchNews();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              // color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/cetlogo.jpg',
                    fit: BoxFit.cover,
                    height: 60,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'State Common Entrance Test Cell,',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Maharashtra State',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/emblem.png',
                    fit: BoxFit.cover,
                    height: 60,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3, // 30% width

                      child: Container(
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            'Important',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 7, // 70% width

                      child: Center(
                        child: Text(
                          textAlign: TextAlign.left,
                          'Registration for MAH-MBA',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color.fromARGB(255, 0, 38, 68),
                          child: const Center(
                            child: Text(
                              'Activity',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 4), // Add some spacing between the partitions
                      Expanded(
                        child: Container(
                          color: Color.fromARGB(255, 0, 38, 68),
                          child: const Center(
                            child: Text(
                              'Schedule',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8), // Add spacing between partitions and news
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                  },
                  children: List.generate(
                    news.length > 5
                        ? 5
                        : news.length, // Limit to a maximum of 5 news articles
                    (index) => TableRow(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            news[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            time[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
