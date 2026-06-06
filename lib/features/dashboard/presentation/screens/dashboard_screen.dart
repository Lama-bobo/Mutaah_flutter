import 'package:flutter/material.dart';
import 'package:mutaah_app/core/theme/colors/app_colors.dart';
import 'package:mutaah_app/features/dashboard/presentation/screens/home_view.dart';
import 'package:mutaah_app/features/dashboard/presentation/screens/profile_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  // ── index 5 محجوز لصفحة البروفايل (مش ضمن الـ BottomNav) ──
  static const int _profileIndex = 5;

  @override
  Widget build(BuildContext context) {
    final List<Widget> views = [
      // index 0 — الرئيسية
      // ── وقت الـ API: HomeView بتاخذ بيانات المستخدم من UserModel ──
      HomeView(
        onProfileTap: () => setState(() => _currentIndex = _profileIndex),
      ),

      // index 1 — المفضلة
      // ── وقت الـ API: اربطيها بـ GET /api/saved_items ──
      const FavoritesPlaceholder(),

      // index 2 — إضافة منتج
      // ── وقت الـ API: اربطيها بـ POST /api/products ──
      const AddProductPlaceholder(),

      // index 3 — طلباتي
      // ── وقت الـ API: اربطيها بـ GET /api/rental_requests ──
      const MyOrdersPlaceholder(),

      // index 4 — المحادثات
      // ── وقت الـ API: اربطيها بـ GET /api/chats ──
      const ChatsPlaceholder(),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: _currentIndex == _profileIndex
            // ── وقت الـ API: مرري UserModel للـ ProfileView ──
            // ProfileView(user: currentUser)
            ? const ProfileView()
            : views[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // لما نكون على البروفايل (index 5)، نخلي الـ BottomNav محايد
        currentIndex: _currentIndex == _profileIndex ? 0 : _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.backgroundCard,
        selectedItemColor: _currentIndex == _profileIndex
            ? AppColors.text4
            : AppColors.primary,
        unselectedItemColor: AppColors.text4,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Cairo',
          fontSize: 10,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            // ── API: saved_items ──
            icon: Icon(Icons.favorite_rounded),
            label: 'المفضلة',
          ),
          BottomNavigationBarItem(
            // ── API: products ──
            icon: Icon(Icons.add_circle_rounded, size: 28),
            label: 'اضافة',
          ),
          BottomNavigationBarItem(
            // ── API: rental_requests ──
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'طلباتي',
          ),
          BottomNavigationBarItem(
            // ── API: notifications / chats ──
            icon: Icon(Icons.chat_bubble_rounded),
            label: 'المحادثات',
          ),
        ],
      ),
    );
  }
}

// ════════════════════════════════════════════
// Placeholders — كل واحدة بيانها من API مختلف
// ════════════════════════════════════════════

class FavoritesPlaceholder extends StatelessWidget {
  const FavoritesPlaceholder({super.key});
  // ── وقت الـ API ──
  // GET /api/saved_items
  // fields: { id, product_id, user_id }
  @override
  Widget build(BuildContext context) => const Center(
    child: Text(
      'صفحة المفضلة',
      style: TextStyle(fontFamily: 'Cairo', fontSize: 16, color: AppColors.text2),
    ),
  );
}

class AddProductPlaceholder extends StatelessWidget {
  const AddProductPlaceholder({super.key});
  // ── وقت الـ API ──
  // POST /api/products
  // fields: { title, description, category, product_images,
  //           price_per_hour, deposit_amount, status,
  //           available_dates, start_time, end_time, is_all_day }
  @override
  Widget build(BuildContext context) => const Center(
    child: Text(
      'شاشة إضافة منتج جديد لتأجيره',
      style: TextStyle(fontFamily: 'Cairo', fontSize: 16, color: AppColors.text2),
    ),
  );
}

class MyOrdersPlaceholder extends StatelessWidget {
  const MyOrdersPlaceholder({super.key});
  // ── وقت الـ API ──
  // GET /api/rental_requests
  // fields: { id, start_time, end_time, owner_status,
  //           payment_status, grand_total }
  @override
  Widget build(BuildContext context) => const Center(
    child: Text(
      'صفحة طلباتي ومتابعة الإيجار',
      style: TextStyle(fontFamily: 'Cairo', fontSize: 16, color: AppColors.text2),
    ),
  );
}

class ChatsPlaceholder extends StatelessWidget {
  const ChatsPlaceholder({super.key});
  // ── وقت الـ API ──
  // GET /api/notifications
  // fields: { type, title, message, is_read, ref_id }
  @override
  Widget build(BuildContext context) => const Center(
    child: Text(
      'صفحة المحادثات والشات',
      style: TextStyle(fontFamily: 'Cairo', fontSize: 16, color: AppColors.text2),
    ),
  );
}