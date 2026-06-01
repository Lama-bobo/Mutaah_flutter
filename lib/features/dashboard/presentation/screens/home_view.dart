import 'package:flutter/material.dart';
import 'package:mutaah_app/core/theme/colors/app_colors.dart';
import 'package:mutaah_app/features/dashboard/presentation/screens/notifications_screen.dart';

enum ProductStatus { available, rented, suspended }

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const LinearGradient _grad = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: AppColors.primaryGradient,
  );

  static const Color _border = Color(0xFFE0E9EA);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundPage,
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                // ═══════════════════════════════════════════
                // TOP BAR: يسار جرس | وسط مُتاح | يمين قائمة
                // ═══════════════════════════════════════════
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // 🔔 يسار — جرس الإشعارات (صفحة مستقلة)
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationsScreen(),
                        ),
                      ),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Icon(
                              Icons.notifications_none_rounded,
                              color: AppColors.primary,
                              size: 26,
                            ),
                            Positioned(
                              top: 7,
                              right: 7,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: AppColors.error,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.backgroundCard,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // 中 وسط — اسم المنصة بالـ gradient
                    ShaderMask(
                      shaderCallback: (bounds) => _grad.createShader(bounds),
                      child: const Text(
                        'مُتاح',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // ⋮ يمين — قائمة البروفايل المنسدلة
                    PopupMenuButton<String>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: _border),
                      ),
                      color: AppColors.backgroundCard,
                      elevation: 8,
                      shadowColor: AppColors.primary.withOpacity(0.15),
                      icon: const Icon(
                        Icons.person_outline_rounded,
                        color: AppColors.primary,
                        size: 26,
                      ),
                      onSelected: (value) {
                        switch (value) {
                          case 'profile':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserProfileScreen(),
                              ),
                            );
                            break;
                          case 'contact':
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsScreen()));
                            break;
                          case 'support':
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const SupportScreen()));
                            break;
                          case 'logout':
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        _popupItem(value: 'profile', label: 'الملف الشخصي',        icon: Icons.person_outline_rounded,  color: AppColors.primary),
                        _popupItem(value: 'contact', label: 'تواصل معنا',           icon: Icons.mail_outline_rounded,    color: AppColors.primary),
                        _popupItem(value: 'support', label: 'الدعم الفني والإبلاغ', icon: Icons.support_agent_rounded,   color: AppColors.primary),
                        const PopupMenuDivider(height: 1),
                        _popupItem(value: 'logout',  label: 'تسجيل الخروج',        icon: Icons.logout_rounded,          color: AppColors.error, isDestructive: true),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ═══════════════════════════════════════════
                // حقل البحث
                // ═══════════════════════════════════════════
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundCard,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: _border),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.08),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: TextField(
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 14,
                      color: AppColors.text1,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'ابحث عن أدوات، كاميرات، مولدات...',
                      hintStyle: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 14,
                        color: AppColors.text3,
                      ),
                      prefixIcon: Icon(Icons.search_rounded, color: AppColors.text3, size: 22),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // ═══════════════════════════════════════════
                // أزرار التصنيفات
                // ═══════════════════════════════════════════
                Align(
                  alignment: Alignment.centerRight,
                  child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryButton(label: 'الكل',       icon: Icons.grid_view_rounded,     isActive: true),
                      const SizedBox(width: 10),
                      _buildCategoryButton(label: 'إلكترونيات', icon: Icons.devices_other_rounded, isActive: false),
                      const SizedBox(width: 10),
                      _buildCategoryButton(label: 'أدوات',      icon: Icons.construction_rounded,  isActive: false),
                    ],
                  ),
                  ),
                  ),
                ),

                const SizedBox(height: 24),

                // ═══════════════════════════════════════════
                // قائمة المنتجات
                // ═══════════════════════════════════════════
                _buildProductCard(
                  title: 'مولد كهربائي',
                  location: 'غزة، الرمال',
                  status: ProductStatus.available,
                  price: '40 ₪',
                  period: 'ساعة',
                  imagePath: 'https://images.unsplash.com/photo-1581092160562-40aa08e78837?q=80&w=1000&auto=format&fit=crop',
                ),
                _buildProductCard(
                  title: 'مثقاب كهربائي',
                  location: 'غزة، الصحابة',
                  status: ProductStatus.rented,
                  price: '25 ₪',
                  period: 'ساعة',
                  imagePath: 'https://images.unsplash.com/photo-1504148455328-c376907d081c?q=80&w=1000&auto=format&fit=crop',
                ),
                _buildProductCard(
                  title: 'لابتوب ديل XPS 15',
                  location: 'غزة، النصر',
                  status: ProductStatus.suspended,
                  price: '30 ₪',
                  period: 'ساعة',
                  imagePath: 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?q=80&w=1000&auto=format&fit=crop',
                ),
              ],
            ),
          ),
        ),
      );
    
  }

  // ─── PopupMenuItem مساعد ───
  PopupMenuItem<String> _popupItem({
    required String value,
    required String label,
    required IconData icon,
    required Color color,
    bool isDestructive = false,
  }) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 13,
              fontWeight: isDestructive ? FontWeight.bold : FontWeight.w500,
              color: isDestructive ? AppColors.error : AppColors.text1,
            ),
          ),
          const SizedBox(width: 10),
          Icon(icon, size: 18, color: color),
        ],
      ),
    );
  }

  // ─── زر التصنيف ───
  Widget _buildCategoryButton({
    required String label,
    required IconData icon,
    required bool isActive,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        gradient: isActive ? _grad : null,
        color: isActive ? null : AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(
          color: isActive ? Colors.transparent : _border,
        ),
        boxShadow: isActive
            ? [BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 8, offset: const Offset(0, 3))]
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: isActive ? Colors.white : AppColors.text3),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 13,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? Colors.white : AppColors.text2,
            ),
          ),
        ],
      ),
    );
  }

  // ─── تفاصيل تاغ الحالة ───
  Map<String, dynamic> _getStatusDetails(ProductStatus status) {
    switch (status) {
      case ProductStatus.available:
        return {
          'text': 'متاح',
          'color': AppColors.successBg,
          'textColor': AppColors.success,
          'borderColor': AppColors.success.withOpacity(0.2),
        };
      case ProductStatus.rented:
        return {
          'text': 'مؤجر',
          'color': AppColors.warningBg,
          'textColor': AppColors.warning,
          'borderColor': AppColors.warning.withOpacity(0.2),
        };
      case ProductStatus.suspended:
        return {
          'text': 'مجمد',
          'color': AppColors.backgroundInput,
          'textColor': AppColors.text3,
          'borderColor': _border,
        };
    }
  }

  // ─── كارد المنتج ───
  Widget _buildProductCard({
    required String title,
    required String location,
    required String price,
    required ProductStatus status,
    required String period,
    required String imagePath,
  }) {
    final s = _getStatusDetails(status);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.backgroundCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _border),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
          const BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصورة + تاغ الحالة
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imagePath,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: s['color'],
                    borderRadius: BorderRadius.circular(9999),
                    border: Border.all(color: s['borderColor']),
                  ),
                  child: Text(
                    s['text'],
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: s['textColor'],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // التفاصيل
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.text1,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      location,
                      style: const TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.text3),
                    ),
                    const SizedBox(width: 3),
                    const Icon(Icons.location_on_outlined, size: 13, color: AppColors.text3),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // زر تأجر الآن / غير متاح
                    status == ProductStatus.available
                        ? Container(
                            decoration: BoxDecoration(
                              gradient: _grad,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.35),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 9),
                              ),
                              child: const Text(
                                'تأجر الآن',
                                style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 9),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundInput,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: _border),
                            ),
                            child: Text(
                              status == ProductStatus.rented ? 'مؤجر حالياً' : 'غير متاح',
                              style: const TextStyle(fontFamily: 'Cairo', fontSize: 13, color: AppColors.text3),
                            ),
                          ),

                    // السعر
                    Row(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primaryDark,
                          ),
                        ),
                        const Text(' / ', style: TextStyle(color: AppColors.text4, fontSize: 13)),
                        Text(
                          period,
                          style: const TextStyle(fontFamily: 'Cairo', fontSize: 12, color: AppColors.text3),
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
    );
  }
}

// ─────────────────────────────────────────────
// شاشة البروفايل
// ─────────────────────────────────────────────
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundCard,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'حسابي الشخصي',
          style: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            color: AppColors.text1,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.text1, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text(
          'مرحباً بك في صفحة المستخدم 👤\n(هنا ستكون تفاصيل الحساب والإعدادات)',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 15,
            color: AppColors.text2,
            height: 1.6,
          ),
        ),
      ),
    );
  }
}