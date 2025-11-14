import 'package:flutter/material.dart';

class MontrealScreen extends StatefulWidget {
  const MontrealScreen({super.key});

  @override
  State<MontrealScreen> createState() => _MontrealScreenState();
}

class _MontrealScreenState extends State<MontrealScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 140),
      lowerBound: 0.0,
      upperBound: 0.08,
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.92).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    GestureTapCallback? _onTapButton;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFB286FF),
                  Color(0xFF9B5CFF),
                  Color(0xFF6B21A8),
                ],
              ),
            ),
          ),

          Positioned.fill(
            child: Opacity(
              opacity: 0.20,
              child: Image.asset(
                'assets/images/montreal.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07,
                vertical: size.height * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),

                  // MAIN TITLE
                  Text(
                    'MONTREAL',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.085,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    
                    'Tourist Guide',
                    
                    style: TextStyle(
                      color: Color(0xFFFFD54F),
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.5
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Everything you need to know about\nthe city',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: size.width * 0.038,
                      height: 1.35,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    'Hotels Tourist Attractions Restaurants Entertainment Venues',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: size.width * 0.032,
                    ),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: _onTapButton,
                    onTapDown: (_) => _controller.forward(),
                    onTapUp: (_) => _controller.reverse(),
                    onTapCancel: () => _controller.reverse(),
                    child: AnimatedBuilder(
                      animation: _scaleAnim,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scaleAnim.value,
                          child: child,
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFFFA21A),
                              Color(0xFFFFD45A),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 12,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Let's Go",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
