import 'package:flutter/material.dart';
import 'package:statuscorona/api/EndPoints.dart';
import 'package:statuscorona/models/estados.dart';
import 'package:statuscorona/models/funcoes.dart';
import 'package:statuscorona/widgets/ListaDeCardsComEstados.dart';

class ListaDeEstados extends StatefulWidget {
  @override
  _ListaDeEstadosState createState() => _ListaDeEstadosState();
}

class _ListaDeEstadosState extends State<ListaDeEstados> {
  List<Estados> _listEstados = new List<Estados>();
  @override
  void initState() {
    super.initState();
    fechEstados(EndPoints.listagemDeTodosEstadosBrasileiros()).then((onValue) {
      setState(() {
        _listEstados = onValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Estados Brasileiros"),
        backgroundColor: Colors.black12,
      ),
      body: _listEstados.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView.builder(
                  itemCount: _listEstados.length,
                  itemBuilder: (context, i) {
                    return ListaDeCardsComEstados(
                      broadcast: _listEstados[i].broadcast,
                      uf: _listEstados[i].uf,
                      refuses: _listEstados[i].refuses,
                      suspects: _listEstados[i].suspects,
                      state: _listEstados[i].state,
                      deaths: _listEstados[i].deaths,
                      datetime: _listEstados[i].datetime,
                      comments: _listEstados[i].comments,
                      cases: _listEstados[i].cases,
                    );
                  }),
            ),
    );
  }
}
