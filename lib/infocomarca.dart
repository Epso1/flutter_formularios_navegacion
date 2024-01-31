import 'package:flutter/material.dart';
import 'package:flutter_widgets_comarques/main.dart';
import 'package:flutter_widgets_comarques/constants.dart';
import 'package:flutter_widgets_comarques/comarcas.dart';
import 'package:flutter_widgets_comarques/infoclima.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InfoComarca extends StatefulWidget {
  const InfoComarca({super.key, required this.title});

  final String title;

  @override
  State<InfoComarca> createState() => _InfoComarcaState();
}

class _InfoComarcaState extends State<InfoComarca> {

  int _selectedIndex = 0;

 void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InfoClima(title: widget.title)),
      );
    }
    else if(index == 0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InfoComarca(title: widget.title)),
      );
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.myCustomColor2,
          title: Text(widget.title,
              style: const TextStyle(
                  color: Constants.myCustomColor,
                  fontFamily: 'Blacklist',
                  fontSize: 30)),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      child: FutureBuilder<Comarca>(
                        future: getInfoComarca(widget.title),
                        builder: (BuildContext context,
                            AsyncSnapshot<Comarca> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Column(
                              children: <Widget>[
                                Ink.image(
                                  image: NetworkImage(snapshot.data!.img ?? ''),
                                  fit: BoxFit.cover,
                                  height: 225.0,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    snapshot.data!.comarca,
                                    style: const TextStyle(
                                        color: Constants.myCustomColor,
                                        fontSize: 40),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      'Capital: ${snapshot.data!.capital}' ??
                                          '',
                                      style: const TextStyle(
                                          color: Constants.myCustomColor,
                                          fontSize: 30)),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(snapshot.data!.desc ?? '',
                                      style: const TextStyle(
                                          color: Constants.myCustomColor,
                                          fontSize: 16)),
                                ),
                              ],
                            );
                          } // else
                        }, // builder
                      ),
                    ),
                  ),
                ),
                Container(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'La Comarca',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sunny),
              label: 'Informació i oratge',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}

Future<Comarca> getInfoComarca(String comarca) async {
  final response = await http.get(Uri.parse(
      'https://node-comarques-rest-server-production.up.railway.app/api/comarques/infoComarca/$comarca'));

  if (response.statusCode == 200) {
    return Comarca.fromJSON(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load comarca info');
  }
}


