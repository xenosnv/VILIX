import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class VilixFooter extends StatelessWidget {
  const VilixFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 36),
      decoration: const BoxDecoration(
        color: Color(0xFF060608),
        border: Border(top: BorderSide(color: Color(0xFF17171D))),
      ),
      child: Column(
        children: [
          // Brand Logo
          Text(
            'VILIX',
            style: GoogleFonts.inter(
              textStyle: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w900,
                color: AppColors.primaryBlue,
                letterSpacing: -1.2,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Legal Disclaimer
          const Text(
            'IDLIX does not host, store, or distribute any media files. All content is automatically grabbed from third-party providers on the Internet.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11,
              color: AppColors.textMuted,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 18),

          // Social Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialSvgButton('assets/icons/chat.svg', 'Chat'),
              const SizedBox(width: 14),
              _buildSocialSvgButton('assets/icons/discord.svg', 'Discord'),
              const SizedBox(width: 14),
              _buildSocialSvgButton('assets/icons/telegram.svg', 'Telegram'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialSvgButton(String assetPath, String label) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xCC262626),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          assetPath,
          colorFilter: const ColorFilter.mode(
            Color(0xFFD4D4D4),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
