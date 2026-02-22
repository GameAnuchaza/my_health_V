import 'package:flutter/material.dart';
import 'package:my_health/fun/conwidet.dart';
import 'package:provider/provider.dart';

class messageone extends StatefulWidget {
  const messageone({super.key});

  @override
  State<messageone> createState() => _messageoneState();
}

class _messageoneState extends State<messageone> {
  
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
                  icon: Icon(Icons.arrow_back, size: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
               
                child: Column(
                  children: [
                    Text('เปิด 5 วิธีช่วยลดหากไตรกลีเซอไรด์เกิน 200', style: TextStyle(fontSize: 25)),
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                                "assets/images/Triglyceride.jpg",
                                width: double.infinity,
                                height: 160,
                                fit: BoxFit.cover,
                                
                              ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('   วันที่ 22 กุมภาพันธ์ 2569 เฟซบุ๊ก หมอเจด ของ นพ.เจษฏ์ บุณยวงศีวิโรจน์ รอง ผอ.โรงพยาบาลมหาราชนครราชสีมา มีการโพสต์ถึงวิธีการลดไตรกลีเซอไรด์ที่สูงกว่า 200 ให้ได้ผล มีรายละเอียดดังนี้', style: TextStyle(fontSize: 16)),
                    Text('   หลายคนไปตรวจเลือดแล้วตกใจ ตัวค่า LDL ไม่สูงมากก็จริง แต่ว่าไตรกลีเซอไรด์ พุ่งเกิน 200 mg/dL ทั้งที่ไม่ได้กินมันเยอะทุกวัน ต้องรู้ก่อนว่าไตรกลีเซอไรด์ไม่ได้ขึ้นจากไขมันอย่างเดียว แต่น้ำตาล แป้งขัดสี แอลกอฮอล์ และน้ำหนักเกิน คือสาเหตุหลัก ถ้าปล่อยไว้นาน เสี่ยงไขมันพอกตับ หลอดเลือดตีบ และตับอ่อนอักเสบได้ โดยเฉพาะถ้าเกิน 500 ต้องระวังมากครับ วันนี้มาดูกันว่าต้องแก้ยังไงบ้างครับ', style: TextStyle(fontSize: 16)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('1. ตัดน้ำตาลและแป้งขัดสีให้จริงจัง', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                    ),
                    Text('    ใครที่ยังมีแวบไปกินควรหันมาคิดใหม่ได้แล้วครับ เพราะที่ไตรกลีเซอไรด์สูงเกิน 200 mg/dL มักเกิดจากร่างกายเปลี่ยนน้ำตาลส่วนเกินเป็นไขมันสะสมในเลือด ถ้ายังดื่มหวาน กาแฟหวาน 25% ชานม น้ำอัดลม หรือกินขนมบ่อย ตัวเลขจะไม่ลงง่าย ๆ ครับ ลองลดคาร์บขัดสี เช่น ข้าวขาว เส้นขาว เบเกอรี่ เปลี่ยนเป็นข้าวกล้องหรือคุมปริมาณให้พอดี ภายใน 4-8 สัปดาห์ ค่ามักลดลงชัดเจนถ้าทำได้สม่ำเสมอ', style: TextStyle(fontSize: 16)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('2. งดแอลกอฮอล์ชั่วคราว', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                    ),
                    Text('   ยิ่งถ้าถ้าค่าเกิน 200 mg/dL ควรงดอย่างน้อย 4-12 สัปดาห์ เพราะแอลกอฮอล์กระตุ้นตับให้สร้างไตรกลีเซอไรด์เพิ่ม และยิ่งคนที่มีไขมันพอกตับอยู่แล้ว ค่าจะพุ่งง่ายมาก บางคนเลิกดื่มอย่างเดียว ตัวเลขลดลงได้ 50-100 หน่วยโดยไม่ต้องใช้ยาเลยนะ ถ้ายังดื่มต่อให้กินคลีนแค่ไหน ค่าก็ลงยากและเด้งกลับเร็วด้วยครับ', style: TextStyle(fontSize: 16)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('3. ลดน้ำหนัก 5-10% ของตัวเอง', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                    ),
                    Text('   แค่ลดน้ำหนักเล็กน้อยก็ช่วยให้ร่างกายไวต่ออินซูลินดีขึ้นแล้วครับ ทำให้การเปลี่ยนน้ำตาลเป็นไขมันลดลง คนที่น้ำหนักเกินหรือรอบเอวเกินเกณฑ์ มักมีไตรกลีเซอไรด์สูงร่วมด้วย ลองตั้งเป้าลด 0.5-1 กก. ต่อสัปดาห์ด้วยการคุมอาหารและเดินเร็ววันละ 20-30 นาที จะช่วยลดค่าได้ทั้งไตรกลีเซอไรด์ น้ำตาล และไขมันพอกตับพร้อมกัน', style: TextStyle(fontSize: 16)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('4. เพิ่มโอเมก้า 3 จากปลา', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                    ),
                    Text('   เช่น ปลาทะเลน้ำลึกสัปดาห์ละ 2-3 มื้อ เพราะโอเมก้า 3 ช่วยลดการสร้างไตรกลีเซอไรด์ที่ตับ และลดการอักเสบในหลอดเลือด งานวิจัยพบว่าสามารถลดค่าได้ 20-30% ในบางราย โดยเฉพาะคนที่ค่าเกิน 200-300 mg/dL แต่ต้องทำควบคู่กับการคุมอาหาร ไม่ใช่กินเสริมแล้วพฤติกรรมเดิมเหมือนเดิมนะครับ', style: TextStyle(fontSize: 16)),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('5. คอยออกกำลังกายแบบสม่ำเสมอ', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800)),
                    ),
                    Text('   อยากเน้นแอโรบิกระดับปานกลางครับ เช่น เดินเร็ว ปั่นจักรยาน ว่ายน้ำ อย่างน้อยสัปดาห์ละ 150 นาที การขยับร่างกายช่วยให้กล้ามเนื้อดึงไตรกลีเซอไรด์ไปใช้เป็นพลังงานมากขึ้น ทำให้ระดับในเลือดลดลงชัดเจน แบ่งเดินเอาก็ได้ ไม่ถึงกับต้องโหมหนักออกวันเดียวให้ครบ 150 นาทีนะ ยิ่งเราทำต่อเนื่อง 8-12 สัปดาห์ จะเห็นผลทั้งน้ำหนัก รอบเอว และผลเลือดดีขึ้นพร้อมกันครับ', style: TextStyle(fontSize: 16)),
                    Text('   ไตรกลีเซอไรด์เกิน 200 ไม่ได้แก้ด้วยการเลี่ยงของมันอย่างเดียวนะครับ แต่ต้องจัดการน้ำตาล แป้ง แอลกอฮอล์ น้ำหนัก และการขยับร่างกาย ถ้าค่าเกิน 500 mg/dL หรือมีโรคร่วม เช่น เบาหวาน ควรพบแพทย์เพื่อประเมินการใช้ยา อย่าปล่อยไว้เพราะตัวนี้เงียบ แต่ทำร้ายหลอดเลือดและตับแบบไม่รู้ตัว', style: TextStyle(fontSize: 16)),
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
