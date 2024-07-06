import 'package:aplikasi_presence/SimpanPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Jimmy Wira Arba'a",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 400,
              decoration: BoxDecoration(color: Colors.blue[800]),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      "05 Juli 2024",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "07.00",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                            Text(
                              "Masuk",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "16.30",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                            Text(
                              "Pulang",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Riwayat Absen"),
            Card(
              child: ListTile(
                leading: Text("04 Juli 2024"),
                title: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "06.48",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Masuk",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "17.00",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Pulang",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("04 Juli 2024"),
                title: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "06.48",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Masuk",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "17.00",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Pulang",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text("04 Juli 2024"),
                title: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "06.48",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Masuk",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "17.00",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Pulang",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SimpanPage()))
              .then((value) => (value));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
