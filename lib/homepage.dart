import 'package:flutter/material.dart';
import 'package:flutter_widgets_comarques/constants.dart';
import 'package:flutter_widgets_comarques/provincias.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  Map<String, String>? userData;
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.25,
                image: AssetImage("assets/images/travel_background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 240.0, // Ancho deseado
                      height: 113.0, // Altura deseada
                      child: Image.asset('assets/images/falomir_logo.png',
                          fit: BoxFit.cover),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      // Define el margen aquí
                      child: const Text(
                        'Les comarques de la comunitat',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'Blacklist',
                            fontWeight: FontWeight.bold,
                            color: Constants.myCustomColor),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      // Define el margen aquí
                      child: TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Usuari",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      // Define el margen aquí
                      child: TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Contrassenya",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Provincias(title: 'Províncies')),
                              );
                            },
                            child: const Text('Login'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Registre'),
                                    content: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          controller: _usernameController,
                                          decoration: const InputDecoration(
                                            labelText: "Nom d'usuari",
                                            prefixIcon: Icon(Icons.person),
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                        SizedBox(height: 10), // Espacio entre los campos
                                        TextFormField(
                                          controller: _passwordController,
                                          decoration: const InputDecoration(
                                            labelText: "Password",
                                            prefixIcon: Icon(Icons.lock),
                                            border: OutlineInputBorder(),
                                          ),
                                          obscureText: true, // Oculta la contraseña
                                        ),
                                      ],
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text('Cancel·lar'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: Text('Registrar'),
                                        onPressed: () {
                                          userData = {
                                            'username': _usernameController.text,
                                            'password': _passwordController.text,
                                          };
                                          print(userData); // Imprime el mapa para verificar los datos
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text('Register'),
                          ),
                        ],
                      )
                    )
                  ],
                ),
              ),
            )));
  }
}
