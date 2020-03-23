import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

class ListaDeCardsComEstados extends StatelessWidget {
  final String datetime;
  final int uid;
  final String uf;
  final String state;
  final int cases;
  final int deaths;
  final int suspects;
  final int refuses;
  final bool broadcast;
  final String comments;

  ListaDeCardsComEstados(
      {this.cases,
      this.deaths,
      this.broadcast,
      this.comments,
      this.datetime,
      this.refuses,
      this.state,
      this.suspects,
      this.uf,
      this.uid});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Card(
          color: Colors.grey[900],
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  child: Text(
                    '$uf - $state',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 8, 0, 15),
                ),
                //Padding(
                // child: Text(
                //    '✅ $refuses ',
                //    style: estiloPadrao(),
                //  ),
                //  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
                //),
                Padding(
                  child: Text(
                    '🚨 $cases Confirmados',
                    style: estiloPadrao(),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
                ),
                Padding(
                  child: Text(
                    '♻️ $suspects Suspeitos',
                    style: estiloPadrao(),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
                ),

                Padding(
                  child: Text(
                    '💀 $deaths Mortes',
                    style: estiloPadrao(),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
                ),

                Divider(
                  color: Colors.white,
                ),
                Padding(
                  child: Text(
                    "🕐 Atualizado: ${DateTimeFormat.format(DateTime.parse(datetime), format: 'd/m/Y h:i:s')}",
                    style: estiloPadrao(),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                ),
                Padding(
                  child: Text(
                    '📊 Comentarios: $comments',
                    style: estiloPadrao(),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 8, 0, 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextStyle estiloPadrao() {
    return TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);
  }
}
