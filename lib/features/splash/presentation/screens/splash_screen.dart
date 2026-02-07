/*import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smarttoil/app/routes/app_routes.dart';

class SlideshowSplash extends StatefulWidget {
  const SlideshowSplash({super.key});

  @override
  State<SlideshowSplash> createState() => _SlideshowSplashState();
}

class _SlideshowSplashState extends State<SlideshowSplash> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> _images = [
    'assets/backgrounds/metal_bg.png',
    'assets/backgrounds/carbon_bg.png',
  ];

  int _current = 0;
  Timer? _timer;
  final Duration _autoDuration = const Duration(seconds: 4);
  final Duration _fadeDuration = const Duration(milliseconds: 700);
  bool _autoSliding = true;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final path in _images) {
        precacheImage(AssetImage(path), context);
      }
      _startAutoSlide();
    });

    Future.delayed(const Duration(seconds: 10), () {
      if (!mounted || _navigated) return;
      _stopAutoSlide();
      _navigated = true;
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    });
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _autoSliding = true;
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

  void _stopAutoSlide() {
    _autoSliding = false;
    _timer?.cancel();
    _timer = null;
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
            color: active ? const Color(0xFFFF6F00) : Colors.white24,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }

  bool _isPhone(BuildContext context) {
    final shortest = MediaQuery.of(context).size.shortestSide;
    return shortest < 600;
  }

  @override
  Widget build(BuildContext context) {
    final isPhone = _isPhone(context);

    return Scaffold(
      backgroundColor: Colors.black, // يمنع وميض الخلفية البيضاء
      body: GestureDetector(
        onTapDown: (_) => _stopAutoSlide(),
        onTapUp: (_) {
          if (!_autoSliding) _startAutoSlide();
        },
        onPanDown: (_) => _stopAutoSlide(),
        onPanEnd: (_) {
          if (!_autoSliding) _startAutoSlide();
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              onPageChanged: (index) {
                setState(() => _current = index);
              },
              itemBuilder: (context, index) {
                final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
                final targetWidth =
                    (MediaQuery.of(context).size.width * devicePixelRatio).toInt();

                // الصورة فقط: تحميل محسّن مع ResizeImage
                Widget imageWidget = Image(
                  image: ResizeImage(
                    AssetImage(_images[index]),
                    width: targetWidth,
                  ),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.black.withOpacity(0.18),
                  colorBlendMode: BlendMode.darken,
                );

                // تطبيق التصحيح فقط على عنصر الصورة (لا يؤثر على النص/المؤشرات)
                if (isPhone) {
                  // إذا الصورة مقلوبة 180°: استخدم RotatedBox
                  imageWidget = RotatedBox(
                    quarterTurns: 2, // تدوير 180 درجة
                    child: imageWidget,
                  );

                  // إذا كانت الصورة أيضاً معكوسة (مرآة) وتحتاج انعكاس أفقي:
                  // ضع Transform.scale بعد RotatedBox كما في السطر التالي:
                  // imageWidget = Transform(alignment: Alignment.center, transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0), child: imageWidget);
                  //
                  // ملاحظة: لا تفعّل الانعكاس إلا إذا لازمتك فعلاً، لأن الانعكاس يغيّر اتجاه العناصر داخل الصورة.
                }

                return AnimatedSwitcher(
                  duration: _fadeDuration,
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: Container(
                    key: ValueKey('${_images[index]}_${isPhone ? "fixed" : "nor"}'),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        imageWidget,
                        // تراكب داكن خفيف اختياري لرفع التباين
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0x00000000), Color(0x88000000)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // المؤشرات تبقى طبيعية وقابلة للقراءة
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(child: _buildIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}*/
/*
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image/image.dart' as img;
import 'package:smarttoil/app/routes/app_routes.dart';

class SlideshowSplash extends StatefulWidget {
  const SlideshowSplash({super.key});

  @override
  State<SlideshowSplash> createState() => _SlideshowSplashState();
}

class _SlideshowSplashState extends State<SlideshowSplash> {
  final PageController _pageController = PageController(initialPage: 0);

  // صور assets الأصلية (مسارات داخل المشروع)
  final List<String> _assetPaths = [
    'assets/backgrounds/metal_bg.png',
    'assets/backgrounds/carbon_bg.png',
  ];

  // بعد المعالجة سنخزن ImageProvider (MemoryImage) هنا
  List<ImageProvider?> _images = [];

  int _current = 0;
  Timer? _timer;
  final Duration _autoDuration = const Duration(seconds: 4);
  final Duration _fadeDuration = const Duration(milliseconds: 700);
  bool _autoSliding = true;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    _prepareAssets();
    // Safety navigation بعد 10 ثواني
    Future.delayed(const Duration(seconds: 10), () {
      if (!mounted || _navigated) return;
      _stopAutoSlide();
      _navigated = true;
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    });
  }

  // يقرأ asset، يصحّح الاتجاه، ويعيد MemoryImage
  Future<ImageProvider> _loadAndFixAsset(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    final Uint8List bytes = data.buffer.asUint8List();

    // فك الصورة باستخدام مكتبة image
    final img.Image? decoded = img.decodeImage(bytes);
    if (decoded == null) {
      // لو فشل فك الصورة، نعرض الصورة الأصلية كـ MemoryImage
      return MemoryImage(bytes);
    }

    // bakeOrientation يطبّق تصحيح EXIF على البكسلات
    final img.Image fixed = img.bakeOrientation(decoded);

    // نعيد ترميز PNG (يحافظ على الشفافية إن وُجدت)
    final Uint8List fixedPng = Uint8List.fromList(img.encodePng(fixed));
    return MemoryImage(fixedPng);
  }

  // معالجة كل الصور في initState
  Future<void> _prepareAssets() async {
    final List<ImageProvider?> tmp = List<ImageProvider?>.filled(_assetPaths.length, null);
    for (int i = 0; i < _assetPaths.length; i++) {
      try {
        final provider = await _loadAndFixAsset(_assetPaths[i]);
        tmp[i] = provider;
      } catch (_) {
        // في حال فشل المعالجة، نحاول استخدام AssetImage كاحتياط
        tmp[i] = AssetImage(_assetPaths[i]);
      }
    }

    if (!mounted) return;

    setState(() {
      _images = tmp;
    });

    // Precache لتحسين الأداء ومنع الوميض
    for (final provider in _images) {
      if (provider != null) {
        precacheImage(provider, context);
      }
    }

    // ابدأ السلايد بعد التحضير
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _autoSliding = true;
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

  void _stopAutoSlide() {
    _autoSliding = false;
    _timer?.cancel();
    _timer = null;
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
            color: active ? const Color(0xFFFF6F00) : Colors.white24,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }

  bool _isPhone(BuildContext context) {
    final shortest = MediaQuery.of(context).size.shortestSide;
    return shortest < 600;
  }

  @override
  Widget build(BuildContext context) {
    final isPhone = _isPhone(context);

    // إذا لم تُحضّر الصور بعد، نعرض مؤشر تحميل
    if (_images.isEmpty || _images.any((e) => e == null)) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapDown: (_) => _stopAutoSlide(),
        onTapUp: (_) {
          if (!_autoSliding) _startAutoSlide();
        },
        onPanDown: (_) => _stopAutoSlide(),
        onPanEnd: (_) {
          if (!_autoSliding) _startAutoSlide();
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              onPageChanged: (index) {
                setState(() => _current = index);
              },
              itemBuilder: (context, index) {
                final provider = _images[index]!;

                // عرض الصورة (لا نطبّق Transform هنا لأن bakeOrientation أصلح الاتجاه)
                Widget imageWidget = Image(
                  image: provider,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  alignment: Alignment.center,
                );

                // لو رغبت بتقليل السطوع لزيادة وضوح النص فوقها:
                imageWidget = ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.12), BlendMode.darken),
                  child: imageWidget,
                );

                return AnimatedSwitcher(
                  duration: _fadeDuration,
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: Container(
                    key: ValueKey('slide_$index'),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        imageWidget,
                        // تراكب داكن خفيف اختياري لرفع التباين
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0x00000000), Color(0x66000000)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // المؤشرات
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(child: _buildIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}


*/
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smarttoil/app/routes/app_routes.dart';

class SlideshowSplash extends StatefulWidget {
  const SlideshowSplash({super.key});

  @override
  State<SlideshowSplash> createState() => _SlideshowSplashState();
}

class _SlideshowSplashState extends State<SlideshowSplash> {
  final PageController _pageController = PageController(initialPage: 0);

  // صور التابلت (الأصلية)
  final List<String> _tabletImages = [
    'assets/backgrounds/metal_bg.png',
    'assets/backgrounds/carbon_bg.png',
  ];

  // صور الهاتف (النسخ المصححة)
  final List<String> _phoneImages = [
    'assets/backgrounds/metal_bg.png',
    'assets/backgrounds/carbon_bg.png',
  ];

  late List<String> _images; // سيتم تحديدها حسب نوع الجهاز

  int _current = 0;
  Timer? _timer;
  final Duration _autoDuration = const Duration(seconds: 4);
  final Duration _fadeDuration = const Duration(milliseconds: 700);
  bool _autoSliding = true;
  bool _navigated = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // تحديد نوع الجهاز
      final shortest = MediaQuery.of(context).size.shortestSide;
      final isPhone = shortest < 600;

      // اختيار الصور المناسبة
      _images = isPhone ? _phoneImages : _tabletImages;

      // precache
      for (final path in _images) {
        precacheImage(AssetImage(path), context);
      }

      _startAutoSlide();
    });

    // انتقال تلقائي بعد 10 ثواني
    Future.delayed(const Duration(seconds: 10), () {
      if (!mounted || _navigated) return;
      _stopAutoSlide();
      _navigated = true;
      Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    });
  }

  void _startAutoSlide() {
    _timer?.cancel();
    _autoSliding = true;
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

  void _stopAutoSlide() {
    _autoSliding = false;
    _timer?.cancel();
    _timer = null;
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
            color: active ? const Color(0xFFFF6F00) : Colors.white24,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    // لو لم يتم تحديد الصور بعد
    if (!(_images != null && _images.isNotEmpty)) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

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