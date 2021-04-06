import 'package:flutter/material.dart';

class NotfoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Not Found")),
      body: Center(
        child: Column(
          children: [
            Text("ไม่พบหน้าที่คุณต้องการหา กรุณากลับไปยังหน้าหลัก"),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text(
                "กลับสู่หน้าหลัก",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 50,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
