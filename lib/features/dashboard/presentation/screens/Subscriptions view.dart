import 'package:flutter/material.dart';
import 'package:mutaah_app/core/theme/colors/app_colors.dart';

class SubscriptionsView extends StatelessWidget {
  const SubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundPage,

        // ✅ AppBar ثابت فوق عند السكرول
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
            'الاشتراكات',
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                // العنوان الرئيسي
                const Text(
                  'اختر خطتك',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A2B32),
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'جميع الخطط تشمل الوصول الكامل للمنصة',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 13,
                    color: Color(0xFF8A9EA7),
                  ),
                ),
                const SizedBox(height: 24),

                // ✅ كرت قياسي (الخطة الحالية)
                _PlanCard(
                  planLabel: 'قياسي',
                  price: 'مجاناً',
                  priceSize: 36,
                  isCurrent: true,
                  isHighlighted: false,
                  features: const [
                    _Feature(text: 'إضافة منتج واحد/شهرياً', available: true),
                    _Feature(text: 'استئجار حتى 5 منتجات', available: true),
                    _Feature(text: 'تقارير تفصيلية', available: false),
                    _Feature(text: 'عمولة مخفضة', available: false),
                  ],
                  buttonLabel: 'خطتك الحالية',
                  onTap: null,
                ),
                const SizedBox(height: 20),

                // ✅ كرت PLUS (الأكثر شيوعاً)
                _PlanCard(
                  planLabel: 'PLUS',
                  price: '₪29',
                  priceSubtitle: 'شهرياً',
                  isCurrent: false,
                  isHighlighted: true,
                  isDark: false,
                  badgeText: '⭐ الأكثر شيوعاً',
                  features: const [
                    _Feature(text: 'إضافة حتى 3 منتجات', available: true),
                    _Feature(text: 'استئجار حتى 10 منتجات', available: true),
                    _Feature(text: 'عمولة مخفضة', available: true),
                    _Feature(text: 'تقارير تفصيلية', available: false),
                  ],
                  buttonLabel: 'اشترك الآن',
                  buttonGradient: true,
                  onTap: () {},
                ),
                const SizedBox(height: 20),

                // ✅ كرت PRO
                _PlanCard(
                  planLabel: 'PRO',
                  price: '₪69',
                  priceSubtitle: 'شهرياً',
                  isCurrent: false,
                  isHighlighted: true,
                  isDark: false,
                  features: const [
                    _Feature(text: 'إضافة منتجات غير محدودة', available: true),
                    _Feature(text: 'استئجار غير محدود', available: true),
                    _Feature(text: 'عمولة مخفضة جداً', available: true),
                    _Feature(text: 'تقارير تفصيلية متقدمة', available: true),
                  ],
                  buttonLabel: 'اشترك الآن',
                  buttonGradient: true,
                  onTap: () {},
                ),

                const SizedBox(height: 30),
                 const Text(
                  'جميع الاشتراكات تجدد شهرياً بشكل تلقائي يمكن الالغاء في اي وقت',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 13,
                    color: Color(0xFF8A9EA7),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════
// كرت الخطة
// ══════════════════════════════════════
class _PlanCard extends StatelessWidget {
  final String planLabel;
  final String price;
  final double priceSize;
  final String? priceSubtitle;
  final bool isCurrent;
  final bool isHighlighted;
  final bool isDark;
  final String? badgeText;
  final List<_Feature> features;
  final String buttonLabel;
  final bool buttonGradient;
  final VoidCallback? onTap;

  const _PlanCard({
    required this.planLabel,
    required this.price,
    this.priceSize = 32,
    this.priceSubtitle,
    required this.isCurrent,
    required this.isHighlighted,
    this.isDark = false,
    this.badgeText,
    required this.features,
    required this.buttonLabel,
    this.buttonGradient = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = isDark ? const Color(0xFF1A2B32) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1A2B32);
    final subTextColor = isDark ? Colors.white60 : const Color(0xFF8A9EA7);
    final borderColor = isHighlighted
        ? const Color(0xFF00B4BD)
        : isDark
            ? Colors.transparent
            : const Color(0xFFE8EFF2);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: isHighlighted ? 1.5 : 1),
            boxShadow: isHighlighted
                ? [
                    BoxShadow(
                      color: const Color(0xFF00B4BD).withOpacity(0.15),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    )
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    )
                  ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // اسم الخطة
                Text(
                  planLabel,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: isHighlighted
                        ? const Color(0xFF00B4BD)
                        : isDark
                            ? const Color(0xFF00B4BD)
                            : const Color(0xFF8A9EA7),
                  ),
                ),
                const SizedBox(height: 4),

                // السعر
                Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      price,
      style: TextStyle(
        fontFamily: 'Cairo',
        fontSize: priceSize,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    ),
    if (priceSubtitle != null) ...[
      const SizedBox(width: 4),
      Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          priceSubtitle!,
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 13,
            color: subTextColor,
          ),
        ),
      ),
    ],
  ],
),

                const SizedBox(height: 12),
                Divider(color: isDark ? Colors.white12 : const Color(0xFFE8EFF2)),
                const SizedBox(height: 12),

                // المميزات في شبكة 2 × n
                _buildFeaturesGrid(features, subTextColor),
                const SizedBox(height: 20),

                // الزر
                _buildButton(),
              ],
            ),
          ),
        ),

        // شارة "الأكثر شيوعاً"
        if (badgeText != null)
          Positioned(
            top: -14,
            right: 0,
            left: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: AppColors.primaryGradient,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  badgeText!,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFeaturesGrid(List<_Feature> features, Color subTextColor) {
    final List<Widget> rows = [];
    for (int i = 0; i < features.length; i += 2) {
      final left = features[i];
      final right = i + 1 < features.length ? features[i + 1] : null;
      rows.add(
        Row(
          children: [
            if (right != null)
              Expanded(child: _featureItem(right, subTextColor)),
            if (right != null) const SizedBox(width: 8),
            Expanded(child: _featureItem(left, subTextColor)),
          ],
        ),
      );
      if (i + 2 < features.length) rows.add(const SizedBox(height: 8));
    }
    return Column(children: rows);
  }

  Widget _featureItem(_Feature feature, Color subTextColor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          feature.available
              ? Icons.check_circle_outline_rounded
              : Icons.cancel_outlined,
          size: 15,
          color: feature.available
              ? const Color(0xFF00B4BD)
              : const Color(0xFFCDD5D9),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            feature.text,
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 11,
              color: feature.available ? subTextColor : const Color(0xFFCDD5D9),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildButton() {
    if (isCurrent) {
      return Container(
        width: double.infinity,
        height: 46,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F5F7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE0E8EC)),
        ),
        child: const Center(
          child: Text(
            'خطتك الحالية',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF8A9EA7),
            ),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 46,
      decoration: BoxDecoration(
        gradient: buttonGradient
            ? const LinearGradient(colors: AppColors.primaryGradient)
            : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Center(
            child: Text(
              buttonLabel,
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════
// موديل المميزة
// ══════════════════════════════════════
class _Feature {
  final String text;
  final bool available;
  const _Feature({required this.text, required this.available});
}