import 'dart:async';

import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';

import 'main5.dart';
 class Home extends StatefulWidget {
   final String text;
   const Home({Key? key, required this.text}) : super(key: key);

   @override
   State<Home> createState() => _HomeState();
 }

 class _HomeState extends State<Home> {
   final lists=[
     " RED "," OFF-WHITE "," BLACK "," YELLO "," WHITE"
   ];
 int? select;

   final lists1=[
      32,33,34,35,36,37,38,39,40
   ];
   int? select1;


   String? firstHalf;
   String? secondHalf;

   bool flag = true;

   @override
   void initState() {
     super.initState();

     if (widget.text.length > 50) {
       firstHalf = widget.text.substring(0, 50);
       secondHalf = widget.text.substring(50, widget.text.length);
     } else {
       firstHalf = widget.text;
       secondHalf = "";
     }
   }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [

              Stack(
                alignment:  AlignmentDirectional.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Card(
                       child: Image.network("https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHw%3D&w=1000&q=80",
                         height: 300,
                         width: MediaQuery.of(context).size.width,
                         fit: BoxFit.fill,
                       ),
             ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 30,
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(width: 5),
                          Icon(Icons.arrow_circle_left_outlined,color: Colors.white),
                          Icon(Icons.arrow_circle_right_outlined,color: Colors.white,)
                        ],
                      ),
                    ),
                  )
                ],
              ),

             SizedBox(height: 10),

             Padding(
               padding:   EdgeInsets.all(8.0),
               child: Container(

                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(10),
                   color: Colors.black12 ,

                 ),
                 child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                   const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Text("Head-Phone Max Per Day ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 27),),
                   ),



                       Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Icon(Icons.star,color: Colors.amber,size: 50,),
                           ),

                           Text("5.0",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17),),

                           Text("(1012 Reviews)",style: TextStyle(color: Colors.black45),)
                         ],
                       ),

                       secondHalf!.isEmpty
                           ? Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Text(firstHalf!,style: TextStyle(color:Colors.black),),
                           )
                           :  Padding(
                             padding: const EdgeInsets.all(8.0),
                              child: Column(
                         children: <Widget>[
                              Text(flag ? ("${firstHalf!}...") : (firstHalf! + secondHalf!)),
                              InkWell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      flag ? "See more" : "See less",
                                      style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    flag = !flag;
                                  });
                                },
                              ),
                         ],
                       ),
                           ),


                 ]),
                 ),
             ),


             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Selected Color :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black),),
             ),



                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    itemCount: lists.length,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (  context,   index) {

                    return  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            select=index;
                          });
                        },
                        child: Container(
                          height:80,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color:select==index? Colors.green:Colors.black,
                          ),
                          child: Center(child: Text(lists[index],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),




                        ),
                      ),
                    );
                  },


                  ),
                ),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Selected Size :",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black),),
             ),

             SizedBox(
               height: 50,
               child: ListView.builder(
                 itemCount: lists1.length,
                 primary: false,
                 shrinkWrap: true,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (  context,   index) {

                   return  Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: GestureDetector(
                       onTap: (){
                         setState(() {
                           select1=index;
                         });
                       },
                       child: Container(
                         height:50,
                         width: 50,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(30),
                           color:select1==index? Colors.red:Colors.green,
                         ),
                         child: Center(child: Text(lists1[index].toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),




                       ),
                     ),
                   );
                 },


               ),
             ),

           ],
       ),
        ),
     );
   }
 }
