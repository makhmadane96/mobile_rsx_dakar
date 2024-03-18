import 'package:flutter/material.dart';
import 'package:mobile_rsx/Contact.dart';
import 'package:mobile_rsx/Search.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  int position = 0;

  final List<Widget> _widgetsOptions = [
    Text("Home",style: TextStyle(fontSize:40)),
    SearchPage(),
    Text("Contact",style: TextStyle(fontSize:40))
  ];

  void _positionPage(int index){
      setState(() {
        position = index;
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child:Text(
                    "Menu Sidebar",
                  style: TextStyle(color: Colors.white,fontSize: 25),
                ),
              decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/photo.jpg')
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.input,size: 40),
              title: Text('Welcome',style:  TextStyle(color: Colors.black,fontSize: 25)),
              onTap: ()=>{
                   // Navigator.of(context).pop()
                Navigator.of(context).push(MaterialPageRoute(builder: (context )=> SearchPage()))
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_user,size: 40),
              title: Text('User',style:  TextStyle(color: Colors.black,fontSize: 25)),
              onTap: ()=>{},
            ),
            ListTile(
              leading: Icon(Icons.settings,size: 40),
              title: Text('Parametre',style:  TextStyle(color: Colors.black,fontSize: 25)),
              onTap: ()=>{},
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,
        title: Text("Liste des Contacts"),
      ),
      body: Container(
        child: _widgetsOptions.elementAt(position),
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.red
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.green
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Contact",
              backgroundColor: Colors.pink
          ),
          
        ],
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black,
        iconSize: 40,
        currentIndex: position,
        onTap: _positionPage ,


      ),
    );
  }
}
