import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mutaah_app/core/theme/colors/app_colors.dart';

// ─────────────────────────────────────────────
// صفحة استعادة كلمة السر عبر OTP على الإيميل
// ── وقت الـ API ──
// POST /api/auth/send-otp    → { "email": widget.email }
// POST /api/auth/verify-otp  → { "email": widget.email, "otp": _otpValue }
// POST /api/auth/reset-password → { "email", "otp", "password_hash" }
// الحقل المرتبط بالـ Users table: email
// ─────────────────────────────────────────────

class ForgotPasswordScreen extends StatefulWidget {
  // email ← من جدول Users حقل: email
  final String email;

  const ForgotPasswordScreen({super.key, required this.email});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // ── 6 controllers + focusNodes للخانات ──
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes =
      List.generate(6, (_) => FocusNode());

  late Timer _timer;
  int _secondsRemaining = 2 * 60;
  bool _canResend  = false;
  bool _isLoading  = false;
  String? _errorMessage;

  static const LinearGradient _grad = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: AppColors.primaryGradient,
  );

  @override
  void initState() {
    super.initState();
    _startTimer();
    // فوكس على أول خانة تلقائياً لما الصفحة تفتح
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    for (final c in _controllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  void _startTimer() {
    _canResend = false;
    _secondsRemaining = 2 * 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining <= 0) {
        timer.cancel();
        setState(() => _canResend = true);
      } else {
        setState(() => _secondsRemaining--);
      }
    });
  }

  String get _timerText {
    final m = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final s = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  String get _otpValue => _controllers.map((c) => c.text).join();

  Future<void> _resendCode() async {
    if (!_canResend) return;
    setState(() { _errorMessage = null; _isLoading = true; });

    // ── اربطي هنا بـ API ──
    // POST /api/auth/send-otp
    // body: { "email": widget.email }
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);
    _timer.cancel();
    _startTimer();
    for (final c in _controllers) c.clear();
    _focusNodes[0].requestFocus();
  }

  Future<void> _verifyOtp() async {
    if (_otpValue.length < 6) {
      setState(() => _errorMessage = 'يرجى إدخال الكود كاملاً');
      return;
    }
    setState(() { _isLoading = true; _errorMessage = null; });

    // ── اربطي هنا بـ API ──
    // POST /api/auth/verify-otp
    // body: { "email": widget.email, "otp": _otpValue }
    // if success → روحي لصفحة ResetPasswordScreen
    // if failed  → setState(() => _errorMessage = 'الكود غير صحيح أو منتهي الصلاحية')
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);
    if (mounted) Navigator.pop(context);
  }

  // ── خانة OTP واحدة ──
  Widget _buildOtpBox(int index) {
    final isFilled  = _controllers[index].text.isNotEmpty;
    final isFocused = _focusNodes[index].hasFocus;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 42,   // أصغر شوي عشان تقرب المسافات
      height: 50,
      decoration: BoxDecoration(
        color: isFilled ? AppColors.primaryLight : AppColors.backgroundInput,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isFocused
              ? AppColors.primary
              : isFilled
                  ? AppColors.primaryMid
                  : AppColors.border,
          width: isFocused ? 2 : 1,
        ),
        boxShadow: isFocused
            ? [BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 2),
              )]
            : null,
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode:  _focusNodes[index],
        textAlign:  TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: isFilled ? AppColors.primaryDark : AppColors.text1,
          fontFamily: 'Cairo',
        ),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        onChanged: (value) {
          setState(() {});
          if (value.isNotEmpty) {
            // انتقل للخانة التالية فوراً
            if (index < 5) {
              _focusNodes[index + 1].requestFocus();
            } else {
              // اكتمل الكود — أغلق الكيبورد تلقائياً
              FocusScope.of(context).unfocus();
            }
          } else {
            // عند الحذف — ارجع للخانة السابقة
            if (index > 0) _focusNodes[index - 1].requestFocus();
          }
        },
        // دعم الـ Backspace الصريح
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // إخفاء الإيميل — ah***@gmail.com
    final emailParts  = widget.email.split('@');
    final maskedEmail = emailParts.length == 2
        ? '${emailParts[0].substring(0, (emailParts[0].length / 2).ceil())}***@${emailParts[1]}'
        : widget.email;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.backgroundPage,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // ── أيقونة ──
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: _grad,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 16,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.lock_reset_rounded, color: Colors.white, size: 32),
                  ),

                  const SizedBox(height: 24),

                  // ── الكارد ──
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundCard,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.border),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.06),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        const Text(
                          'استعادة كلمة السر',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: AppColors.text1,
                          ),
                        ),

                        const SizedBox(height: 10),

                        // ── النص — بيعرض الإيميل مش الرقم ──
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 13,
                              color: AppColors.text3,
                              height: 1.6,
                            ),
                            children: [
                              const TextSpan(text: 'أرسلنا كود مكوّن من '),
                              const TextSpan(
                                text: '6 أرقام',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.text2,
                                ),
                              ),
                              const TextSpan(text: ' إلى بريدك الإلكتروني\n'),
                              TextSpan(
                                // email ← من جدول Users
                                text: maskedEmail,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ── الخانات الـ 6 — LTR عشان الأرقام تبدأ من اليسار ──
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(6, (index) => Row(
                              children: [
                                _buildOtpBox(index),
                                if (index < 5) const SizedBox(width: 8),
                              ],
                            )),
                          ),
                        ),

                        const SizedBox(height: 18),

                        // ── رسالة الخطأ ──
                        if (_errorMessage != null) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.error_outline_rounded,
                                  color: AppColors.error, size: 14),
                              const SizedBox(width: 6),
                              Text(
                                _errorMessage!,
                                style: const TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 12,
                                  color: AppColors.error,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],

                        // ── العداد ──
                        Text(
                          'ينتهي الكود بعد $_timerText',
                          style: const TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppColors.error,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // ── إعادة الإرسال ──
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'لم يصلك الكود؟ ',
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 12,
                                color: AppColors.text3,
                              ),
                            ),
                            GestureDetector(
                              onTap: _canResend ? _resendCode : null,
                              child: Text(
                                'إعادة الإرسال',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: _canResend
                                      ? AppColors.primary
                                      : AppColors.text4,
                                  decoration: _canResend
                                      ? TextDecoration.underline
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 22),

                        // ── زر تأكيد الكود ──
                        GestureDetector(
                          onTap: _isLoading ? null : _verifyOtp,
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              gradient: _otpValue.length == 6 ? _grad : null,
                              color: _otpValue.length < 6
                                  ? AppColors.backgroundInput
                                  : null,
                              borderRadius: BorderRadius.circular(12),
                              border: _otpValue.length < 6
                                  ? Border.all(color: AppColors.border)
                                  : null,
                            ),
                            alignment: Alignment.center,
                            child: _isLoading
                                ? const SizedBox(
                                    width: 22,
                                    height: 22,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    'تأكيد الكود',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: _otpValue.length == 6
                                          ? Colors.white
                                          : AppColors.text4,
                                    ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // ── رجوع لتسجيل الدخول ──
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'العودة لتسجيل الدخول',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 13,
                                  color: AppColors.text2,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.arrow_forward_rounded,
                                  size: 16, color: AppColors.text2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}