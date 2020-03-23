
class Estados {
  int uid;
  String datetime;
  String uf;
  String state;
  int cases;
  int deaths;
  int suspects;
  int refuses;
  bool broadcast;
  String comments;

  Estados(
      {
      this.cases,
      this.deaths,
      this.broadcast,
      this.comments,
      this.datetime,
      this.refuses,
      this.state,
      this.suspects,
      this.uf
      });

  Estados.fromJson(Map<String, dynamic> json) {
    this.cases = json['cases'];
      this.deaths = json['deaths'];
      this.broadcast = json['broadcast'];
      this.comments = json['comments'];
      this.datetime = json['datetime'];
      this.refuses = json['refuses'];
      this.state = json['state'];
      this.suspects = json['suspects'];
      this.uf = json['uf'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
 data['cases']=this.cases;
      data['deaths']=this.deaths;
      data['broadcast']=this.broadcast;
      data['comments']=this.comments;
      data['datetime']=this.datetime;
      data['refuses']=this.refuses;
      data['state']=this.state;
      data['suspects']=this.suspects;
      data['uf']=this.uf;
    return data;
  }
}
class EstadoList{
  List<Estados> estados;
  EstadoList.fromJson(Map<String, dynamic> json) {
   
    if (json['data'] != null) {
      estados = new List<Estados>();
      json['data'].forEach((v) {
        estados.add(new Estados.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
   
    if (this.estados != null) {
      data['data'] = this.estados.map((v) => v.toJson()).toList();
    }
    return data;
  }
}