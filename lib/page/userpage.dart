import 'package:flutter/material.dart';

class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,

                        offset: Offset(0, 0),
                        color: Colors.grey,
                        
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        
                        Color.fromRGBO(25, 25, 241, 1),
                        Color.fromRGBO(0, 212, 255, 1)
                      ]
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: double.infinity,
                  height: 130,

                  
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Icon(Icons.account_circle, size: 60,color: Colors.white,),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 40,

                                decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color.fromRGBO(0, 224, 94, 1),
                                    Color.fromRGBO(2, 204, 86, 1),
           
                                  ]
                                
                                )
                                ,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1
                                )
                                ),
                                
                                child: Center(
                                  child: Text(
                                    'เข้าสู่ระบบ',
                                    style: TextStyle(fontSize: 22,color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 40,

                                decoration: BoxDecoration(color: Colors.amber,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1
                                )
                                ),
                                child: Center(
                                  child: Text(
                                    'สมัครสมาชิก',
                                    style: TextStyle(fontSize: 22,color: Colors.white),
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
                  color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
