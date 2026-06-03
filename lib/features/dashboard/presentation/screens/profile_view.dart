import 'package:flutter/material.dart';
import 'package:mutaah_app/core/theme/colors/app_colors.dart';
import 'package:mutaah_app/features/dashboard/presentation/screens/Subscriptions%20view.dart';
import 'package:mutaah_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:mutaah_app/features/dashboard/presentation/screens/Contact_us_view.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final Map<String, List<String>> _gazaData = {
    'محافظة غزة': [
      'غزة المدينة',
      'الشجاعية',
      'الرمال',
      'الزيتون',
      'التفاح',
      'الشيخ رضوان',
      'تل الهوى',
      'الصبرة',
      'الدرج',
      'مخيم الشاطئ',
      'الزهراء',
      'المغراقة',
      'جحر الديك'
    ],
    'محافظة شمال غزة': [
      'جباليا',
      'مخيم جباليا',
      'بيت لاهيا',
      'بيت حانون',
      'العطاطرة',
      'عزبة بيت حانون',
      'القرية البدوية'
    ],
    'المحافظة الوسطى': [
      'دير البلح',
      'النصيرات',
      'مخيم النصيرات',
      'البريج',
      'مخيم البريج',
      'المغازي',
      'مخيم المغازي',
      'الزوايدة',
      'وادي غزة'
    ],
    'محافظة خان يونس': [
      'خان يونس',
      'عبسان الكبيرة',
      'عبسان الجديدة',
      'بني سهيلا',
      'خزاعة',
      'القرارة',
      'معن',
      'السطر الشرقي',
      'السطر الغربي',
      'مخيم خان يونس'
    ],
    'محافظة رفح': [
      'رفح',
      'تل السلطان',
      'الشابورة',
      'الجنينة',
      'خربة العدس',
      'مصبح',
      'النصر',
      'الشوكة',
      'مخيم رفح'
    ],
  };

  String? _selectedGovernorate;
  String? _selectedRegion;

  @override
  Widget build(BuildContext context) {
    bool isGovernorateSelected = _selectedGovernorate != null;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundPage,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          toolbarHeight: 65,
          centerTitle: true,

          // في RTL: leading يظهر على اليمين — سهم العودة
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const DashboardScreen()),
                (route) => false,
              ),
              borderRadius: BorderRadius.circular(50),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF4A5A60),
                  size: 18,
                ),
              ),
            ),
          ),

          title: const Text(
            'حسابي',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A2B32),
            ),
          ),

          // في RTL: actions يظهر على اليسار — أيقونة التعديل
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(
                Icons.edit_outlined,
                color: Color(0xFF00B4BD),
                size: 22,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // الهيدر المتدرج
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 25,
                  left: 20,
                  right: 20,
                  bottom: 40,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: AppColors.primaryGradient,
                  ),
                ),
                child: Column(
                  children: [
                    // الصورة الشخصية
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.35),
                              width: 1.5,
                            ),
                          ),
                          child: const Icon(
                            Icons.person_outline_rounded,
                            color: Colors.white,
                            size: 44,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          // في RTL: left يعني جهة اليسار الفعلي (= نهاية العنصر)
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              color: Color(0xFF00B4BD),
                              size: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      'أحمد محمد سالم',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // شارة نوع الخطة
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFB703),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        // في RTL الـ Row يعكس تلقائياً — لا حاجة لتعديل
                        children: const [
                          Icon(
                            Icons.verified_outlined,
                            color: Color(0xFF1A2B32),
                            size: 13,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'قياسي — الخطة الحالية',
                            style: TextStyle(
                              color: Color(0xFF1A2B32),
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),

                    const Text(
                      'ahmed_salem@',
                      style: TextStyle(
                        color: Colors.white70,
                        fontFamily: 'Cairo',
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // شارة التوثيق
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                            size: 12,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'موثق',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Cairo',
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // كرت الإحصائيات
                    Container(
                      height: 75,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: _statItem(number: '17', title: 'تأجيراتي'),
                          ),
                          Container(
                            width: 1,
                            height: 35,
                            color: Colors.white.withOpacity(0.15),
                          ),
                          Expanded(
                            child: _statItem(number: '5', title: 'منتجاتي'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // الكرت الأبيض
              Container(
                transform: Matrix4.translationValues(0, -20, 0),
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 24,
                  right: 24,
                  bottom: 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'تعديل البيانات',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text1,
                      ),
                    ),
                    const SizedBox(height: 24),

                    _field(
                      label: 'الاسم الكامل',
                      hint: 'أحمد محمد سالم',
                      icon: Icons.badge_outlined,
                    ),
                    const SizedBox(height: 16),

                    _field(
                      label: 'اسم المستخدم',
                      hint: 'ahmed_salem',
                      icon: Icons.alternate_email_rounded,
                    ),
                    const SizedBox(height: 16),

                    _field(
                      label: 'رقم الجوال',
                      hint: '970+ 59X XXX XXXX',
                      icon: Icons.phone_android_rounded,
                    ),
                    const SizedBox(height: 24),

                    // عنوان قسم الموقع
                    Row(
                      // في RTL هذا يعني: الأيقونة على اليمين والنص بجانبها
                      children: const [
                        Icon(
                          Icons.maps_home_work_outlined,
                          color: AppColors.secondary,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'تعديل الموقع السكني',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                            color: AppColors.text1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    _buildDropdownField(
                      hint: 'اختر المحافظة',
                      items: _gazaData.keys.toList(),
                      value: _selectedGovernorate,
                      icon: Icons.location_city_rounded,
                      onChanged: (newGovernorate) {
                        setState(() {
                          _selectedGovernorate = newGovernorate;
                          _selectedRegion = null;
                        });
                      },
                    ),
                    const SizedBox(height: 12),

                    IgnorePointer(
                      ignoring: !isGovernorateSelected,
                      child: Opacity(
                        opacity: isGovernorateSelected ? 1.0 : 0.5,
                        child: _buildDropdownField(
                          hint: 'اختر المنطقة / الحي',
                          items: isGovernorateSelected
                              ? (_gazaData[_selectedGovernorate] ?? [])
                              : [],
                          value: _selectedRegion,
                          icon: Icons.pin_drop_rounded,
                          onChanged: (newRegion) {
                            setState(() {
                              _selectedRegion = newRegion;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    _field(
                      label: 'كلمة السر الجديدة',
                      hint: 'اتركه فارغاً إذا لم تريد التغيير',
                      icon: Icons.lock_outline_rounded,
                      obscure: true,
                    ),
                    const SizedBox(height: 28),

                    // زر حفظ التغييرات
                    Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: AppColors.primaryGradient,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.save_as_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'حفظ التغييرات',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // _infoTile(
                    //   icon: Icons.verified_user_outlined,
                    //   title: 'الهوية والوثائق',
                    //   status: 'موثق',
                    //   statusBg: AppColors.successBg,
                    //   statusColor: AppColors.success,
                    // ),
                    // const SizedBox(height: 12),

                    _infoTile(
                      icon: Icons.card_membership_rounded,
                      title: 'الاشتراكات',
                      status: 'قياسي',
                      statusBg: AppColors.infoBg,
                      statusColor: AppColors.info,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SubscriptionsView()),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // زر تسجيل الخروج
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: AppColors.errorBg,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.error.withOpacity(.12),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout_rounded,
                            color: AppColors.error,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'تسجيل الخروج',
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.error,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String hint,
    required List<String> items,
    required String? value,
    required IconData icon,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundInput,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        isExpanded: true, // ← مهم لمنع الـ overflow
        alignment: Alignment.centerRight,
        dropdownColor: AppColors.backgroundInput,
        icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.text3),
        hint: Text(
          hint,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontFamily: 'Cairo',
            color: AppColors.text3,
            fontSize: 13,
          ),
        ),
        style: const TextStyle(
          fontFamily: 'Cairo',
          color: AppColors.text1,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          // في RTL: prefixIcon تظهر على اليمين تلقائياً
          prefixIcon: Icon(icon, color: AppColors.text3, size: 18),
        ),
        items: items.map<DropdownMenuItem<String>>((String val) {
          return DropdownMenuItem<String>(
            value: val,
            alignment: Alignment.centerRight, // ← النص يبدأ من اليمين
            child: Text(
              val,
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontFamily: 'Cairo'),
            ),
          );
        }).toList(),
      ),
    );
  }

  static Widget _statItem({
    required String number,
    required String title,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 13,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static Widget _field({
    required String label,
    required String hint,
    required IconData icon,
    bool obscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Cairo',
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.text2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundInput,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: TextField(
            obscureText: obscure,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl, // ← الكتابة من اليمين
            decoration: InputDecoration(
              hintText: hint,
              hintTextDirection: TextDirection.rtl, // ← الـ hint من اليمين
              hintStyle: const TextStyle(
                fontFamily: 'Cairo',
                color: AppColors.text3,
                fontSize: 12,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 15,
              ),
              // ← suffixIcon بدل prefixIcon حتى تظهر على اليمين
              suffixIcon: Icon(icon, color: AppColors.text3),
            ),
          ),
        ),
      ],
    );
  }

   Widget _infoTile({
    required IconData icon,
    required String title,
    required String status,
    required Color statusBg,
    required Color statusColor,
     VoidCallback? onTap,
  }) {
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.backgroundCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            // في RTL: أول عنصر = أقصى اليمين
            // اليمين: الأيقونة + العنوان
            Icon(icon, color: AppColors.text2),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                color: AppColors.text1,
              ),
            ),
            const Spacer(),
            // اليسار: شارة الحالة + سهم
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ),
            const SizedBox(width: 6),
            const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 14,
              color: AppColors.text3,
            ),
          ],
        ),
      ),
    );
  }
}
