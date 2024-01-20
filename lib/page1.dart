import 'package:attende/see.dart';
import 'package:attende/take.dart';
import 'package:flutter/material.dart';

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 80,backgroundColor: Colors.white,backgroundImage: AssetImage("assets/img.png"),),
              SizedBox(height: 100,),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>take()));
              },
                child: Container(height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.red,
                  ),child: const Center(
                    child: Text("Take Attendence",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              InkWell(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>see()));
              },
                child: Container(height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.red,
                  ),child: const Center(
                  child: Text("See Attendence",style: TextStyle(color: Colors.white),),
                ),
                ),
              ),
            ],),
        ),
    );
  }
}
