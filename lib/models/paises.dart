
class ListaDePaises {
     List<Paises> paises;
ListaDePaises({this.paises});
 
  ListaDePaises.fromJson(Map<String, dynamic> json) {
   
    if (json['data'] != null) {
      paises = new List<Paises>();
      json['data'].forEach((v) {
        paises.add(new Paises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
   
    if (this.paises != null) {
      data['data'] = this.paises.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paises {
      String country;
      int cases;
      int confirmed;
      int deaths;
      int recovered;
      String updatedAt;
 Paises ({this.cases,this.confirmed,this.country,this.deaths,this.recovered,this.updatedAt});


  Paises.fromJson(Map<String, dynamic> json) {
      country= json['country'];
      cases= json['cases'];
      confirmed= json['confirmed'];
      deaths= json['deaths'];
      recovered= json['recovered'];
      updatedAt= json['updated_at'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
   data['country']=this.country;
      data['cases']=this.cases;
      data['confirmed']=this.confirmed;
      data['deaths']=this.deaths;
      data['recovered']=this.recovered;
      data['updated_at']=this.updatedAt;
    return data;
  }
}