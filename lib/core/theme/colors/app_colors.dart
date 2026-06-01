import 'package:flutter/material.dart';
 
class AppColors {
  //  الألوان الرئيسية — Primary Colors
  static const Color primary      = Color(0xFF00BCD4);
  static const Color primaryDark  = Color(0xFF0097A7);
  static const Color primaryLight = Color(0xFFE0F7FA);
  static const Color primaryMid   = Color(0xFFB2EBF2);
  static const Color secondary    = Color(0xFF26A69A);
  static const Color accentGreen  = Color(0xFF43A047);
  static const Color accentTeal   = Color(0xFF00897B);
 
  // Gradient الرئيسي — للأزرار واللوجو
  static const List<Color> primaryGradient = [
    Color(0xFF00BCD4),
    Color(0xFF26A69A),
    Color(0xFF43A047),
  ];
 
  // ألوان الخلفيات
  static const Color backgroundPage  = Color(0xFFF8FAFB); // خلفية الصفحة
  static const Color backgroundCard  = Color(0xFFFFFFFF); // الكاردات والمودالز
  static const Color backgroundInput = Color(0xFFF0F4F5); // الإنبوتات
 
  //  البوردرات
  static const Color border  = Color(0xFFE0E9EA); // الفاصلات العادية
  static const Color border2 = Color(0xFFD0E4E6); // بوردر أكثر وضوحاً
 
  //  ألوان النصوص
  static const Color text1 = Color(0xFF1A2B2C); // النصوص الرئيسية
  static const Color text2 = Color(0xFF4A6566); // النصوص الثانوية
  static const Color text3 = Color(0xFF7A9596); // التلميحات والـ Placeholders
  static const Color text4 = Color(0xFF9BAFB0); // Labels، Disabled
 
  //  ألوان الحالات — Status Colors
  static const Color success   = Color(0xFF43A047);
  static const Color successBg = Color(0xFFE8F5E9);
  static const Color warning   = Color(0xFFFB8C00);
  static const Color warningBg = Color(0xFFFFF3E0);
  static const Color error     = Color(0xFFE53935);
  static const Color errorBg   = Color(0xFFFFEBEE);
  static const Color info      = Color(0xFF1E88E5);
  static const Color infoBg    = Color(0xFFE3F2FD);
}