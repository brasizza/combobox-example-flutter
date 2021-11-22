import 'package:combobox/data/models/neighborhood_model.dart';
import 'package:combobox/modules/home_controller.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final HomeController controller = HomeController();
  late Future _comboList;
  NeighborhoodModel? _dropDownSelected;
  @override
  void initState() {
    super.initState();
    _comboList = controller.buildCombobox();
  }

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
            Text(
              'Escolha um item do seu Combobox',
            ),
            FutureBuilder(
                future: _comboList,
                builder: (_, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:

                    case ConnectionState.waiting:
                      return CircularProgressIndicator();
                    case ConnectionState.active:
                    case ConnectionState.done:
                      return Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: DropdownButton<NeighborhoodModel>(
                          items: snapshot.data as List<DropdownMenuItem<NeighborhoodModel>>,
                          value: _dropDownSelected,
                          onChanged: (newNeighborhood) {
                            setState(() {
                              _dropDownSelected = newNeighborhood!;
                              print("NOME = " + newNeighborhood.name!);
                              print("ID = " + newNeighborhood.id.toString());
                            });
                          },
                        ),
                      );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
