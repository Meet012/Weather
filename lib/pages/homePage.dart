import 'package:flutter/material.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Object? parameters;
  late Map data={};

  @override
  Widget build(BuildContext context) {

    parameters = ModalRoute.of(context)!.settings.arguments as Map;
    data = data.isNotEmpty?data:jsonDecode(jsonEncode(parameters));

    // set background image using data
    String bgImage =data['daytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['daytime']?Colors.blue!:Colors.indigo[700]!;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text('HomePage'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.fill
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 130.0, 0.0, 0.0),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed:() async{
                    dynamic result = await Navigator.pushNamed(context,'/location');
                    setState(() {
                      data = {
                        'time':result['time'],
                        'location':result['location'],
                        'daytime':result['daytime'],
                        'flag':result['flag']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.red
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 65.0,
                    color: Colors.red
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}