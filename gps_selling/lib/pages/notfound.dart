import 'package:flutter/material.dart';

import '../locator.dart';
import '../routing/router.dart';
import '../services/navigation_service.dart';

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
              onPressed: () {
                locator<NavigationService>().navigateTo(HomeRoute);
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
