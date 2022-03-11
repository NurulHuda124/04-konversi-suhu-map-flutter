import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/services.dart';
import 'package:flutter_converter/widget/result.dart';
import 'package:flutter_converter/widget/input.dart';
import 'package:flutter_converter/widget/convert.dart';
import 'package:flutter_converter/widget/view.dart';
import 'package:flutter_converter/widget/dropdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _inputUser = 0;
  String _selectedDropdown = "Kelvin";
  double _result = 0;
  final inputController = TextEditingController();

  List listHasil = [];
  var listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit", "Celcius"];

  onChangedDropdown(newValue) {
    setState(() {
      _selectedDropdown = newValue;
      perhitunganSuhu();
    });
  }

  perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_selectedDropdown == "Kelvin") {
        _result = _inputUser + 273;
        listHasil.add('Kelvin : $_result');
      } else if (_selectedDropdown == "Reamur") {
        _result = (4 / 5) * _inputUser;
        listHasil.add('Reamur : $_result');
      } else if (_selectedDropdown == "Fahrenheit") {
        _result = (9 / 5) * _inputUser + 32;
        listHasil.add('Fahrenheit : $_result');
      } else {
        _result = _inputUser;
        listHasil.add('Celcius : $_result');
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Konversi Suhu"),
          ),
          body: Container(
            padding: const EdgeInsets.only(top: 10),
            child: Column(children: [
              const Text(
                'Nurul Huda \n2031710061',
              ),
              Input(inputController: inputController),
              Dropdown(
                  listSatuanSuhu: listSatuanSuhu,
                  selectedDropdown: _selectedDropdown,
                  onChangedDropdown: onChangedDropdown),
              Result(result: _result),
              Convert(konvertHandler: perhitunganSuhu),
              const Text(
                'Riwayat Konversi',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Expanded(child: View(listHasil: listHasil))
            ]),
          ),
        ));
  }
}
