import 'package:flutter/material.dart';
import 'package:mobile_rsx/Contact.dart';

class ProfilPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilPageState();
  }
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink,Colors.deepOrange.shade300],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight

              )
            ),
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor:  Colors.red.shade300,
                      minRadius: 35.0,
                      child: Icon(
                        Icons.call,
                        size: 30.0,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red.shade300,
                      minRadius: 35.0,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/photo.jpg'),

                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.red.shade300,
                      minRadius: 35.0,
                      child: Icon(
                        Icons.message,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Makhmadane LO",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),

                ),
                Text(
                  "FullStack Developper",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                  ),

                )


              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.deepOrange.shade300,
                    child: ListTile(
                      title: Text(
                        '5000',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:30,
                          color: Colors.white
                        ),
                      ),
                      subtitle: Text(
                        'Followers',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:20,
                              color: Colors.white70
                          )

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [

                ListTile(
                  title: Text(
                    "Email",
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),

                  ),
                  subtitle: Text(
                    'dl7781775@gmail.com',
                    style: TextStyle(fontSize: 23),
                  ),
                ),
                Divider(height: 20),
                ListTile(
                  title: Text(
                    "GitHub",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),

                  ),
                  subtitle: Text(
                    'maklo96',
                    style: TextStyle(fontSize: 23),
                  ),
                ),
                Divider(height: 20, color: Colors.deepOrange),
                ListTile(
                  title: Text(
                    "Linkded",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),

                  ),
                  subtitle: Text(
                    'makhmadane LO',
                    style: TextStyle(fontSize: 23),
                  ),
                ),



              ],
            ),
          )

        ],
      )
    );
  }
}
