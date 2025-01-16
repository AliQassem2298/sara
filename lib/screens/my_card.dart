// import 'package:flutter/material.dart';

// class MyCard extends StatelessWidget {
//   const MyCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.cyan,
//         title: const Text('MyCard'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           // استخدام Column لترتيب ListView والكونتينر
//           children: [
//             Expanded(
//               // يسمح لـ ListView بالاستطالة حسب الحاجة
//               child: ListView.builder(
//                 itemBuilder: (context, index) {
//                   return Card(
//                     margin: const EdgeInsets.symmetric(vertical: 10),
//                     child: ListTile(
//                       leading: const CircleAvatar(
//                         radius: 40,
//                         backgroundImage: AssetImage(
//                             'images/Screenshot 2024-11-17 230023.png'),
//                       ),
//                       title:const Text('product.ProductName'),
//                       subtitle:const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Price ${'product.price'}'),
//                           Text('product.description'),
//                         ],
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.cyan),
//                             onPressed: () {
//                               // إجراءات حفظ بيانات المنتج (product)
//                             },
//                             child: const Text('-'),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.cyan), // لون مختلف
//                             onPressed: () {
//                               // إجراءات زر آخر
//                             },
//                             child: const Text('+'),
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 20), // مسافة بين ListView والكونتينر
//             Container(
//               // الكونتينر الخارجي
//               padding: const EdgeInsets.all(10), // إضافة بادينج للكونتينر
//               child: ElevatedButton(
//                 // زر Save
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
//                 onPressed: () {
//                   // إجراءات حفظ جميع المنتجات
//                   //  Navigator.push(context, MaterialPageRoute(builder: (context){
//                   //   return UpDateLocation();
//                   //  }));
//                 },
//                 child: const Text('Save All'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
