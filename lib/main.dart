import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DartLightTheme();
  }
}

class DartLightTheme extends StatefulWidget {
  const DartLightTheme({
    Key? key,
  }) : super(key: key);

  @override
  State<DartLightTheme> createState() => _DartLightThemeState();
}

  ThemeData _darkTheme = ThemeData(
      accentColor: Color(0xff4db6ac),
      primaryColor: Color(0xff004d40),
      brightness: Brightness.dark,


  );
ThemeData _lightTheme = ThemeData(
  accentColor: Color(0xffef5350),
  primaryColor: Color(0xffef9a9a),
  brightness: Brightness.light,
);
  bool _light = true;
  class _DartLightThemeState extends State<DartLightTheme> {


    @override
    Widget build(BuildContext context) {
      return SayacPage();
    }
  }

class SayacPage extends StatefulWidget {
  const SayacPage({Key? key}) : super(key: key);

  @override
  _SayacPageState createState() => _SayacPageState();
}

class _SayacPageState extends State<SayacPage> {
  late int _counter;

  Future<void> readySharedPreferences() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    _counter = sharedPreferences.getInt("sayac") ?? 0;
    setState(() {});
  }


  Future<void> saveData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    _counter += 1;
    sharedPreferences.setInt("sayac", _counter);
  }

  Future<void> resetCounter() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    _counter = 0;
    sharedPreferences.setInt("sayac", _counter);
    setState(() {}
    );
  }

  @override
  void initState() {
    super.initState();
    readySharedPreferences();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme:  ThemeData(
      // colorSchemeSeed: const Color(0xff4db6ac), useMaterial3: true),
    theme: _light ? _lightTheme : _darkTheme ,
        darkTheme: _darkTheme,
      home: Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text("ZİKİRMATİK")),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Önceki Sayaçlarım',
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          Row(
            children: [
              Switch(

                  value: _light,
                  onChanged: (toggle){
                    setState(() {
                      _light = toggle;
                    });
                  })
            ],

                  ),
          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.save),
                  tooltip: 'Kaydet',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        'BAŞARIYLA KAYDEDİLDİ !',
                      ),
                    ));
                  }),
            ],),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: TextButton(onPressed: (){resetCounter();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  'SIFIRLANDI' ),
                ),
              );},
                child:Text("RESET", style:TextStyle(fontSize:35, letterSpacing:3,color:Color(0xff26a69a),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:90,top:100),
              child: Text(
                "$_counter",
                style: TextStyle(
                  fontSize: 130,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Container(
              child:FloatingActionButton.large(
                onPressed: (){
                  setState(() {
                    saveData();
                  });
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}

