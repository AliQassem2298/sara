import 'package:flutter/material.dart';

class UpdateLocation extends StatefulWidget {
  final String? initialAddress; // العنوان الحالي (اختياري)
  final Function(String) onSave; // دالة تُنفّذ عند الحفظ

  const UpdateLocation({super.key, this.initialAddress, required this.onSave});

  @override
  State<UpdateLocation> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<UpdateLocation> {
  final _formKey = GlobalKey<FormState>();
  String? _newAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تعديل العنوان')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.initialAddress,
                decoration: const InputDecoration(labelText: 'NewLocation'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال عنوان';
                  }
                  return null;
                },
                onSaved: (value) => _newAddress = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.onSave(_newAddress!); // حفظ العنوان الجديد
                    Navigator.pop(context); // إغلاق الشاشة
                  }
                },
                child: const Text('حفظ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
