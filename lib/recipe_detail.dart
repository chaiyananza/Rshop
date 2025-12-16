import 'package:flutter/material.dart';
import 'models/Rshop.dart'; // โมเดลหลักของสูตรอาหาร (คุณกำหนดเอง)
import 'models/ingredient.dart'; // โมเดลสำหรับส่วนผสม (คุณกำหนดเอง)

// ----------------------------------------------------------------------
// 1. RecipeDetail: StatefulWidget
// ----------------------------------------------------------------------

class RecipeDetail extends StatefulWidget {
  final RShop recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

// ----------------------------------------------------------------------
// 2. _RecipeDetailState: State Class
// ----------------------------------------------------------------------

class _RecipeDetailState extends State<RecipeDetail> {
  // สถานะสำหรับเก็บจำนวนเสิร์ฟ (ค่าเริ่มต้นคือ 1)
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.imgLabel)),

      // ใช้ SingleChildScrollView เพื่อป้องกัน Overflow เมื่อแป้นพิมพ์ขึ้น
      // หรือเมื่อเนื้อหามีความยาวมาก
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 1. รูปภาพหลัก (Image Widget)
            Image(
              image: AssetImage(widget.recipe.imageUrl),
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),

            // 2. เนื้อหาสูตร (Padding)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // ชื่อสูตร (ตามที่เห็นในรูปภาพ 1000009490.jpg)
                  Text(
                    widget.recipe.imgLabel,
                    style: const TextStyle(
                      fontSize: 24.0, // ตามรูปภาพ
                      fontWeight: FontWeight.bold, // ตามรูปภาพ
                    ),
                  ),

                  const SizedBox(
                    height: 20.0,
                  ), // SizedBox(height: 20.0) ตามรูปภาพ
                  // คำอธิบายสูตร (Text Widget)
                  Text(
                    widget.recipe.description,
                    style: const TextStyle(fontSize: 16.0),
                  ),

                  const SizedBox(
                    height: 20.0,
                  ), // SizedBox(height: 20) ตามรูปภาพ
                  // 3. Slider Widget สำหรับปรับจำนวนเสิร์ฟ
                  // แสดงจำนวนเสิร์ฟปัจจุบัน
                  Text(
                    'Serving Size: $_sliderVal',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10.0),

                  // Slider
                  Slider(
                    min: 1,
                    max: 5,
                    divisions: 9, // มี 10 ค่า (1 ถึง 10)
                    label: '$_sliderVal servings',
                    value: _sliderVal.toDouble(),
                    onChanged: (newValue) {
                      setState(() {
                        // อัปเดตสถานะ (State) และทำให้ UI ถูกวาดใหม่
                        _sliderVal = newValue.round();
                      });
                    },
                  ),

                  const SizedBox(height: 20.0),

                  // 4. รายการส่วนผสม (Ingredients List)
                  const Text(
                    'Ingredients Required:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10.0),

                  // ใช้ Column แทน ListView.builder ใน SingleChildScrollView
                  // เพื่อหลีกเลี่ยงปัญหาความสูง (หรือใช้ Expanded ถ้าเปลี่ยนเป็น Column หลัก)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.recipe.ingredients.map((ingredient) {
                      final adjustedQuantity = ingredient.quantity * _sliderVal;

                      // ใช้ Text เพื่อแสดงแต่ละส่วนผสม
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          // แสดงผลลัพธ์: ปริมาณ x จำนวนเสิร์ฟ + หน่วย + ชื่อ
                          '${adjustedQuantity} ${ingredient.unit} ${ingredient.name}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
