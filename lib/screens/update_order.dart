import 'package:flutter/material.dart';

class UpdateOrder extends StatelessWidget {
  final String productImage;
  final String productName;

  const UpdateOrder({super.key, required this.productImage, required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Order'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: 
                Row(
                  children: [
                    ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // إضافة استجابة عند النقر على أيقونة X
                          },
                          child: Container(
                          
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            
                            padding: const EdgeInsets.all(5),
                            
                            child: 
                            const Icon(Icons.clear, color: Colors.red,
                            ),
                              
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(productImage, width: 80), 
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productName, style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                // عملية زيادة الكمية
                              },
                              child: const Icon(Icons.add),
                            ),
                            const SizedBox(width: 8),
                            const Text('Quantity'),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                // عملية نقص الكمية
                              },
                              child: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
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
