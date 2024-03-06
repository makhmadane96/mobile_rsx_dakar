import 'package:flutter/material.dart';

void main() {
  TextEditingController nomComplet = TextEditingController();
  TextEditingController numero = TextEditingController();
  List<Object> contacts = List.empty(growable: true);
  runApp(
      MaterialApp(
        title: "M1 RX",
        theme: ThemeData(
          primarySwatch: Colors.pink
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink,
            centerTitle: true,
            title: Text("Liste des Contacts"),
          ) ,
          body: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  controller: nomComplet,
                  style: TextStyle(fontSize: 30),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Saisir Le nom complet",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10)
                      )
                    )
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: numero,
                  style: TextStyle(fontSize: 30),
                    keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Saisir le numéro",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      )
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          String nomc=nomComplet.text;
                          String num = numero.text;
                          if(nomc.isNotEmpty && num.isNotEmpty){
                            nomComplet.text = "";
                            numero.text = "";
                            contacts.add({"nom":nomc,"numero":num});
                            for (var value in contacts) {
                              print(value.toString());
                            }
                          }
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(fontSize: 30)
                        ),
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                            backgroundColor: MaterialStatePropertyAll(Colors.pink)
                        )
                    ),
                    ElevatedButton(
                        onPressed: (){
                          print("Update");
                        },
                        child: Text(
                            "Update",
                            style: TextStyle(fontSize: 30)
                        ),
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                            backgroundColor: MaterialStatePropertyAll(Colors.pink)
                        )
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Pas de contact sur la liste",
                  style: TextStyle(fontSize: 22),
                )
              ],
            ),
          ),
        ),
      )
  );
}
