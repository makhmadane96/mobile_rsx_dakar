import 'package:flutter/material.dart';
import 'package:mobile_rsx/Contact.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }


}

class _HomePageState extends State<HomePage>{
  TextEditingController nomComplet = TextEditingController();
  TextEditingController numero = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                        setState(() {
                          nomComplet.text = "";
                          numero.text = "";
                          contacts.add(Contact(name:nomc,numero: num));
                        });
                        print(contacts.length);
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
            contacts.isEmpty == true ?
            const Text(
              "Pas de contact sur la liste",
              style: TextStyle(fontSize: 22),
            ) :
              Expanded(child:
                ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) =>
                      Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: index % 2 == 0 ? Colors.purple :Colors.green,
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
                                  onTap: (){
                                    print("Modifier");
                                  },
                                  child:Icon(Icons.edit) ,
                                ),
                                InkWell(
                                  child:Icon(Icons.delete) ,
                                  onTap: (){
                                    print("Supprimer");
                                  },
                                )
                              ],
                            ) ,
                          )
                        )
                      )

                )
              )

          ],
        ),
      ),
    );

  }

}

