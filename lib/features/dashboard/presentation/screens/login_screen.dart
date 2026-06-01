import 'package:flutter/material.dart';
import 'package:mutaah_app/core/theme/colors/app_colors.dart';
import 'package:mutaah_app/features/dashboard/presentation/screens/dashboard_screen.dart'; // تأكدي من مسار ملف الداشبورد عندكِ

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // متغير لتحديد الشاشة الحالية: true تعني تسجيل دخول، false تعني إنشاء حساب
  bool _isLoginTab = true;

  // متغيرات إخفاء وإظهار كلمات المرور
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // خلفية بيضاء صافية وملائمة للتصميم الحديث
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              
              // 1️⃣ اسم المنصة "مُتاح" بلون مدرج فخم (Gradient) 🌟
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [
                    Color(0xFF004D40), // تركواز غامق جداً
                    Color(0xFF00897B), // تركواز متوسط الإضاءة
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ).createShader(bounds),
                child: const Text(
                  'مُتاح',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // ضروري لإظهار التدرج
                  ),
                ),
              ),
              
              const SizedBox(height: 15),

              // 2️⃣ نصوص الترحيب الثابتة تحت الشعار مباشرة
              const Text(
                'أهلاً بك في مُتاح',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.text1,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'منصة التأجير الأولى لتلبية كافة احتياجاتك',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 13,
                  color: AppColors.text3,
                ),
              ),
              
              const SizedBox(height: 35),

              // 3️⃣ السويتش الذكي (التدبيل بين تسجيل الدخول وإنشاء حساب) 🔄
              Container(
                height: 55,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7F7), // رمادي خفيف وناعم جداً للخلفية
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // زر إنشاء حساب
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isLoginTab = false),
                        child: Container(
                          decoration: BoxDecoration(
                            color: !_isLoginTab ? AppColors.primary : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'إنشاء حساب',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: !_isLoginTab ? Colors.white : AppColors.text3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    // زر تسجيل الدخول
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isLoginTab = true),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _isLoginTab ? AppColors.primary : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'تسجيل الدخول',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: _isLoginTab ? Colors.white : AppColors.text3,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              // 4️⃣ عرض الحقول ديناميكياً بناءً على السويتش المختار 🔀
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300), // أنيميشن ناعم أثناء التبديل
                child: _isLoginTab ? _buildLoginFields() : _buildRegisterFields(),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 أقسام حقول تسجيل الدخول
  Widget _buildLoginFields() {
    return Column(
      key: const ValueKey('LoginFields'),
      children: [
        _buildTextField(hint: 'اسم المستخدم أو رقم الجوال', icon: Icons.person_outline_rounded),
        const SizedBox(height: 16),
        _buildTextField(
          hint: 'كلمة المرور',
          icon: Icons.lock_outline_rounded,
          isPassword: true,
          isPasswordVisible: _isPasswordVisible,
          onToggleVisible: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
        ),
        
        // نسيت كلمة المرور
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'نسيت كلمة المرور؟',
              style: TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 16),
        
        // زر المتابعة للدخول
        _buildActionButton(label: 'تسجيل الدخول', onTap: () {Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()),
            );}),
        const SizedBox(height: 24),
        
        // الدخول بجوجل
        _buildGoogleOption(),
      ],
    );
  }

  // 🔹 أقسام حقول إنشاء حساب جديد
  Widget _buildRegisterFields() {
    return Column(
      key: const ValueKey('RegisterFields'),
      children: [
        _buildTextField(hint: 'الاسم كاملاً', icon: Icons.badge_outlined),
        const SizedBox(height: 16),
        _buildTextField(hint: 'رقم الجوال', icon: Icons.phone_android_outlined),
        const SizedBox(height: 16),
        _buildTextField(hint: 'البريد الإلكتروني (اختياري)', icon: Icons.mail_outline_rounded),
        const SizedBox(height: 16),
        _buildTextField(
          hint: 'كلمة المرور',
          icon: Icons.lock_outline_rounded,
          isPassword: true,
          isPasswordVisible: _isPasswordVisible,
          onToggleVisible: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
        ),
        const SizedBox(height: 16),
        _buildTextField(
          hint: 'تأكيد كلمة المرور',
          icon: Icons.lock_clock_outlined,
          isPassword: true,
          isPasswordVisible: _isConfirmPasswordVisible,
          onToggleVisible: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
        ),
        const SizedBox(height: 30),
        
        // زر المتابعة للتسجيل
        _buildActionButton(label: 'تأكيد وإنشاء الحساب', onTap: () {}),
        const SizedBox(height: 24),
        
        // التسجيل بجوجل
        _buildGoogleOption(),
      ],
    );
  }

  //  دالة بناء حقول الإدخال الموحدة والراقية
  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool isPasswordVisible = false,
    VoidCallback? onToggleVisible,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F7F7), // رمادي ناعم جداً متناسق مع السويتش
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        textAlign: TextAlign.right, // محاذاة النص العربي لليمين
        obscureText: isPassword && !isPasswordVisible,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.text3),
          prefixIcon: isPassword 
            ? IconButton(
                icon: Icon(isPasswordVisible ? Icons.visibility_rounded : Icons.visibility_off_rounded, color: AppColors.text3, size: 18),
                onPressed: onToggleVisible,
              )
            : null,
          suffixIcon: Icon(icon, color: AppColors.text3, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }

  // 🛠️ دالة بناء الأزرار الأساسية الفخمة
  Widget _buildActionButton({required String label, required VoidCallback onTap}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(fontFamily: 'Cairo', fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  // 🛠️ دالة خيار تسجيل جوجل الفخم السفلي
  Widget _buildGoogleOption() {
    return Column(
      children: [
        const Text(
          'أو المتابعة باستخدام',
          style: TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.text4),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_Color_Icon.svg/1200px-Google_Color_Icon.svg.png',
            height: 24,
            width: 24,
          ),
        ),
      ],
    );
  }
}