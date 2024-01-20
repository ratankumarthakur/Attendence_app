import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class take extends StatefulWidget {
  const take({super.key});

  @override
  State<take> createState() => _takeState();
}

class _takeState extends State<take> {


  String cdate = DateFormat("dd-MM-yyyy").format(DateTime.now());

  var empnameText=TextEditingController();

  static var emp=["Ratan","Robin","Aamir","Bheem","Priyansh","Kevin","Ben","Guan","Ram","Shyam","Komal","Shahrukh","Salman","Ajay","Ritik","Siddhart","Varun","Joker","Divyansh","John"];

  var emp_pcolor=[Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,];
  var emp_acolor=[Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,];
  var emp_namecolor=[Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,];

  addData(value,String demp,String n)async{
    await FirebaseFirestore.instance.collection(cdate).doc(demp).set({"attendence":value,"name":n});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(cdate,style: TextStyle(color: Colors.white),),

      ),

      body:  Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView.separated(itemBuilder: (context,index){
            return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(emp[index],style: TextStyle(color:emp_namecolor[index],fontSize: 20),),

                Row(
                  children: [

                    TextButton(onPressed: (){
                      setState(() {
                        emp_pcolor[index]=Colors.green;
                        emp_acolor[index]=Colors.grey;
                        emp_namecolor[index]=Colors.cyan;

                      });addData("present",emp[index],emp[index]);
                    }, child: Text("P",style: TextStyle(color: emp_pcolor[index],fontSize: 20),)),

                    SizedBox(width: 5,),

                    TextButton(onPressed: (){
                      setState(() {
                        emp_pcolor[index]=Colors.grey;
                        emp_acolor[index]=Colors.red;
                        emp_namecolor[index]=Colors.cyan;
                      });addData("absent",emp[index],emp[index]);
                    }, child: Text("A",style: TextStyle(color: emp_acolor[index],fontSize: 20),)),
                  ],)
              ],);
          },separatorBuilder: (context,index){
            return Divider(thickness: 1,color: Colors.grey.shade500,);
          }, itemCount: emp.length),
        ),
    );
  }
}
