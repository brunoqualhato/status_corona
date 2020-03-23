import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:statuscorona/api/EndPoints.dart';
import 'package:statuscorona/models/funcoes.dart';
import 'package:statuscorona/models/paises.dart';
import 'package:statuscorona/widgets/ListaDeCardsComPaises.dart';
import 'package:sweetalert/sweetalert.dart';

import 'ListaDeEstados.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Paises> _listaDePaises = new List<Paises>();
  Icon _iconeDeBusca = new Icon(Icons.search);
  Widget _tituloAppBar = new Text("COVID-19");
  final TextEditingController _filter = new TextEditingController();

  @override
  void initState() {
    super.initState();

    _buscaTodosPaises();
  }

  void _buscaTodosPaises() {
    fechPaises(EndPoints.listagemDeTodosPaises()).then((result) {
      setState(() {
        _listaDePaises = result;
      });
    });

    Future.delayed(Duration(seconds: 3), () {
      SweetAlert.show(
        context,
        title: "Atenção",
        style: SweetAlertStyle.error,
        subtitle: "O aplicativo está em versão beta",
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _tituloAppBar,
        leading: Padding(
          child: GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaDeEstados()),
              )
            },
            child: Image.asset('images/brasil.png'),
          ),
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        ),
        actions: <Widget>[
          Padding(
            child: IconButton(
              icon: _iconeDeBusca,
              tooltip: "Buscar País",
              onPressed: () {
                buscar();
              },
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
          )
        ],
      ),
      body: _listaDePaises.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _listaDePaises.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                // primary: true,
                semanticChildCount: 1,
                addSemanticIndexes: true,
                dragStartBehavior: DragStartBehavior.start,
                itemBuilder: (context, i) {
                  return ListaDeCardsComPaises(
                    cases: _listaDePaises[i].cases,
                    confirmed: _listaDePaises[i].confirmed,
                    country: _listaDePaises[i].country,
                    deaths: _listaDePaises[i].deaths,
                    recovered: _listaDePaises[i].recovered,
                    updatedAt: _listaDePaises[i].updatedAt,
                  );
                },
              ),
            ),
    );
  }

  void buscarPais(String pais) {
    List<Paises> resultadosDaBuscas = new List<Paises>();

    _listaDePaises.forEach((f) {
      if (f.country.toLowerCase().contains(pais)) {
        resultadosDaBuscas.add(f);
      }
    });
    setState(() {
      _listaDePaises = resultadosDaBuscas;
    });
    // return resultadosDaBuscas;
  }

  void buscar() {
    setState(() {
      if (this._iconeDeBusca.icon == Icons.search) {
        this._iconeDeBusca = new Icon(Icons.close);
        this._tituloAppBar = new TextField(
          controller: _filter,
          onSubmitted: (s) {
            buscarPais(s);
          },
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search),
            hintText: 'Buscar...',
          ),
        );
      } else {
        this._filter.clear();
        this._iconeDeBusca = new Icon(Icons.search);
        this._tituloAppBar = new Text("COVID-19");
        _buscaTodosPaises();
        //filteredNames = names;
        /// _filter.clear();
      }
    });
  }
}
