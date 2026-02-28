import 'package:flutter/material.dart';
import 'package:my_health/fun/conwidet.dart';
import 'package:provider/provider.dart';

class Userpage extends StatefulWidget {
  
  const Userpage({super.key});
  

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 177, 6),
      body: Container(
        

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
                  
              //     width: double.infinity,
              //     height: 130,

                  
              //         child: Padding(
              //           padding: EdgeInsets.all(15),
              //           child: Row(
              //             children: [
                            
              //               Expanded(
              //                 flex: 2,
              //                 child: Container(
              //                   height: 60,

              //                   decoration: BoxDecoration(
                               
                                
                                
              //                   borderRadius: BorderRadius.circular(8),
              //                   border: Border.all(
              //                     color: Colors.white,
              //                     width: 1
              //                   )
              //                   ),
                                
              //                   child: Center(
              //                     child: Text(
              //                       'เข้าสู่ระบบ',
              //                       style: TextStyle(fontSize: 30,color: Colors.white),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 10,
              //               ),
              //               Expanded(
              //                 flex: 2,
              //                 child: Container(
              //                   height: 60,

              //                   decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(8),
              //                   border: Border.all(
              //                     color: Colors.white,
              //                     width: 1
              //                   ),
                                
              //                   ),
              //                   child: Center(
              //                     child: Text(
              //                       'สมัครสมาชิก',
              //                       style: TextStyle(fontSize: 30,color: Colors.white),
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  
                  width: double.infinity,
                  height: 130,

                  
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 60,

                                decoration: BoxDecoration(
                               
                                
                                
                                borderRadius: BorderRadius.circular(8),
                              
                                ),
                                
                                child: Center(
                                  child: Text(
                                    'My Health',
                                    style: TextStyle(fontSize: 45,color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
              
                ),
              ),
              SizedBox(height: 5),
              
              Container(
                height: 660,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                padding: EdgeInsets.only(
                  top: 40
                ),
                child: Column(
                  children: [
                    Expanded(child: Container(
                      child: Row(
                        children: [
                          Expanded(child: InkWell(
                            onTap: () {
                              context.read<Conwidet>().goToWidet(7);
                            },
                            child: Column(
                            children: <Widget>[
                              Icon(Icons.settings, size: 60,color: Colors.blueAccent,),
                              Text("ตั้งค่า",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                            ],
                          )
                          ),),
                          Expanded(child: Container()),
                          Expanded(child: Container())
                        ],
                      ),
                    )),
                    Expanded(child: Container(
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Expanded(child: Container()),
                          Expanded(child: Container())
                        ],
                      ),
                    )),
                    Expanded(child: Container(
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Expanded(child: Container()),
                          Expanded(child: Container())
                        ],
                      ),
                    )),
                    Align(
                      alignment: Alignment.center,
                      child: Text('by GameAnuchaza'),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
