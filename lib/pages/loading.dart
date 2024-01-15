import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadnigScreen extends StatefulWidget {
  const LoadnigScreen({Key? key}) : super(key: key);

  @override
  State<LoadnigScreen> createState() => _LoadnigScreenState();
}

class _LoadnigScreenState extends State<LoadnigScreen> {

  void setUpWorldTime() async{
    WorldTime inst = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await inst.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':inst.location,
      'flag':inst.flag,
      'time':inst.time,
      'daytime':inst.daytime
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child:SpinKitCubeGrid(
            color: Colors.white,
            size: 100.0,
          )
      ),
    );
  }
}
