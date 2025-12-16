import 'ingredient.dart'; 

class RShop {
  String imgLabel; 
  String imageUrl; 
  String description; 
  List<Ingredient> ingredients;

  // อัปเดต Constructor ให้รับ ingredients
  RShop(this.imageUrl, this.imgLabel, this.description, this.ingredients); 

  static List<RShop> samples = 
  [
    RShop(
      'assets/images/r01.jpg', 
      'ส้มตำไทย', 
      'ส้มตำรสแซ่บ กลมกล่อม เปรี้ยว หวาน เผ็ดลงตัว', 
      // เพิ่มรายการส่วนผสมสำหรับเมนูนี้
      [
        Ingredient(name: 'มะละกอ', quantity: 1, unit: 'ลูก'),
        Ingredient(name: 'น้ำปลา', quantity: 3, unit: 'ช้อนโต๊ะ'),
        Ingredient(name: 'พริก', quantity: 3, unit: 'เม็ด'),
      ]
    ),
    // ... อัปเดต R02, R03, R04 ให้มีรายการส่วนผสมเหมือนกัน ...
    RShop('assets/images/r02.jpg', 'ลาบหมู', 'ลาบหมูรสจัดจ้าน...', [
      Ingredient(name: 'หมู', quantity: 1, unit: 'โล'),
        Ingredient(name: 'น้ำปลา', quantity: 3, unit: 'ช้อนโต๊ะ'),
        Ingredient(name: 'พริก', quantity: 3, unit: 'เม็ด'),
        Ingredient(name: 'มะนาว', quantity: 2, unit: 'ลูก'),
        Ingredient(name: 'ข้าวคั่ว', quantity: 1, unit: 'ช้อนโต๊ะ'),
    ]), 
    RShop('assets/images/r03.jpg', 'กุ้งเผา', 'กุ้งแม่น้ำตัวใหญ่...', []), 
    RShop('assets/images/r04.jpg', 'แกงเขียวหวาน', 'แกงเขียวหวานไก่...', []), 
  ];

}