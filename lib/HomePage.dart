import 'dart:convert';
import 'package:aplikasi_presence/SimpanPage.dart';
import 'package:aplikasi_presence/models/HomeResponse.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as myHttp;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<String> _name, _token;
  HomeResponModel? homeResponModel;
  Datum? hariIni;
  List<Datum> riwayat = [];

  @override
  void initState() {
    super.initState();

    _token = _prefs.then((SharedPreferences prefs) {
      return prefs.getString("token") ?? "";
    });

    _name = _prefs.then((SharedPreferences prefs) {
      return prefs.getString("name") ?? "";
    });
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove("token");
    setState(() {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    });
  }

  Future getData() async {
    final Map<String, String> headers = {
      'Authorization': 'Bearer ' + await _token
    };

    var response = await myHttp.get(
        Uri.parse('http://127.0.0.1:8000/api/get-presensi'),
        headers: headers);

    homeResponModel = HomeResponModel.fromJson(json.decode(response.body));
    riwayat.clear();
    homeResponModel!.data.forEach((element) {
      if (element.isHariIni) {
        hariIni = element;
      } else {
        riwayat.add(element);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SafeArea(
                  child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FutureBuilder(
                            future: _name,
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data!,
                                    style: TextStyle(fontSize: 20),
                                  );
                                } else {
                                  return Text("-Unknown-",
                                      style: TextStyle(fontSize: 20));
                                }
                              }
                            }),
                        IconButton(
                          icon: Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          onPressed: logout,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.blue[800],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              hariIni?.tanggal ?? "-",
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
                                      hariIni?.masuk ?? "-",
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
                                      hariIni?.pulang ?? "-",
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
                    Text(
                      "Riwayat Absen",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: riwayat.length,
                        itemBuilder: (context, index) => Card(
                          child: ListTile(
                            leading: Text(
                              riwayat[index].tanggal,
                              style: TextStyle(fontSize: 14),
                            ),
                            title: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      riwayat[index].masuk,
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
                                  width: 50,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      riwayat[index].pulang,
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
                      ),
                    ),
                  ],
                ),
              ));
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SimpanPage()))
              .then((value) {
            setState(() {});
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }
}
