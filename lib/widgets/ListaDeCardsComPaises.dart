import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';

class ListaDeCardsComPaises extends StatelessWidget {
  final String country;
  final int cases;
  final int confirmed;
  final int deaths;
  final int recovered;
  final String updatedAt;
  ListaDeCardsComPaises(
      {this.cases,
      this.confirmed,
      this.country,
      this.deaths,
      this.recovered,
      this.updatedAt});

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
                    'Status $country',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 8, 0, 15),
                ),
                Padding(
                  child: Text(
                    '✅ $confirmed Confirmados',
                    style: estiloPadrao(),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
                ),
                Padding(
                  child: Text(
                    '🚨 $cases Ativos',
                    style: estiloPadrao(),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 8, 0, 0),
                ),
                Padding(
                  child: Text(
                    '♻️ $recovered Recuperados',
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
                    "🕐 Atualizado: ${DateTimeFormat.format(DateTime.parse(updatedAt), format: 'd/m/Y h:i:s')}",
                    style: estiloPadrao(),
                  ),
                  padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                ),
                Padding(
                  child: Text(
                    '📊 Fonte: WHO',
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
