import 'package:flutter/material.dart';
import 'package:mutaah_app/core/theme/colors/app_colors.dart';
import '../widgets/notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // إذا في صفحة قبلها (مفتوحة بـ Navigator.push) يظهر زر الرجوع تلقائياً
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

          NotificationItem(
            title: 'طلب استئجار جديد',
            description: 'أحمد محمد يريد استئجار "كاميرا سوني A7 III"',
            time: 'منذ 5 د',
            icon: Icons.assignment_outlined,
            iconColor: AppColors.primary,
            isUnread: true,
            hasAcceptRejectButtons: true,
            onAccept: () {},
            onReject: () {},
          ),

          const NotificationItem(
            title: 'تم استلام مبلغ الرهن',
            description: 'تم احتجاز ₪ 300 داخل المنصة بنجاح',
            time: 'منذ 1 س',
            icon: Icons.lock_outline_rounded,
            iconColor: AppColors.warning,
            isUnread: true,
          ),

          const NotificationItem(
            title: 'تم إعادة المنتج بسلامة',
            description: 'أعادت سمر خالد "المثقاب"',
            time: 'أمس',
            icon: Icons.assignment_turned_in_outlined,
            iconColor: AppColors.success,
            isUnread: false,
          ),

          NotificationItem(
            title: 'تم قبول طلبك!',
            description: 'وافق أحمد على طلب استئجار "كاميرا سوني A7 III"',
            time: '3 أيام',
            icon: Icons.check_circle_outline_rounded,
            iconColor: AppColors.primary,
            isUnread: false,
            hasActionLongButton: true,
            longButtonText: 'اضغط هنا لاستكمال عملية الإيجار',
            onLongButtonTap: () {},
          ),
        ],
      ),
    );
  }
}