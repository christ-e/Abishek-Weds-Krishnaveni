import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../data/wedding_data.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _bounceController;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _bounceAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final photoWidth = isMobile ? screenWidth * 0.84 : 400.0;
    final photoHeight = photoWidth * 1.25;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 36,
        vertical: isMobile ? 32 : 48,
      ),
      child: Column(
        children: [
          // 1. Auspicious Hindu Blessing Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            decoration: BoxDecoration(
              color: WeddingColors.goldLight.withOpacity(0.35),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: WeddingColors.goldBorder.withOpacity(0.6),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.spa_rounded,
                  size: 14,
                  color: WeddingColors.goldMedium,
                ),
                const SizedBox(width: 8),
                Text(
                  WeddingData.shlokaInvocation,
                  style: GoogleFonts.notoSansDevanagari(
                    fontSize: isMobile ? 13 : 15,
                    fontWeight: FontWeight.w600,
                    color: WeddingColors.goldDark,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.spa_rounded,
                  size: 14,
                  color: WeddingColors.goldMedium,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // 2. Invitation wording
          Text(
            WeddingData.invitationSubtitle.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: isMobile ? 11 : 12,
              letterSpacing: 3,
              fontWeight: FontWeight.w500,
              color: WeddingColors.textMuted,
            ),
          ),

          const SizedBox(height: 14),

          // 3. Couple Names in Calligraphy
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                // Groom name — capital 'A' rendered larger so it reads clearly as uppercase
                TextSpan(
                  text: WeddingData.groomName.substring(0, 1),
                  style: GoogleFonts.greatVibes(
                    fontSize: isMobile ? 64 : 86,
                    height: 1.0,
                    fontWeight: FontWeight.w400,
                    color: WeddingColors.emeraldPrimary,
                    shadows: [
                      Shadow(
                        color: WeddingColors.goldPrimary.withOpacity(0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                TextSpan(
                  text: WeddingData.groomName.substring(1),
                  style: GoogleFonts.greatVibes(
                    fontSize: isMobile ? 48 : 64,
                    height: 1.15,
                    fontWeight: FontWeight.w400,
                    color: WeddingColors.emeraldPrimary,
                    shadows: [
                      Shadow(
                        color: WeddingColors.goldPrimary.withOpacity(0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                // Ampersand separator
                TextSpan(
                  text: "\n&\n",
                  style: GoogleFonts.greatVibes(
                    fontSize: isMobile ? 48 : 64,
                    height: 1.15,
                    fontWeight: FontWeight.w400,
                    color: WeddingColors.emeraldPrimary,
                    shadows: [
                      Shadow(
                        color: WeddingColors.goldPrimary.withOpacity(0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                // Bride name — capital 'K' also rendered larger for consistency
                TextSpan(
                  text: WeddingData.brideName.substring(0, 1),
                  style: GoogleFonts.greatVibes(
                    fontSize: isMobile ? 64 : 86,
                    height: 1.0,
                    fontWeight: FontWeight.w400,
                    color: WeddingColors.emeraldPrimary,
                    shadows: [
                      Shadow(
                        color: WeddingColors.goldPrimary.withOpacity(0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
                TextSpan(
                  text: WeddingData.brideName.substring(1),
                  style: GoogleFonts.greatVibes(
                    fontSize: isMobile ? 48 : 64,
                    height: 1.15,
                    fontWeight: FontWeight.w400,
                    color: WeddingColors.emeraldPrimary,
                    shadows: [
                      Shadow(
                        color: WeddingColors.goldPrimary.withOpacity(0.35),
                        blurRadius: 12,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Decorative Golden Line
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 48,
                height: 1,
                color: WeddingColors.goldPrimary.withOpacity(0.5),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  Icons.favorite_rounded,
                  size: 14,
                  color: WeddingColors.goldPrimary,
                ),
              ),
              Container(
                width: 48,
                height: 1,
                color: WeddingColors.goldPrimary.withOpacity(0.5),
              ),
            ],
          ),

          const SizedBox(height: 28),

          // 4. Main Couple Photo (Beach Photo - first photo requested by user)
          Container(
            width: photoWidth,
            height: photoHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(220),
              border: Border.all(
                color: WeddingColors.goldBorder,
                width: 2.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: WeddingColors.emeraldDark.withOpacity(0.12),
                  blurRadius: 28,
                  spreadRadius: 2,
                  offset: const Offset(0, 14),
                ),
                BoxShadow(
                  color: WeddingColors.goldPrimary.withOpacity(0.15),
                  blurRadius: 18,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(215),
                child: Image.asset(
                  WeddingData.mainCoupleImage,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),

          const SizedBox(height: 26),

          // 5. Date & Muhurtham Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            decoration: BoxDecoration(
              color: WeddingColors.emeraldPrimary,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: WeddingColors.emeraldPrimary.withOpacity(0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calendar_today_rounded,
                  size: 15,
                  color: WeddingColors.goldLight,
                ),
                const SizedBox(width: 10),
                Text(
                  WeddingData.formattedDate.toUpperCase(),
                  style: GoogleFonts.cinzel(
                    fontSize: isMobile ? 12 : 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: WeddingColors.goldLight,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Text(
            "Muhurtham 10:30 AM – 11:00 AM",
            style: GoogleFonts.montserrat(
              fontSize: isMobile ? 12 : 13,
              fontWeight: FontWeight.w600,
              color: WeddingColors.textBody,
              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 36),

          // 6. Scroll-down indicator
          AnimatedBuilder(
            animation: _bounceAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _bounceAnimation.value),
                child: child,
              );
            },
            child: Column(
              children: [
                Text(
                  'scroll to explore',
                  style: GoogleFonts.montserrat(
                    fontSize: isMobile ? 10 : 11,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.w500,
                    color: WeddingColors.goldDark.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: WeddingColors.goldBorder.withOpacity(0.7),
                      width: 1.5,
                    ),
                    color: WeddingColors.goldLight.withOpacity(0.25),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 22,
                    color: WeddingColors.goldDark,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
