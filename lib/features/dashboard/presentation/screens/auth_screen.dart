import 'package:flutter/material.dart';
import 'package:mutaah_app/core/theme/colors/app_colors.dart';
import 'package:mutaah_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:mutaah_app/features/dashboard/presentation/screens/forgot_password_screen.dart';

// ─────────────────────────────────────────────
// صفحة شروط الاستخدام
// ─────────────────────────────────────────────
class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundCard,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.text1, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'شروط الاستخدام',
          style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.text1),
        ),
      ),
      body: const Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('شروط الاستخدام', style: TextStyle(fontFamily: 'Cairo', fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.text1)),
              SizedBox(height: 12),
              Text(
                'مرحباً بك في منصة مُتاح. باستخدامك للمنصة فإنك توافق على الشروط والأحكام التالية:\n\n'
                '١. الاستخدام المسموح به\n'
                'يُسمح باستخدام المنصة لأغراض الإيجار المشروع فقط، ويُحظر استخدامها لأي غرض غير قانوني.\n\n'
                '٢. المسؤولية\n'
                'المنصة وسيط بين المؤجر والمستأجر، وليست مسؤولة عن حالة المنتجات أو أي نزاعات بين الطرفين.\n\n'
                '٣. الدفع والرهن\n'
                'يتم احتجاز مبلغ الرهن داخل المنصة وتحريره بعد إعادة المنتج بسلامة.\n\n'
                '٤. التقييمات\n'
                'يحق لكلا الطرفين تقييم بعضهما بعد انتهاء عملية الإيجار.\n\n'
                '٥. إنهاء الحساب\n'
                'تحتفظ المنصة بحق إنهاء أي حساب يخالف هذه الشروط.',
                style: TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.text2, height: 1.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// صفحة سياسة الخصوصية
// ─────────────────────────────────────────────
class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundCard,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.text1, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'سياسة الخصوصية',
          style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.text1),
        ),
      ),
      body: const Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('سياسة الخصوصية', style: TextStyle(fontFamily: 'Cairo', fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.text1)),
              SizedBox(height: 12),
              Text(
                'نحن في منصة مُتاح نحترم خصوصيتك ونلتزم بحماية بياناتك الشخصية:\n\n'
                '١. البيانات التي نجمعها\n'
                'نجمع الاسم ورقم الهاتف والموقع الجغرافي والبيانات المتعلقة بعمليات الإيجار.\n\n'
                '٢. كيف نستخدم بياناتك\n'
                'تُستخدم البيانات فقط لتسهيل عمليات الإيجار وتحسين تجربة المستخدم.\n\n'
                '٣. مشاركة البيانات\n'
                'لا نشارك بياناتك مع أي طرف ثالث إلا بموافقتك أو بموجب القانون.\n\n'
                '٤. حماية البيانات\n'
                'نستخدم أحدث تقنيات التشفير لحماية بياناتك من الوصول غير المصرح به.\n\n'
                '٥. حقوقك\n'
                'يحق لك طلب حذف بياناتك أو تعديلها في أي وقت عبر التواصل مع الدعم الفني.',
                style: TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.text2, height: 1.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// شاشة المصادقة الرئيسية
// ─────────────────────────────────────────────
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginTab = false;

  String? selectedGovernorate;
  String? selectedDistrict;

  final Map<String, List<String>> gazaData = {
    'محافظة غزة': [
      'غزة المدينة', 'الشجاعية', 'الرمال', 'الزيتون', 'التفاح',
      'الشيخ رضوان', 'تل الهوى', 'الصبرة', 'الدرج', 'مخيم الشاطئ',
      'الزهراء', 'المغراقة', 'جحر الديك'
    ],
    'محافظة شمال غزة': [
      'جباليا', 'مخيم جباليا', 'بيت لاهيا', 'بيت حانون',
      'العطاطرة', 'عزبة بيت حانون', 'القرية البدوية'
    ],
    'المحافظة الوسطى': [
      'دير البلح', 'النصيرات', 'مخيم النصيرات', 'البريج',
      'مخيم البريج', 'المغازي', 'مخيم المغازي', 'الزوايدة', 'وادي غزة'
    ],
    'محافظة خان يونس': [
      'خان يونس', 'عبسان الكبيرة', 'عبسان الجديدة', 'بني سهيلا',
      'خزاعة', 'القرارة', 'معن', 'السطر الشرقي', 'السطر الغربي', 'مخيم خان يونس'
    ],
    'محافظة رفح': [
      'رفح', 'تل السلطان', 'الشابورة', 'الجنينة',
      'خربة العدس', 'مصبح', 'النصر', 'الشوكة', 'مخيم رفح'
    ],
  };

  bool isAgreeToTerms = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _emailLoginController = TextEditingController();
  String? _passwordError;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailLoginController.dispose();
    super.dispose();
  }

  void _handleSubmit(BuildContext context) {
    if (!isLoginTab) {
      final pass    = _passwordController.text;
      final confirm = _confirmPasswordController.text;

      // تحقق من التطابق فقط إذا الحقلين مكتوبين
      if (pass.isNotEmpty && confirm.isNotEmpty && pass != confirm) {
        setState(() => _passwordError = 'كلمتا المرور غير متطابقتين ❌');
        return;
      }
      if (!isAgreeToTerms) {
        setState(() => _passwordError = 'يجب الموافقة على شروط الاستخدام أولاً');
        return;
      }
    }
    setState(() => _passwordError = null);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const DashboardScreen()),
    );
  }

  static const LinearGradient _grad = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: AppColors.primaryGradient,
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundPage,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // شعار المنصة
                    ShaderMask(
                      shaderCallback: (bounds) => _grad.createShader(bounds),
                      child: const Text(
                        'مُتاح',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 35,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // الكارد الرئيسي
                    Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundCard,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: AppColors.border),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.05),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // أزرار التبديل
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundPage,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                _buildTabButton(label: 'تسجيل الدخول', isActive: isLoginTab,  onTap: () => setState(() => isLoginTab = true)),
                                _buildTabButton(label: 'إنشاء حساب',   isActive: !isLoginTab, onTap: () => setState(() => isLoginTab = false)),
                              ],
                            ),
                          ),

                          const SizedBox(height: 25),

                          if (!isLoginTab) ...[
                            // ── إنشاء حساب ──
                            _buildLabel('الاسم الكامل'),
                            _buildTextField(hint: 'محمد أحمد الخطيب', icon: Icons.person_outline_rounded),

                            _buildLabel('اسم المستخدم'),
                            _buildTextField(hint: 'ahmed@gmail.com', icon: Icons.alternate_email_rounded, isLtr: true),

                            _buildLabel('رقم الهاتف'),
                            _buildPhoneField(),

                            _buildLabel('المنطقة'),
                            _buildGovernorateDropdown(),
                            const SizedBox(height: 14),
                            _buildDistrictDropdown(),

                            _buildLabel('كلمة المرور'),
                            _buildTextField(
                              hint: '••••••••',
                              icon: Icons.lock_outline_rounded,
                              isPassword: true,
                              isObscure: !isPasswordVisible,
                              controller: _passwordController,
                              onToggleVisibility: () => setState(() => isPasswordVisible = !isPasswordVisible),
                            ),

                            _buildLabel('تأكيد كلمة المرور'),
                            _buildTextField(
                              hint: 'أعد كتابة كلمة المرور',
                              icon: Icons.shield_outlined,
                              isPassword: true,
                              isObscure: !isConfirmPasswordVisible,
                              controller: _confirmPasswordController,
                              onToggleVisibility: () => setState(() => isConfirmPasswordVisible = !isConfirmPasswordVisible),
                            ),

                            // رسالة الخطأ
                            if (_passwordError != null) ...[
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.error_outline_rounded, color: AppColors.error, size: 14),
                                  const SizedBox(width: 6),
                                  Text(
                                    _passwordError!,
                                    style: const TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.error),
                                  ),
                                ],
                              ),
                            ],

                            const SizedBox(height: 14),

                            // Checkbox الشروط مع روابط قابلة للضغط
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Checkbox(
                                    value: isAgreeToTerms,
                                    activeColor: AppColors.primary,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                    onChanged: (val) => setState(() => isAgreeToTerms = val ?? false),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Wrap(
                                    children: [
                                      const Text('أوافق على ', style: TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.text3)),
                                      GestureDetector(
                                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TermsScreen())),
                                        child: const Text(
                                          'شروط الاستخدام',
                                          style: TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const Text(' و ', style: TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.text3)),
                                      GestureDetector(
                                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PrivacyScreen())),
                                        child: const Text(
                                          'سياسة الخصوصية',
                                          style: TextStyle(fontFamily: 'Cairo', fontSize: 11, color: AppColors.primary, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          ] else ...[
                            // ── تسجيل الدخول ──
                            _buildLabel('اسم المستخدم أو الجوال'),
                            _buildTextField(hint: 'أدخل اسم المستخدم أو رقم الجوال', icon: Icons.person_outline_rounded, controller: _emailLoginController),

                            _buildLabel('كلمة المرور'),
                            _buildTextField(
                              hint: '••••••••',
                              icon: Icons.lock_outline_rounded,
                              isPassword: true,
                              isObscure: !isPasswordVisible,
                              onToggleVisibility: () => setState(() => isPasswordVisible = !isPasswordVisible),
                            ),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ForgotPasswordScreen(
                                      email: _emailLoginController.text.trim().isEmpty
                                          ? 'example@email.com'
                                          : _emailLoginController.text.trim(),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'نسيت كلمة المرور؟',
                                  style: TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],

                          const SizedBox(height: 25),

                          // زر الإجراء الرئيسي
                          GestureDetector(
                            onTap: () => _handleSubmit(context),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: _grad,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                isLoginTab ? 'تسجيل الدخول' : 'إنشاء حساب',
                                style: const TextStyle(fontFamily: 'Cairo', fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // سطر التحويل السفلي
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                isLoginTab ? 'ليس لديك حساب؟ ' : 'لديك حساب بالفعل؟ ',
                                style: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.text2),
                              ),
                              GestureDetector(
                                onTap: () => setState(() {
                                  isLoginTab = !isLoginTab;
                                  selectedGovernorate = null;
                                  selectedDistrict = null;
                                }),
                                child: Text(
                                  isLoginTab ? 'إنشاء حساب جديد' : 'سجل دخولك',
                                  style: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, top: 12.0),
      child: Text(
        text,
        style: const TextStyle(fontFamily: 'Cairo', fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.text2),
      ),
    );
  }

  Widget _buildTabButton({required String label, required bool isActive, required VoidCallback onTap}) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: isActive ? _grad : null,
            color: isActive ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 13,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.white : AppColors.text3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGovernorateDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.backgroundInput,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButtonFormField<String>(
        value: selectedGovernorate,
        hint: const Text('اختر المحافظة', style: TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.text3)),
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.text4),
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.location_city_rounded, color: AppColors.text4, size: 20),
        ),
        dropdownColor: AppColors.backgroundCard,
        items: gazaData.keys.map((gov) => DropdownMenuItem(
          value: gov,
          child: Text(gov, style: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.text1)),
        )).toList(),
        onChanged: (value) => setState(() {
          selectedGovernorate = value;
          selectedDistrict = null;
        }),
      ),
    );
  }

  Widget _buildDistrictDropdown() {
    final bool isEnabled = selectedGovernorate != null;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isEnabled ? AppColors.backgroundInput : AppColors.backgroundInput.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButtonFormField<String>(
        value: selectedDistrict,
        disabledHint: const Text('اختر المحافظة أولاً', style: TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.text4)),
        hint: const Text('اختر المنطقة / الحي', style: TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.text3)),
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.text4),
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.location_on_outlined, color: AppColors.text4, size: 20),
        ),
        dropdownColor: AppColors.backgroundCard,
        items: isEnabled
            ? gazaData[selectedGovernorate!]!.map((d) => DropdownMenuItem(
                value: d,
                child: Text(d, style: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.text1)),
              )).toList()
            : null,
        onChanged: isEnabled ? (value) => setState(() => selectedDistrict = value) : null,
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundInput,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr,
        keyboardType: TextInputType.phone,
        style: const TextStyle(fontFamily: 'Cairo', fontSize: 14),
        decoration: InputDecoration(
          hintText: '05X XXX XXXX',
          hintStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.text4),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          suffixIcon: const Icon(Icons.phone_android_rounded, color: AppColors.text4, size: 20),
          prefixIcon: Container(
            width: 95,
            alignment: Alignment.center,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('🇵🇸', style: TextStyle(fontSize: 16)),
                SizedBox(width: 6),
                Text('+970', style: TextStyle(fontFamily: 'Cairo', fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.text2)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool isObscure = false,
    bool isLtr = false,
    TextEditingController? controller,
    VoidCallback? onToggleVisibility,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundInput,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        controller: controller,
        textAlign: isLtr ? TextAlign.left : TextAlign.right,
        textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
        obscureText: isPassword ? isObscure : false,
        style: const TextStyle(fontFamily: 'Cairo', fontSize: 13),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.text4),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          suffixIcon: Icon(icon, color: AppColors.text4, size: 20),
          prefixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: AppColors.text4,
                    size: 18,
                  ),
                  onPressed: onToggleVisibility,
                )
              : null,
        ),
      ),
    );
  }
}