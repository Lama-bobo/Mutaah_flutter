import 'package:flutter/material.dart';
import 'package:mutaah_app/core/theme/colors/app_colors.dart';
import 'package:mutaah_app/features/dashboard/presentation/screens/home_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _views = [
    const HomeView(),
    const FavoritesPlaceholder(),
    const AddProductPlaceholder(),
    const MyOrdersPlaceholder(),
    const ChatsPlaceholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,

      body: SafeArea(
        child: _views[_currentIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.backgroundCard,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.text4,
        selectedLabelStyle: const TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold, fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontFamily: 'Cairo', fontSize: 10),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded),              label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded),           label: 'المفضلة'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_rounded, size: 28), label: 'اضافة'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_rounded),       label: 'طلباتي'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_rounded),        label: 'المحادثات'),
        ],
      ),
    );
  }
}

class FavoritesPlaceholder extends StatelessWidget {
  const FavoritesPlaceholder({super.key});
  @override
  Widget build(BuildContext context) => const Center(
    child: Text('صفحة المفضلة', style: TextStyle(fontFamily: 'Cairo', fontSize: 16, color: AppColors.text2)),
  );
}

class AddProductPlaceholder extends StatelessWidget {
  const AddProductPlaceholder({super.key});
  @override
  Widget build(BuildContext context) => const Center(
    child: Text('شاشة إضافة منتج جديد لتأجيره', style: TextStyle(fontFamily: 'Cairo', fontSize: 16, color: AppColors.text2)),
  );
}

class MyOrdersPlaceholder extends StatelessWidget {
  const MyOrdersPlaceholder({super.key});
  @override
  Widget build(BuildContext context) => const Center(
    child: Text('صفحة طلباتي ومتابعة الإيجار', style: TextStyle(fontFamily: 'Cairo', fontSize: 16, color: AppColors.text2)),
  );
}

class ChatsPlaceholder extends StatelessWidget {
  const ChatsPlaceholder({super.key});
  @override
  Widget build(BuildContext context) => const Center(
    child: Text('صفحة المحادثات والشات', style: TextStyle(fontFamily: 'Cairo', fontSize: 16, color: AppColors.text2)),
  );
}