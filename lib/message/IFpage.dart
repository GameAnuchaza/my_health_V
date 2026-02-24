import 'package:flutter/material.dart';
import 'package:my_health/fun/conwidet.dart';
import 'package:provider/provider.dart';

class Ifpage extends StatefulWidget {
  const Ifpage({super.key});

  @override
  State<Ifpage> createState() => _IfpageState();
}

class _IfpageState extends State<Ifpage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    context.read<Conwidet>().goToWidet(0);
                  },
                  icon: Icon(Icons.arrow_back, size: 40),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
               
                child: Column(
                  children: [
                    Text('การทํา IF 16/8 ตาราง วิธีทํา IF มือใหม่ เข้าใจง่าย', style: TextStyle(fontSize: 25)),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                                "assets/images/intermittent-fasting.webp",
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                                
                              ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('   การทํา if 16/8 ตาราง การทำ if เริ่มต้นยังไง วิธีไหนที่ได้รับการยืนยัน และเป็นที่ยอมรับกันทั่วโลกว่าเป็นวิธีลดน้ำหนัที่ทำได้ง่ายและได้ผลจริง วันนี้ดูเพลินจะมาแนะ วิธีลดน้ำหนัก ที่ได้รับการยืนยัน และเป็นที่ยอมรับกันทั่วโลกว่าเป็นวิธีที่ทำง่ายและได้ผลจริง มาฝากเพื่อน ๆ กันจ้า นั้นก็คือการควบคุมการรับประทานอาหารที่รู้จักกันในชื่อ Intermittent Fasting หรือที่รู้จักกันในชื่อย่อ IF นั้นเอง การคุมน้ำหนักด้วยการคุมอาหารกับวิธี IF เป็นอีกวิธีที่เป็นที่นิยมมากในปัจจุบัน', style: TextStyle(fontSize: 16)),
                    Text('   Intermittent Fasting (IF) คือการอดอาหารเป็นช่วงๆ เป็นวิธี ลดน้ำหนัก ที่ได้รับความนิยมอย่างมากในปัจจุบัน ซึ่งการลดน้ำหนักแบบ IF เป็นการกำหนดช่วงเวลาในการ อดอาหาร (Fasting) และ รับประทานอาหาร (Feeding) โดยไม่เน้นการปรับเปลี่ยนรูปแบบประเภทในการบริโภคอาหาร แต่เน้นการกำหนดเวลาในการรับประทานอาหารเป็นหลัก ด้วยแนวคิดที่ว่า การจำกัดช่วงเวลาในการรับประทานอาหาร จะสามารถทำให้ลดปริมาณการกินอาหารลงได้เช่นกัน นอกจากนี้ และในช่วงเวลาที่ อดอาหาร (Fasting) ร่างกายจะหลั่งฮอร์โมน อินซูลิน (Insulin) ลดลง ส่งผลให้การเปลี่ยนน้ำตาลในเลือดไปเป็นไขมันลดลง ทำให้การกักเก็บไขมันใต้ผิวหนังและน้ำหนักลดลง นอกจากนี้ ร่างกายจะหลั่ง โกรทฮอร์โมน (Growth Hormone) และ นอร์อีพิเนฟริน (Norepinephrine) เพิ่มขึ้นอีกด้วย', style: TextStyle(fontSize: 16)),
                    Text('   โกรทฮอร์โมน (Growth Hormone) และ นอร์อีพิเนฟริน (Norepinephrine) จะช่วยให้ร่างกายเผาผลาญไขมันและเพิ่มการเผาผลาญพลังงานให้สูงขึ้น โดยไม่ทำให้มวลกล้ามเนื้อลดลงเหมือนการอดอาหารอย่างต่อเนื่อง มีผลการวิจัยพบว่า การทำ IF ช่วยชะลอการเสื่อมของเซลล์ และมีงานวิจัยแสดงให้เห็นว่า การอดอาหารมีแนวโน้มทำให้ชีวิตยืนยาวขึ้น โดย IF จะกระตุ้นการกลืนกินตัวเองของเซลล์ (Autophagy) ซึ่งเป็นกลไกที่ช่วยให้เกิดการซ่อมแซมระดับเซลล์ โดยปกติเซลล์ในร่างกายมีการสร้างใหม่และตายไปตลอดเวลา เมื่อเกิดการกลืนกินตัวเองของเซลล์จะมีการสร้างเซลล์ใหม่ที่แข็งแรงมาแทนเซลล์เก่าที่เสื่อมสภาพไป', style: TextStyle(fontSize: 16)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('การทํา if 16/8 ตาราง สูตรการทำ Intermittent Fasting (IF) ยอดนิยม', style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800)),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Beginer คือสูตร IF 12/12 หรือ 14/10 เป็นสูตรสำหรับผู้เริ่มต้น', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                    ),
                    Text('    สูตรนี้ คุณจะอดอาหารเป็นเวลา 12 - 14 ชั่วโมง และจะมีเวลาสำหรับรับประทานอาหาร 10 - 12 ชั่วโมง นั้นเอง สูตรนี้เหมาะสำหรับผู้ที่กำลังจะเริ่มทำ IF เพราะหากคุณไม่เคยอดหารมาก่อน ร่างกายของคุณอาจจะมีอาการอยากอาหารได้หากอดอาหารนานเกินไป ดังนั้น เราแนะนำให้คุณเริ่มทำสูตรนี้ก่อนสัก 5 - 10 วัน ก่อนเริ่มทำสูตร IF 16/8', style: TextStyle(fontSize: 16)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Lean Gains คือสูตร IF 16/8 เป็นสูตรที่ได้รับความนิยมมากที่สุด', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                    ),
                    Text('   สูตรนี้ คุณจะอดหารเป็นเวลา 16 ชั่วโมง และมีเวลาในการรับประทานอาหาร 8 ชั่วโมง โดยเป็นสูตรที่แนะนำสำหรับผู้ที่เข้าใจหลักการ การทำ IF และ อีกทั้งสูตรนี้ยังเป็นที่นิยม เพราะสามารถทำได้ง่าย ต่อเนื่อง และไม่กระทบการใช้ชีวิตประจำวันมากจนเกินไป', style: TextStyle(fontSize: 16)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('ตัวอย่าง ตารางการทำ IF : 16/8', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                      
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('- 7:00 น. ตื่นนอน', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                      
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('- 8:00 น. งดอาหารเช้า เปลี่ยนเป็นดื่มน้ำเปล่า กาแฟดำ หรือ น้ำอุ่นผสมมะนาว', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                      
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('- 12:00 น. เริ่มช่วงเวลาการกิน (Feeding) กินอาหารกลางวัน เน้นอาหารที่เป็นโปรตีน, ผักใบเขียว เพื่อรับโปรตีนและไฟเบอร์ เช่น สลัดอกไก่ สลัดอกไก่ไข่ต้ม หากเป็นเมนูที่กินคู่กับข้าว ควรเลือกเป็นข้าวไรซ์เบอร์รี่ หรือ ข้าวกล้อง', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                      
                      
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('- 15:00 น. กินอาหารว่าง เน้นโปรตีนและไขมันดี เช่น ไข่ต้ม, ถั่วต่างๆ, มันนึ่ง, ข้าวโพดต้ม และผลไม้แคลอรี่ต่ำ เช่น แอปเปิล กล้วย แตงโม ', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                      
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('- 18:00 น. กินอาหารเย็น ควรลดแป้งหรืองดไปเลย เน้นผักและโปรตีน เพื่อให้อิ่มท้อง เช่น สุกี้น้ำไก่, สลัดผักอกไก่, สลัดทูน่า โยเกิร์ต, ผักต้มและน้ำพริก', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                      
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('- 20:00 น. เริ่มช่วงเวลาการอด (Fasting) โดยงดการกินอาหารจนถึง 12:00 น. ของอีกวัน', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                      
                    ),
                    Text('หมายเหตุ: เคล็ดลับง่ายๆ คือเริ่มกินมื้อแรกตอนเที่ยง และเมื้อสุดท้ายก่อน 2 ทุ่ม เพียงเท่านั้น และที่สำคัญควรกินอาหารที่มีประโยชน์ เพื่อทำให้การลดน้ำหนักได้ผลและมีประสิทธิภาพสูงสุด', style: TextStyle(fontSize: 16)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Fast 5  คือสูตร IF 19/5', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                      
                    ),
                    Text('   สูตรนี้ คุณจะอดหารเป็นเวลา 19 ชั่วโมง และมีเวลาในการรับประทานอาหาร 5 ชั่วโมง โดยหลักการ อดนานขึ้นร่างกายก็จะใช้ไขมันได้มาขึ้้น สูตรนี้จึงไปขึ้นต่อไปหากคุณทำ IF 16/8 มาสักระยะแล้ว โดยคุณอาจะจะทำ IF 19/5 ในช่วงวันหยุด หรือทำสูตร 1 - 2 วัน ต่ออาทิตย์ก็จะทำให้คุณสามารถลดน้ำหนักได้เร็วขึ้นอีกด้วย', style: TextStyle(fontSize: 16)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('สูตรการทำ Intermittent Fasting (IF) แบบ Advance', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                      
                    ),
                     Text('   ต้องบอกว่าวิธีด้านล่างนี้คือการอดอาหารฉบับมือโปร หากคุณไม่เคยทำ IF มาก่อนเราไม่แนะนำให้คุณลองวิธีด้านล่างนี้ แต่หากคุณทำ IF มาสักระยะแล้ว และรู้สึกว่ามีความชำนาญในการอดอาหารในระดับหนึ่งแล้ว คุณอาจจะเพิ่มความท้าทายด้วยการทำ Eat Stop Eat และ Alternate Day Fasting กันดูก็ได้นะ', style: TextStyle(fontSize: 16)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Eat Stop Eat คือสูตร IF24', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                      
                    ),
                    Text('   สูตรนี้คุณจะทำการอดอาหาร 24 ชั่วโมง 1 - 2 ครั้งต่อสัปดาห์ ส่วนวันที่ไม่อดก็กินได้ตามปกติ แต่ต้องกินอย่างเหมาะสมและเพียงพอต่อความต้องการของร่างกาย 5:2 คือ ทานอาหารตามปกติ 5 วัน และทานอาหารแบบ Fasting 2 วัน ซึ่งเลือกทำติดกัน 2 วันหรือห่างกันก็ได้ วิธีเป็นการลดปริมาณอาหารให้น้อยลง เช่น ผู้ชายสามารถกินได้ 600 แคลอรี่ ส่วนผู้หญิงกินได้ 500 แคลอรี่ หรือประมาณ 1/4 ของแคลอรี่ที่ได้รับต่อวัน', style: TextStyle(fontSize: 16)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Alternate Day Fasting', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                      
                    ),
                     Text('   การอดอาหารแบบวันเว้นวัน เป็นวิธีค่อนข้างหักโหม เพราะต้องอดอาหาร 1 วัน กินอาหาร 1 วัน แล้วกลับมาอดอีก 1 วัน แต่ทั้งนี้ก็เหมือนกับ IF สูตร 5:2 เพราะในวันที่ Fast เราสามารถกินอาหารแคลอรี่ต่ำได้ แต่ต้องกินให้น้อยที่สุดเท่าที่จะทำได้', style: TextStyle(fontSize: 16)),
                    
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
