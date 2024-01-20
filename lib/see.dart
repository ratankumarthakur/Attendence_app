import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class see extends StatefulWidget {
  const see({super.key});

  @override
  State<see> createState() => _seeState();
}

class _seeState extends State<see> {

  getData(String sa)async{
    var result=await FirebaseFirestore.instance.collection(sa).get();
    return result;
  }
  var emp=["ratan","robin","sher","bhalu","paplu","daku","gabbar","roni","ram","shyam","komal","shahrukh","salman","aamir","ritik","siddhart","varun","joker","divyansh","horse"];
  String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  String e="";
  var empnameT=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                  child: Container(height: 50,
                    child: TextField(
                      controller: empnameT,
                      decoration: const InputDecoration(
                        hintText: "dd-mm-yyyy",
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                  child: Container(width: double.infinity,height:50,
                    child: MaterialButton(
                    color: Colors.red
                    ,onPressed: (){
                      setState(() {
                         e=empnameT.text;
                      });
                    }, child:Text("Fetch data",style: TextStyle(fontSize: 20,color: Colors.white,),) ),
                  ),
                ),

                SizedBox(height: 20,),

                Expanded(
                  child: Container(decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(11)
                  ),width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: FutureBuilder(
                        future: getData(e),
                        builder: (context,dynamic snapshot){
                          if(snapshot.hasData){
                            return ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context,index){
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${snapshot.data.docs[index]["name"]}",style: TextStyle(color: Colors.white,fontSize: 15),),
                                        Text("${snapshot.data.docs[index]["attendence"]}",style: TextStyle(color: Colors.white,fontSize: 15),),
                                      ],
                                    ),
                                  );
                            });
                          }else{
                            return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(e.isEmpty?"Waiting for input ...":"Fetching data",style: TextStyle(color: Colors.blue),),

                                SizedBox(height: 20,),

                                CircularProgressIndicator(),
                              ],
                            ),);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],),
          ),
      ),
    );
  }
}
