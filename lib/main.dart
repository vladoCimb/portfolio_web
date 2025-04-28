import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:html' as html;

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vladimír Čimbora',
      theme: ThemeData(
        brightness: Brightness.light,
        // this will make *all* of your Text widgets use the Poppins family by default
        fontFamily: 'Poppins',
        primarySwatch: Colors.blueGrey,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // same in dark mode
        fontFamily: 'Poppins',
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: _themeMode,
      home: PortfolioPage(onToggleTheme: _toggleTheme),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key, required this.onToggleTheme});

  final VoidCallback onToggleTheme;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: height, child: const _HeroSection()),
                // Experience section will now scroll as part of this
                const _ExperienceSection(),
                _WorkShowcase(
                  topImages: [
                    'assets/images/work_showcase/locals/locals_1.png',
                    'assets/images/work_showcase/locals/locals_2.png',
                    'assets/images/work_showcase/locals/locals_3.png',
                    'assets/images/work_showcase/locals/locals_4.png',
                    'assets/images/work_showcase/locals/locals_5.png',
                    'assets/images/work_showcase/locals/locals_6.png',
                    'assets/images/work_showcase/locals/locals_7.png',
                    'assets/images/work_showcase/locals/locals_8.png',
                    'assets/images/work_showcase/locals/locals_9.png',
                    'assets/images/work_showcase/locals/locals_10.png',
                  ],
                  bottomImages: [
                    'assets/images/work_showcase/fresh_cut/freshcut_1.jpg',
                    'assets/images/work_showcase/fresh_cut/freshcut_2.png',
                    'assets/images/work_showcase/fresh_cut/freshcut_3.png',
                    'assets/images/work_showcase/fresh_cut/freshcut_4.jpg',
                    'assets/images/work_showcase/fresh_cut/freshcut_5.jpg',
                    'assets/images/work_showcase/fresh_cut/freshcut_6.png',
                    'assets/images/work_showcase/fresh_cut/freshcut_7.jpg',
                    'assets/images/work_showcase/fresh_cut/freshcut_8.jpg',
                  ],
                  thirdImages: [
                    'assets/images/work_showcase/idexx/idexx_1.png',
                    'assets/images/work_showcase/idexx/idexx_2.png',
                    'assets/images/work_showcase/idexx/idexx_3.png',
                    'assets/images/work_showcase/idexx/idexx_4.png',
                    'assets/images/work_showcase/idexx/idexx_5.png',
                    'assets/images/work_showcase/pluto_tv/pluto_1.png',
                    'assets/images/work_showcase/pluto_tv/pluto_2.png',
                    'assets/images/work_showcase/pluto_tv/pluto_3.png',
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey.shade900.withOpacity(0.7)
                      : Colors.grey.shade400.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavBar(onToggleTheme: onToggleTheme), // <-- here
                    IconButton(
                      icon: Icon(Theme.of(context).brightness == Brightness.dark
                          ? Icons.light_mode
                          : Icons.dark_mode),
                      onPressed: onToggleTheme,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      DottedGridBackground(
        dotRadius: 0.3,
        spacing: 22,
      ),
      MeteorShower(
        numberOfMeteors: 30,
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 24),
                Text('Hello, I\'m Vladimir. A passionate Software Engineer',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey)),
                const SizedBox(height: 8),
                const SizedBox(height: 16),
                TypewriterText(
                  text: 'Flutter and Dart developer',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 16,
                  children: [
                    // White square button with subtle shadow
                    ElevatedButton(
                      onPressed: () => launchUrl(Uri.parse(
                          'https://drive.google.com/file/d/1FImHDfPKdIwQO39o4wc8DDqezDI73Zfk/view?usp=share_link')),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black87,
                        elevation: 4,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // small radius for square corners
                        ),
                        shadowColor: Colors.black26,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: const Text(
                          'Download CV',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),

                    // Dark square button
                    OutlinedButton(
                      onPressed: () =>
                          launchUrl(Uri.parse('mailto:v.cimbora123@gmail.com')),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xff1e2a3b),
                        foregroundColor: Colors.white,
                        side: BorderSide.none,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // small radius for square corners
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: const Text(
                          'Contact Me',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

class MeteorShower extends StatefulWidget {
  final Widget child;
  final int numberOfMeteors;
  final Duration duration;

  const MeteorShower({
    super.key,
    required this.child,
    this.numberOfMeteors = 10,
    this.duration = const Duration(seconds: 10),
  });

  @override
  _MeteorShowerState createState() => _MeteorShowerState();
}

class _MeteorShowerState extends State<MeteorShower>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Meteor> _meteors = [];
  final double meteorAngle = pi / 4;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeMeteors(Size size) {
    if (_meteors.isEmpty) {
      _meteors = List.generate(
          widget.numberOfMeteors, (_) => Meteor(meteorAngle, size));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        _initializeMeteors(size);

        return Stack(
          children: [
            widget.child,
            ...List.generate(widget.numberOfMeteors, (index) {
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  final meteor = _meteors[index];
                  final progress = ((_controller.value - meteor.delay) % 1.0) /
                      meteor.duration;
                  if (progress < 0 || progress > 1) return SizedBox.shrink();

                  return Positioned(
                    left: meteor.startX +
                        (meteor.endX - meteor.startX) * progress,
                    top: meteor.startY +
                        (meteor.endY - meteor.startY) * progress,
                    child: Opacity(
                      opacity: (1 - progress) * 0.8,
                      child: Transform.rotate(
                        angle: 315 * (pi / 180),
                        child: CustomPaint(
                          size: Size(2, 20),
                          painter: MeteorPainter(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        );
      },
    );
  }
}

class MeteorPainter extends CustomPainter {
  final Color color;

  MeteorPainter({super.repaint, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint trailPaint = Paint()
      ..shader = LinearGradient(
        colors: [color, color.withOpacity(0)],
        end: Alignment.topCenter,
        begin: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), trailPaint);

    final Paint circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width / 2, size.height), 2, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Meteor {
  final double startX;
  final double startY;
  late double endX;
  late double endY;
  final double delay;
  final double duration;

  Meteor(double angle, Size size)
      : startX = Random().nextDouble() * size.width - size.width / 3,
        startY = Random().nextDouble() * size.height / 4,
        delay = Random().nextDouble(),
        duration = 0.3 + Random().nextDouble() * 0.7 {
    var distance = size.height;
    endX = startX + cos(angle) * distance;
    endY = startY + sin(angle) * distance;
  }
}

class _WorkShowcase extends StatefulWidget {
  final List<String> topImages;
  final List<String> bottomImages;
  final List<String> thirdImages;

  const _WorkShowcase({
    required this.topImages,
    required this.bottomImages,
    required this.thirdImages,
  });

  @override
  State<_WorkShowcase> createState() => _WorkShowcaseState();
}

class _WorkShowcaseState extends State<_WorkShowcase>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  static const double _itemWidth = 160;
  static const double _itemHeight = 350;
  static const double _itemMargin = 16;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 70),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Widget _buildMarquee(List<String> images, bool reverse) {
    // total width of one set of images
    final segmentWidth = images.length * (_itemWidth + 2 * _itemMargin);

    // duplicate so it wraps seamlessly
    final children = [
      for (var img in images) _buildItem(img),
      for (var img in images) _buildItem(img),
    ];

    return ClipRect(
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (_, __) {
          final cycle = _ctrl.value;
          // for reverse=false: scroll right→left; reverse=true: left→right
          final dx = reverse
              ? -segmentWidth + (cycle * segmentWidth)
              : -(cycle * segmentWidth);

          return OverflowBox(
            maxWidth: double.infinity,
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(dx, 0),
              child: Row(children: children),
            ),
          );
        },
      ),
    );
  }

  Widget _buildItem(String asset) {
    return Container(
      width: _itemWidth,
      height: _itemHeight,
      margin: const EdgeInsets.symmetric(horizontal: _itemMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: AssetImage(asset), fit: BoxFit.cover),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMobileBrowser() {
      final ua = html.window.navigator.userAgent.toLowerCase();
      return ua.contains('mobi') // most phones
          ||
          ua.contains('android') ||
          ua.contains('iphone');
    }

    final bool isPhone = isMobileBrowser();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: isPhone ? 8 : 48),
            child: Text(
              'Work Showcase',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: isPhone ? 48 : 68, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 32),

          // 1️⃣ Top row: scroll right→left
          SizedBox(
            height: _itemHeight + 2 * _itemMargin,
            child: _buildMarquee(widget.topImages, /*reverse=*/ false),
          ),
          const SizedBox(height: 24),

          // 2️⃣ Middle row: scroll left→right
          SizedBox(
            height: _itemHeight + 2 * _itemMargin,
            child: _buildMarquee(widget.bottomImages, /*reverse=*/ true),
          ),
          const SizedBox(height: 24),

          // 3️⃣ Bottom row: same as the first (right→left)
          SizedBox(
            height: _itemHeight + 2 * _itemMargin,
            child: _buildMarquee(widget.thirdImages, /*reverse=*/ false),
          ),
        ],
      ),
    );
  }
}

class _ExperienceSection extends StatelessWidget {
  const _ExperienceSection();

  bool isMobileBrowser() {
    final ua = html.window.navigator.userAgent.toLowerCase();
    return ua.contains('mobi') ||
        ua.contains('android') ||
        ua.contains('iphone');
  }

  @override
  Widget build(BuildContext context) {
    final isPhone = isMobileBrowser();

    return Padding(
      padding: EdgeInsets.all(isMobileBrowser() ? 0 : 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: isPhone ? 8 : 48),
            child: Text('Experience',
                style: TextStyle(
                    fontSize: isPhone ? 48 : 68, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isPhone ? 16 : 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ExperienceCard(
                  role: 'Flutter Developer',
                  company: 'Rumble',
                  period: 'Aug 2023 — Apr 2025',
                  description:
                      'Led the redesign of the legacy mobile application',
                  bullets: [
                    'Refactored existing code to improve clarity and maintainability, resulting in significantly better performance and a more robust architecture.',
                    'Implemented modern UI/UX best practices using the latest Flutter SDK features.',
                    'Ensured full responsiveness across various screen sizes and device types, delivering a consistent user experience on phones, tablets.',
                    'Integrated multimedia functionalities, allowing seamless handling of steams, videos, and audio for richer user engagement.'
                  ],
                ),
                _ExperienceCard(
                  role: 'Software Engineer',
                  company: 'Paramount',
                  period: 'Feb 2023 — Oct 2024',
                  description:
                      'As a Software Engineer, I contributed to various high-impact projects across the company, adapting to different roles and technologies as needed',
                  bullets: [
                    'Flutter Architect: Led the development and integration of Flutter modules into existing Android and iOS codebases for both mobile and TV applications, embedding new features seamlessly across platforms.',
                    'Full Stack Developer: Developed AI-driven proof-of-concept projects using Python and React, focusing on innovative solutions that leveraged GenAI technologies to enhance various business applications.',
                    'React Developer: Contributed to the development of the Kepler TV application, delivering a smooth and engaging user experience for TV platforms.',
                  ],
                ),
                _ExperienceCard(
                  role: 'Flutter developer',
                  company: 'Idexx',
                  period: 'Feb 2021 — Jun 2022',
                  description:
                      'Architecture leader for a newly established mobile team, I was tasked with recreating IDEXX’s legacy medical application',
                  bullets: [
                    'Worked closely with design team to establish a design system that could be effectively translated into codebase.',
                    'Led the development and implementation of a scalable and maintainable architecture, ensuring the application could be easily extended across multiple platforms.',
                    'Guided a colleague with no prior Flutter experience, successfully mentoring them to become a fully self-sufficient Flutter developer.',
                    'Led the analysis of business requirements, code architecture design, and the automation of builds and distribution, ensuring the delivery of a high-quality product.'
                  ],
                ),
                _ExperienceCard(
                  role: 'Flutter developer',
                  company: 'FreshCut',
                  period: 'Aug 2022 — Jan 2023',
                  description:
                      'Led efforts to improve application performance and user experience',
                  bullets: [
                    'Enhanced application’s overall performance.',
                    'Improved responsiveness and reduced load time.',
                    'Optimized memory usage',
                    'Integrate cryto wallets and payments',
                  ],
                ),
                _ExperienceCard(
                  role: 'Flutter developer',
                  company: 'EmbedIt',
                  period: 'Apr 2020 — Mar 2021',
                  description:
                      'Contributed to the development of one of the largest mobile platforms for online shopping in India, supporting both B2C and B2B applications.',
                  bullets: [
                    'Managed key technical and software engineering components, ensuring the platform’s robustness and scalability.',
                    'Designed and implemented API models to support new features, facilitating seamless integration and functionality expansion.',
                    'Analyzed business ideas and provided critical technical feedback to guide strategic decisions.',
                  ],
                ),
                _ExperienceCard(
                  role: 'Flutter developer',
                  company: 'Just IT Pro',
                  period: 'May 2019 — Apr 2020',
                  description:
                      'Focused on the development of internal applications for HomeCredit and PPF Group employees, successfully delivering three distinct business applications.',
                ),
                _ExperienceCard(
                  role: 'Backend Java developer',
                  company: 'T-Mobile',
                  period: 'Feb 2019 — Jun 2019',
                  description:
                      'CRM development for one of the biggest telecommunications company.',
                ),
                _ExperienceCard(
                  role: 'Full stack Java developer',
                  company: 'Tetras',
                  period: 'Feb 2017 — Feb 2019',
                  description:
                      'Developed and maintained internal software for a translation company. Led the end-to-end design and implementation of robust solutions, ensuring seamless integration with the database to support business operations',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: isPhone ? 8 : 48),
            child: Text('Projects',
                style: TextStyle(
                    fontSize: isPhone ? 48 : 68, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isPhone ? 16 : 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ExperienceCard(
                  role: 'Crypto trading bot',
                  company: '',
                  period: 'Oct 2024 - now',
                  description: 'Built an automated crypto trading bot',
                  bullets: [
                    'Tech Stack: .NET, Python, SQL, React',
                    'Keywords: Full stack'
                  ],
                ),
                _ExperienceCard(
                  role: 'Stammgast',
                  company: '',
                  period: 'Jan 2020 — Jun 2020',
                  description:
                      'Led a small team in initiating a project using Flutter',
                  bullets: [
                    'Tech Stack: Flutter',
                    'Keywords: Code architecture, Consultancy & Guidance'
                  ],
                ),
                _ExperienceCard(
                  role: 'WhozIn',
                  company: '',
                  period: 'Dec 2018  — Oct 2020',
                  description:
                      'Developed a mobile application designed for booking sport events.',
                  bullets: [
                    'Tech Stack: Flutter, Java, Spring',
                    'Keywords: Full stack',
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final String role;
  final String company;
  final String period;
  final String description;
  final List<String>? bullets;

  const _ExperienceCard(
      {required this.role,
      required this.company,
      required this.period,
      required this.description,
      this.bullets});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 300,
        maxWidth: 900,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText('$role ${company.isNotEmpty ? '@' : ''} $company',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            SelectableText(period, style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            SelectableText(
              description,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            if (bullets != null)
              ...bullets!.map((d) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2)
                        .copyWith(left: 16),
                    child: Row(children: [
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(child: SelectableText(d))
                    ]),
                  ))
          ],
        ),
      ),
    );
  }
}

class TypewriterText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration charDelay;
  final Duration startDelay;

  const TypewriterText({
    super.key,
    required this.text,
    this.style,
    this.charDelay = const Duration(milliseconds: 70),
    this.startDelay = const Duration(seconds: 2),
  });

  @override
  _TypewriterTextState createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  // This controller just drives the blinking cursor
  late final AnimationController _blinkController;
  late final Animation<double> _blinkOpacity;

  String _visibleText = "";
  int _charIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    // 1) Blink controller: slow (800ms), repeats forever
    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _blinkOpacity = Tween(begin: 1.0, end: 0.0).animate(_blinkController);

    // 2) Start typing after the initial delay
    Future.delayed(widget.startDelay, _typeNextChar);
  }

  void _typeNextChar() {
    if (_charIndex < widget.text.length) {
      setState(() {
        _visibleText += widget.text[_charIndex++];
      });
      Future.delayed(widget.charDelay, _typeNextChar);
    }
    // NOTE: we no longer stop the blink controller here
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final fullText = widget.text;
    final keyWord = 'Dart';
    final splitIndex = fullText.contains(keyWord)
        ? fullText.indexOf(keyWord) + keyWord.length
        : 0;

    // Separate visible text into two parts
    final firstPart = _visibleText.length <= splitIndex
        ? _visibleText
        : _visibleText.substring(0, splitIndex);
    final secondPart = _visibleText.length > splitIndex
        ? _visibleText.substring(splitIndex)
        : '';

    return AnimatedBuilder(
      animation: _blinkOpacity,
      builder: (context, child) {
        return RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: widget.style,
            children: [
              // the typed text so far
              TextSpan(
                text: firstPart,
                style: widget.style,
              ),
              if (secondPart.isNotEmpty)
                TextSpan(
                  text: secondPart,
                  style: widget.style?.copyWith(color: Colors.blue),
                ),
              // always-on blinking cursor
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: FadeTransition(
                    opacity: _blinkOpacity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Container(
                        width: 5,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DottedGridBackground extends StatelessWidget {
  final double spacing;
  final double dotRadius;
  final Color dotColor;

  const DottedGridBackground({
    super.key,
    this.spacing = 50,
    this.dotRadius = 2,
    this.dotColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _DottedGridPainter(
          spacing: spacing, dotRadius: dotRadius, dotColor: dotColor),
    );
  }
}

class _DottedGridPainter extends CustomPainter {
  final double spacing;
  final double dotRadius;
  final Color dotColor;

  _DottedGridPainter(
      {required this.spacing, required this.dotRadius, required this.dotColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = dotColor;
    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class NavBar extends StatefulWidget {
  final VoidCallback onToggleTheme;
  const NavBar({super.key, required this.onToggleTheme});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  OverlayEntry? _barrierEntry;
  OverlayEntry? _menuEntry;
  final LayerLink _layerLink = LayerLink();
  bool _hoveringMenu = false;
  Timer? _closeTimer;

  void _showMenu({required bool withBarrier}) {
    _closeTimer?.cancel();
    if (_menuEntry != null) return;

    // 1) Barrier, only on tap-trigger
    if (withBarrier) {
      _barrierEntry = OverlayEntry(builder: (_) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _hideMenu,
          child: Container(color: Colors.transparent),
        );
      });
    }

    // 2) The dropdown menu
    _menuEntry = OverlayEntry(builder: (context) {
      return Positioned(
        width: 180,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(-40, 45),
          child: MouseRegion(
            onEnter: (_) => _keepMenuOpen(),
            onExit: (_) {
              _hoveringMenu = false;
              _startCloseTimer();
            },
            child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey.shade900
                      : Colors.white,
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    width: 0.1,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _menuItem('assets/images/icons/github.svg', 'GitHub',
                        'https://github.com/vladoCimb'),
                    _menuItem('assets/images/icons/linkedIn.svg', 'LinkedIn',
                        'https://www.linkedin.com/in/vladimir-cimbora'),
                    _menuItem('assets/images/icons/X_icon.svg', 'X/Twitter',
                        'https://x.com/cimbora_v'),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });

    // 3) Insert entries: barrier first if present, then menu
    final overlay = Overlay.of(context);
    if (_barrierEntry != null) overlay.insert(_barrierEntry!);
    overlay.insert(_menuEntry!);
  }

  void _hideMenu() {
    _closeTimer?.cancel();
    _menuEntry?.remove();
    _barrierEntry?.remove();
    _menuEntry = null;
    _barrierEntry = null;
  }

  void _startCloseTimer() {
    _closeTimer?.cancel();
    _closeTimer = Timer(const Duration(milliseconds: 300), () {
      if (!_hoveringMenu) _hideMenu();
    });
  }

  void _keepMenuOpen() {
    _hoveringMenu = true;
    _closeTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (_menuEntry == null) {
            _showMenu(withBarrier: true);
          } else {
            _hideMenu();
          }
        },
        child: MouseRegion(
          onEnter: (_) {
            _hoveringMenu = true;
            _showMenu(withBarrier: false);
          },
          onExit: (_) {
            _hoveringMenu = false;
            _startCloseTimer();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Social',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuItem(String icon, String label, String url) {
    return ListTile(
      leading: SvgPicture.asset(
        icon,
        height: 20,
        width: 20,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
      title: Text(label),
      onTap: () {
        _hideMenu();
        launchUrl(Uri.parse(url));
      },
    );
  }
}
