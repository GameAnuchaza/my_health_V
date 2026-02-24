import 'package:flutter/material.dart';
import 'package:my_health/fun/AQIProvider.dart';
import 'package:my_health/fun/Hiveset.dart';
import 'package:my_health/fun/conwidet.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsProvider>();

    final provinces = [
      "กรุงเทพมหานคร",
      "กระบี่",
      "กาญจนบุรี",
      "กาฬสินธุ์",
      "กำแพงเพชร",
      "ขอนแก่น",
      "จันทบุรี",
      "ฉะเชิงเทรา",
      "ชลบุรี",
      "ชัยนาท",
      "ชัยภูมิ",
      "ชุมพร",
      "เชียงราย",
      "เชียงใหม่",
      "ตรัง",
      "ตราด",
      "ตาก",
      "นครนายก",
      "นครปฐม",
      "นครพนม",
      "นครราชสีมา",
      "นครศรีธรรมราช",
      "นครสวรรค์",
      "นนทบุรี",
      "นราธิวาส",
      "น่าน",
      "บึงกาฬ",
      "บุรีรัมย์",
      "ปทุมธานี",
      "ประจวบคีรีขันธ์",
      "ปราจีนบุรี",
      "ปัตตานี",
      "พระนครศรีอยุธยา",
      "พะเยา",
      "พังงา",
      "พัทลุง",
      "พิจิตร",
      "พิษณุโลก",
      "เพชรบุรี",
      "เพชรบูรณ์",
      "แพร่",
      "ภูเก็ต",
      "มหาสารคาม",
      "มุกดาหาร",
      "แม่ฮ่องสอน",
      "ยโสธร",
      "ยะลา",
      "ร้อยเอ็ด",
      "ระนอง",
      "ระยอง",
      "ราชบุรี",
      "ลพบุรี",
      "ลำปาง",
      "ลำพูน",
      "เลย",
      "ศรีสะเกษ",
      "สกลนคร",
      "สงขลา",
      "สตูล",
      "สมุทรปราการ",
      "สมุทรสงคราม",
      "สมุทรสาคร",
      "สระแก้ว",
      "สระบุรี",
      "สิงห์บุรี",
      "สุโขทัย",
      "สุพรรณบุรี",
      "สุราษฎร์ธานี",
      "สุรินทร์",
      "หนองคาย",
      "หนองบัวลำภู",
      "อ่างทอง",
      "อำนาจเจริญ",
      "อุดรธานี",
      "อุตรดิตถ์",
      "อุทัยธานี",
      "อุบลราชธานี",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    context.read<Conwidet>().goToWidet(0);
                  },
                  icon: Icon(Icons.arrow_back, size: 40),
                ),
              ),
            Padding(padding: EdgeInsets.all(10),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                  offset: Offset(0, 0)
                )
              ]
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
              "เลือกจังหวัด",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            Container(
              width: 300,
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String>(
                value: settings.province,
                isExpanded: true,
                underline: const SizedBox(),
                items: provinces
                    .map(
                      (province) => DropdownMenuItem(
                        value: province,
                        child: Text(province),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    context.read<SettingsProvider>().updateSetting(
                      "province",
                      value,
                    );
                    context.read<AQIProvider>().startAutoFetch(
                      value,
                    ); // รีสตาร์ท fetch ใหม่
                  }
                },
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "จังหวัดปัจจุบัน: ${settings.province}",
              style: const TextStyle(fontSize: 16),
            ),
              ],
            ),
          ),  
          )
          ],
        ),
      ),
    );
  }
}
