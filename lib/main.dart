import 'package:flutter/material.dart';
import 'detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Container> daftarHeroDota = new List();
  var itemHero = [
    {
      "nama": "Viper",
      "gambar": "viper.jpg",
      "keterangan": "Hero Tipe Ranged Agility"
    },
    {
      "nama": "Tide Hunter",
      "gambar": "tidehunter.png",
      "keterangan": "Hero tipe STR Melle"
    },
    {
      "nama": "Slark",
      "gambar": "slark.jpg",
      "keterangan": "hero Tipe Agility Melle"
    },
    {
      "nama": "Rubick",
      "gambar": "rubick.jpg",
      "keterangan": "Hero bertipe Ranged INT"
    },
    {
      "nama": "Medusa",
      "gambar": "medusa2.png",
      "keterangan": "Hero bertipe ranged Agility"
    },
  ];
  _buatDataHero() async {
    for (var i = 0; i < itemHero.length; i++) {
      final dataHero = itemHero[i];
      final String gambarHero = dataHero['gambar'];
      daftarHeroDota.add(new Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Detail(
                            nama: dataHero["nama"],
                            gambar: gambarHero,
                            keterangan: dataHero["keterangan"],
                          )));
            },
            child: Column(
              children: <Widget>[
                Hero(
                  tag: dataHero["nama"],
                  child: Image.asset(
                    'assets/images/$gambarHero',
                    height: 85.0,
                    width: 125,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Text(
                  dataHero['nama'],
                  style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange),
                )
              ],
            ),
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    _buatDataHero();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Hero Dota2"),
        backgroundColor: Colors.deepOrange,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: daftarHeroDota,
      ),
    );
  }
}
