// test/widget_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart'; 

void main() {
  // ลบโค้ด Counter Test เดิมออกทั้งหมด

  testWidgets('Rshop app displays title and product list', (WidgetTester tester) async {
    // 1. แก้ไขชื่อคลาสให้เป็น RshopApp ที่ถูกต้อง
    await tester.pumpWidget(const RshopApp()); // <<< แก้ไขชื่อ Class

  // 2. ตรวจสอบ Title (อ้างอิงจาก main.dart คือ 'Rshop Shop')
    expect(find.text('Rshop Shop'), findsOneWidget); 
    
    // 3. ตรวจสอบว่า Widget ListView แสดงผล
    expect(find.byType(ListView), findsOneWidget); 
    
    // 4. ตรวจสอบป้ายกำกับสินค้าตัวแรก (อ้างอิงจาก Asset Error คือ 'r01')
    expect(find.text('r01'), findsOneWidget); 
  });
}