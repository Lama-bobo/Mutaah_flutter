import 'package:flutter/material.dart';
import 'package:mutaah_app/core/theme/colors/app_colors.dart';

class SupportView extends StatefulWidget {
  const SupportView({super.key});

  @override
  State<SupportView> createState() => _SupportViewState();
}

class _SupportViewState extends State<SupportView> {
  final List<Map<String, String>> _faqs = [
    {
      'question': 'كيف أضمن حقي عند تأجير غرضي الخاص؟',
      'answer':
          'تضمن المنصة حقك عبر نظام الرهن التأميني الذي تحتجز قبل الاستلام، بالإضافة إلى توثيق هوية المستأجر وتسجيل كامل تفاصيل العملية.',
    },
    {
      'question': 'ما هي رسوم العمولة التي تأخذها المنصة؟',
      'answer':
          'تأخذ المنصة عمولة بسيطة على كل عملية تأجير ناجحة، وتختلف النسبة حسب نوع الخطة المشترك بها.',
    },
    {
      'question': 'ماذا أفعل في حال تأخر المستأجر عن الموعد؟',
      'answer':
          'يمكنك التواصل مع المستأجر عبر المحادثات داخل التطبيق، وفي حال استمرار التأخير يحق لك رفع بلاغ من خلال قسم الدعم.',
    },
    {
      'question': 'كيف يتم إعادة مبلغ الرهن؟',
      'answer':
          'يتم إعادة مبلغ الرهن تلقائياً خلال 24 ساعة من تأكيد استلام الغرض بحالة سليمة.',
    },
    {
      'question': 'ماذا لو تضرر الغرض أثناء التأجير؟',
      'answer':
          'في حال تضرر الغرض يحق للمؤجر المطالبة بالتعويض من مبلغ الرهن، ويمكن فتح تذكرة دعم لمراجعة الحالة.',
    },
  ];

  int? _expandedIndex;

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
            'الدعم الفني',
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

                const Text(
                  'كيف يمكننا مساعدتك؟',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A2B32),
                  ),
                ),
                const SizedBox(height: 20),

                // ✅ الأسئلة الشائعة
                ...List.generate(_faqs.length, (index) {
                  final isExpanded = _expandedIndex == index;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _expandedIndex = isExpanded ? null : index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isExpanded
                                ? const Color(0xFF00B4BD)
                                : AppColors.border,
                            width: isExpanded ? 1.5 : 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // ✅ الأيقونة أول = تظهر على اليسار في RTL
                                  Icon(
                                    isExpanded
                                        ? Icons.keyboard_arrow_up_rounded
                                        : Icons.keyboard_arrow_down_rounded,
                                    color: isExpanded
                                        ? const Color(0xFF00B4BD)
                                        : AppColors.text3,
                                    size: 22,
                                  ),
                                  const SizedBox(width: 8),
                                  // ✅ النص بعدها = يظهر على اليمين
                                  Flexible(
                                    child: Text(
                                      _faqs[index]['question']!,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        fontSize: 14,
                                        fontWeight: isExpanded
                                            ? FontWeight.bold
                                            : FontWeight.w600,
                                        color: isExpanded
                                            ? const Color(0xFF1A2B32)
                                            : AppColors.text1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              if (isExpanded) ...[
                                const SizedBox(height: 10),
                                Divider(color: AppColors.border, height: 1),
                                const SizedBox(height: 10),
                                Text(
                                  _faqs[index]['answer']!,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontFamily: 'Cairo',
                                    fontSize: 13,
                                    color: Color(0xFF6A7E85),
                                    height: 1.7,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),

                const SizedBox(height: 24),

                // ✅ كرت فتح تذكرة
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F5F7),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'لم تجد حلاً لمشكلتك؟',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 14,
                          color: Color(0xFF6A7E85),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Container(
                        width: double.infinity,
                        height: 50,
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
                                  Icons.confirmation_number_outlined,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'فتح تذكرة دعم مباشر',
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
}