import 'package:flutter/material.dart';
import 'package:mutaah_app/core/theme/colors/app_colors.dart';
import '../widgets/notification_item.dart';

// ── جدول notifications من الـ API ──
// GET /api/notifications
// fields:
//   type    → ['rental_status','payment_update','identity_verification','plan_expired']
//   title   → title
//   message → description (في الـ NotificationItem)
//   is_read → isUnread = !is_read
//   ref_id  → معرّف العنصر المرتبط (منتج أو طلب)
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool canPop = Navigator.canPop(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundCard,
        elevation: 0,
        automaticallyImplyLeading: false,

        // زر الرجوع — يظهر بس لما تكون الصفحة مفتوحة فوق صفحة ثانية
        leading: canPop
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.text1,
                  size: 20,
                ),
                onPressed: () => Navigator.pop(context),
              )
            : null,

        title: Row(
          children: [
            Text(
              'كل الإشعارات',
              style: const TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.text1,
              ),
            ),
            const Spacer(),
            TextButton(
              // ── وقت الـ API: PUT /api/notifications/read-all ──
              // بيحدث is_read = true لكل الإشعارات
              onPressed: () {},
              child: const Text(
                'اعتبر مقروءة',
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 12,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          // type: 'rental_status' | title → title | message → description
          // is_read: false → isUnread: true | ref_id → rental_request id
          // onAccept → PUT /api/rental_requests/{ref_id} { owner_status: 'accepted' }
          // onReject → PUT /api/rental_requests/{ref_id} { owner_status: 'rejected' }
          NotificationItem(
            title: 'طلب استئجار جديد',           // → title
            description: 'أحمد محمد يريد استئجار "كاميرا سوني A7 III"', // → message
            time: 'منذ 5 د',
            icon: Icons.assignment_outlined,
            iconColor: AppColors.primary,
            isUnread: true,                        // → !is_read
            hasAcceptRejectButtons: true,
            onAccept: () {},
            onReject: () {},
          ),

          // type: 'payment_update' | is_read: false → isUnread: true
          const NotificationItem(
            title: 'تم استلام مبلغ الرهن',        // → title
            description: 'تم احتجاز ₪ 300 داخل المنصة بنجاح', // → message
            time: 'منذ 1 س',
            icon: Icons.lock_outline_rounded,
            iconColor: AppColors.warning,
            isUnread: true,                        // → !is_read
          ),

          // type: 'rental_status' | is_read: true → isUnread: false
          const NotificationItem(
            title: 'تم إعادة المنتج بسلامة',       // → title
            description: 'أعادت سمر خالد "المثقاب"', // → message
            time: 'أمس',
            icon: Icons.assignment_turned_in_outlined,
            iconColor: AppColors.success,
            isUnread: false,                       // → !is_read
          ),

          // type: 'rental_status' | is_read: true → isUnread: false
          // ref_id → rental_request id لاستكمال الإيجار
          NotificationItem(
            title: 'تم قبول طلبك!',               // → title
            description: 'وافق أحمد على طلب استئجار "كاميرا سوني A7 III"', // → message
            time: '3 أيام',
            icon: Icons.check_circle_outline_rounded,
            iconColor: AppColors.primary,
            isUnread: false,                       // → !is_read
            hasActionLongButton: true,
            longButtonText: 'اضغط هنا لاستكمال عملية الإيجار',
            onLongButtonTap: () {},                // → navigate using ref_id
          ),
        ],
      ),
    );
  }
}