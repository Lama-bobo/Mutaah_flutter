import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mutaah_app/features/dashboard/presentation/screens/auth_screen.dart'; 
//import 'package:mutaah_app/features/dashboard/presentation/screens/dashboard_screen.dart';

void main() {
  runApp(const MutahApp());
}

class MutahApp extends StatelessWidget {
  const MutahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'منصة متاح',
      debugShowCheckedModeBanner: false,
      
      // إعدادات تعريب التطبيق بالكامل (من اليمين إلى اليسار تلقائياً)
      locale: const Locale('ar', 'AE'),
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // 🚀 التعديل: الشاشة الأولى التي تفتح فوراً هي شاشة تسجيل الدخول
      home: const AuthScreen(),
    );
  }
}