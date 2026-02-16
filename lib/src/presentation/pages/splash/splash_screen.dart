import 'dart:async';
import 'package:flutter/material.dart';

class SlideshowSplash extends StatefulWidget {
  const SlideshowSplash({super.key});

  @override
  State<SlideshowSplash> createState() => _SlideshowSplashState();
}

class _SlideshowSplashState extends State<SlideshowSplash> {
  final PageController _pageController = PageController(initialPage: 0);

  // صور الخلفيات
  final List<String> _images = [
    'assets/backgrounds/metal_bg.png',
    'assets/backgrounds/carbon_bg.png',
  ];

  int _current = 0;
  Timer? _timer;

  final Duration _autoDuration = const Duration(seconds: 4);
  final Duration _fadeDuration = const Duration(milliseconds: 700);

  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // precache
      for (final path in _images) {
        precacheImage(AssetImage(path), context);
      }

      _startAutoSlide();
    });

    // انتقال تلقائي بعد 10 ثواني
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted || _navigated) return;
      _navigated = true;

      // TODO: ضع هنا الانتقال للصفحة التالية
     Navigator.pushReplacementNamed(context, '/AuthPage');
    });
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _timer = Timer.periodic(_autoDuration, (_) async {
      if (!mounted) return;

      final next = (_current + 1) % _images.length;

      if (_pageController.hasClients) {
        try {
          await _pageController.animateToPage(
            next,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
          );
        } catch (_) {}
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(_images.length, (i) {
        final active = i == _current;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          height: 8,
          width: active ? 28 : 8,
          decoration: BoxDecoration(
            color: active
                ? const Color(0xFFC47A3A) // نحاسي
                : Colors.white24,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            onPageChanged: (index) {
              setState(() => _current = index);
            },
            itemBuilder: (context, index) {
              return AnimatedSwitcher(
                duration: _fadeDuration,
                child: Container(
                  key: ValueKey(_images[index]),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(_images[index]),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              );
            },
          ),

          // المؤشر
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(child: _buildIndicator()),
          ),
        ],
      ),
    );
  }
}