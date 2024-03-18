import 'package:flutter/material.dart';
import 'package:mobile_rsx/Contact.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController nomComplet = TextEditingController();
  TextEditingController numero = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);
  bool verif = false;
  int selectedIndex = -1;

  TextField createTextField(TextEditingController val, TextInputType type, String text){
    return TextField(
      controller: val ,
      style: TextStyle(fontSize: 30),
      keyboardType: type,
      decoration: InputDecoration(
          hintText: text,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    ) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Text("Search Contact"),
      ),
      body: Center(
        child:   Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              createTextField(nomComplet,TextInputType.text, "Saisir Le nom complet"),
              SizedBox(height: 15),
              createTextField(numero, TextInputType.number, "Saisir le numéro")
              ,
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: this.verif == true
                        ? null
                        : () {
                      String nomc = nomComplet.text;
                      String num = numero.text;
                      if (nomc.isNotEmpty && num.isNotEmpty) {
                        setState(() {
                          nomComplet.text = "";
                          numero.text = "";
                          contacts.add(Contact(name: nomc, numero: num));
                        });
                      }
                    },
                    child: Text("Save", style: TextStyle(fontSize: 30)),
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                        backgroundColor: this.verif
                            ? MaterialStatePropertyAll(Colors.black12)
                            : MaterialStatePropertyAll(Colors.pink),
                        mouseCursor: MaterialStateMouseCursor.clickable),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        String nom = nomComplet.text.trim();
                        String tel = numero.text.trim();
                        if (nom.isNotEmpty && tel.isNotEmpty) {
                          setState(() {
                            nomComplet.text = "";
                            numero.text = "";
                            contacts[selectedIndex].name = nom;
                            contacts[selectedIndex].numero = tel;
                            this.verif = false;
                          });
                        }
                      },
                      child: Text("Update", style: TextStyle(fontSize: 30)),
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                        backgroundColor: this.verif == false
                            ? MaterialStatePropertyAll(Colors.black12)
                            : MaterialStatePropertyAll(Colors.pink),
                      ))
                ],
              ),
              SizedBox(height: 10),
              contacts.isEmpty
                  ? const Text(
                "Pas de contact sur la liste",
                style: TextStyle(fontSize: 22),
              )
                  : Expanded(
                  child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) => Card(
                          child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: index % 2 == 0
                                    ? Colors.purple
                                    : Colors.green,
                                child: Text(
                                  contacts[index].name[0],
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    contacts[index].name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    contacts[index].numero,
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              trailing: SizedBox(
                                width: 70,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          this.selectedIndex = index;
                                          this.verif = true;
                                          nomComplet.text =
                                              contacts[index].name;
                                          numero.text =
                                              contacts[index].numero;
                                        });
                                      },
                                      child: Icon(Icons.edit),
                                    ),
                                    InkWell(
                                      child: Icon(Icons.delete),
                                      onTap: () {
                                        setState(() {
                                          contacts.removeAt(index);
                                        });
                                      },
                                    )
                                  ],
                                ),
                              )))))
            ],
          ),
        )
      ));
  }
}
