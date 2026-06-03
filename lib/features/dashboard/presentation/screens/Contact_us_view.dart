import 'package:flutter/material.dart';
import 'package:mutaah_app/core/theme/colors/app_colors.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
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
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () => Navigator.pop(context),
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
            'تواصل معنا',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A2B32),
            ),
          ),
        ),

        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),

                const Center(
                  child: Text(
                    'اترك لنا رسالة',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A2B32),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                _contactCard(
                  icon: Icons.email_outlined,
                  label: 'البريد الإلكتروني',
                  value: 'support@mutaah.ps',
                ),
                const SizedBox(height: 10),

                _contactCard(
                  icon: Icons.phone_android_rounded,
                  label: 'رقم الهاتف',
                  value: '+970 59X XXX XXX',
                ),
                const SizedBox(height: 10),

                _contactCard(
                  icon: Icons.location_on_outlined,
                  label: 'المقر الرئيسي',
                  value: 'فلسطين — غزة',
                ),
                const SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _formLabel('الاسم'),
                      const SizedBox(height: 8),
                      _inputField(hint: 'اسمك الكريم', icon: Icons.person_outline_rounded),
                      const SizedBox(height: 16),

                      _formLabel('الموضوع'),
                      const SizedBox(height: 8),
                      _inputField(hint: 'عن ماذا تود الاستفسار؟', icon: Icons.subject_rounded),
                      const SizedBox(height: 16),

                      _formLabel('الرسالة'),
                      const SizedBox(height: 8),
                      _messageField(),
                      const SizedBox(height: 24),

                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: AppColors.primaryGradient),
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
                                Icon(Icons.send_rounded, color: Colors.white, size: 18),
                                SizedBox(width: 8),
                                Text(
                                  'إرسال الرسالة',
                                  style: TextStyle(
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _contactCard({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF8F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFCCEEF0)),
      ),
      child: Row(
        children: [
          // ✅ في RTL: أول عنصر = اليمين — النص على اليمين
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 11,
                  color: Color(0xFF8A9EA7),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00B4BD),
                ),
              ),
            ],
          ),
          const Spacer(),
          // ✅ الأيقونة على اليسار
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF00B4BD).withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF00B4BD), size: 18),
          ),
        ],
      ),
    );
  }

  Widget _formLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontFamily: 'Cairo',
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Color(0xFF3A4A50),
      ),
    );
  }

  Widget _inputField({required String hint, required IconData icon}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundInput,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: hint,
          hintTextDirection: TextDirection.rtl,
          hintStyle: const TextStyle(
            fontFamily: 'Cairo',
            color: AppColors.text3,
            fontSize: 13,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          // ✅ suffixIcon = يظهر على اليمين في RTL
          suffixIcon: Icon(icon, color: AppColors.text3, size: 18),
        ),
      ),
    );
  }

  Widget _messageField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundInput,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: TextField(
        maxLines: 5,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        decoration: const InputDecoration(
          hintText: 'اكتب تفاصيل رسالتك هنا...',
          hintTextDirection: TextDirection.rtl,
          hintStyle: TextStyle(
            fontFamily: 'Cairo',
            color: AppColors.text3,
            fontSize: 13,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}