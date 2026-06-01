import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final IconData icon;
  final Color iconColor;
  final bool isUnread;
  final bool hasAcceptRejectButtons;
  final bool hasActionLongButton;
  final String? longButtonText;
  final VoidCallback? onAccept;
  final VoidCallback? onReject;
  final VoidCallback? onLongButtonTap;

  const NotificationItem({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.iconColor,
    this.isUnread = false,
    this.hasAcceptRejectButtons = false,
    this.hasActionLongButton = false,
    this.longButtonText,
    this.onAccept,
    this.onReject,
    this.onLongButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // السطر العلوي: الأيقونة → العنوان والوصف → الوقت
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1️⃣ الأيقونة (أقصى اليمين في RTL)
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: iconColor, size: 20),
                ),
                const SizedBox(width: 12),

                // 2️⃣ العنوان والوصف في المنتصف
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (isUnread)
                            Container(
                              margin: const EdgeInsets.only(left: 6),
                              width: 7,
                              height: 7,
                              decoration: const BoxDecoration(
                                color: Color(0xFF00A896),
                                shape: BoxShape.circle,
                              ),
                            ),
                          Flexible(
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),

                // 3️⃣ الوقت (أقصى اليسار في RTL)
                Text(
                  time,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 11,
                    color: Colors.grey.shade400,
                  ),
                ),
              ],
            ),

            // 4️⃣ أزرار قبول / رفض
            if (hasAcceptRejectButtons) ...[
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // زر قبول (أقصى اليمين)
                  SizedBox(
                    height: 35,
                    child: ElevatedButton(
                      onPressed: onAccept,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00A896),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                      ),
                      child: const Text(
                        'قبول الطلب',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // زر رفض
                  SizedBox(
                    height: 35,
                    child: TextButton(
                      onPressed: onReject,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      child: Text(
                        'رفض',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 12,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],

            // 5️⃣ زر الإجراء الطويل العريض
            if (hasActionLongButton) ...[
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 43,
                child: ElevatedButton(
                  onPressed: onLongButtonTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A896),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        longButtonText ?? '',
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // السهم للأمام (يسار في RTL = للأمام)
                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}