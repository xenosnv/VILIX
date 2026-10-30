import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class NavModal extends StatelessWidget {
  final Function(int)? onNavigateTab;

  const NavModal({super.key, this.onNavigateTab});

  static Future<void> show(BuildContext context, {Function(int)? onNavigateTab}) {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true, // Render di root navigator di atas shell header
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => NavModal(onNavigateTab: onNavigateTab),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.88,
      ),
      margin: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        color: AppColors.surfaceModal,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        border: Border.all(color: AppColors.borderDark),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle & Header
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Menu Navigasi',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textWhite,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFF262626),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 18,
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColors.borderDark),

          // Scrollable Body (clean without unwanted scrollbars cutting content)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2-Column Menu Grid
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 2.8,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: [
                      _buildGridItem(
                        icon: Icons.home_rounded,
                        label: 'Home',
                        isActive: true,
                        onTap: () {
                          Navigator.pop(context);
                          onNavigateTab?.call(0);
                        },
                      ),
                      _buildGridItem(
                        icon: Icons.local_activity_outlined,
                        label: 'Movies',
                        onTap: () {
                          Navigator.pop(context);
                          onNavigateTab?.call(1);
                        },
                      ),
                      _buildGridItem(
                        icon: Icons.tv_rounded,
                        label: 'TV Series',
                        onTap: () {
                          Navigator.pop(context);
                          onNavigateTab?.call(2);
                        },
                      ),
                      _buildGridItem(
                        icon: Icons.history_rounded,
                        label: 'History Tonton',
                        onTap: () {
                          Navigator.pop(context);
                          onNavigateTab?.call(3);
                        },
                      ),
                      _buildGridItem(
                        icon: Icons.grid_view_rounded,
                        label: 'Collections',
                      ),
                      _buildGridItem(
                        icon: Icons.local_offer_outlined,
                        label: 'Genres',
                      ),
                      _buildGridItem(
                        icon: Icons.group_work_outlined,
                        label: 'Watch Party',
                      ),
                      _buildGridItem(
                        icon: Icons.public_rounded,
                        label: 'Country',
                      ),
                      _buildGridItem(
                        icon: Icons.calendar_today_outlined,
                        label: 'Year',
                      ),
                      _buildGridItem(
                        icon: Icons.alt_route_rounded,
                        label: 'Network',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Account Card
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceModalItem,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.borderDark),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xFF262626),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person_outline,
                            color: AppColors.textMuted,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Account',
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700, // Di 700 (bold)
                                  color: AppColors.textWhite,
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Sign in to save your list.',
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400, // Di bawah 700 (regular)
                                  color: AppColors.textMuted,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Sign In & Sign Up
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xCC17171D),
                            side: const BorderSide(color: Color(0xFF404040)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xCC17171D),
                            side: const BorderSide(color: Color(0xFF404040)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: AppColors.primaryBlue,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Subscribe VILIX+ Banner
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xCC082F49),
                          Color(0x801E3A8A),
                          Color(0xFF17171D),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppColors.primaryBlue.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.workspace_premium, color: Color(0xFF60A5FA), size: 20),
                            const SizedBox(width: 10),
                            Text(
                              'Subscribe to VILIX+',
                              style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Icon(Icons.chevron_right, color: AppColors.textMuted, size: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Secondary Links
                  const Divider(color: AppColors.borderDark, height: 1),
                  const SizedBox(height: 12),
                  _buildSecondaryLink('VILIX App'),
                  _buildSecondaryLink('Leaderboard'),
                  _buildSecondaryLink('Request'),
                  _buildSecondaryLink('Release History'),
                  const SizedBox(height: 16),

                  // Language
                  const Divider(color: AppColors.borderDark, height: 1),
                  const SizedBox(height: 12),
                  Text(
                    'LANGUAGE',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        color: AppColors.textDim,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceModalItem,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '🇮🇩 Bahasa',
                      style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF262626),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.primaryBlue.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '🇺🇸 English',
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF60A5FA),
                            ),
                          ),
                        ),
                        const Icon(Icons.check, color: AppColors.primaryBlue, size: 18),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem({
    required IconData icon,
    required String label,
    bool isActive = false,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0x332563EB) : AppColors.surfaceModalItem,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isActive
                ? AppColors.primaryBlue.withValues(alpha: 0.5)
                : AppColors.borderDark,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: isActive ? AppColors.primaryBlue : AppColors.textMuted,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 11,
                    fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                    color: isActive ? AppColors.primaryBlue : AppColors.textWhite,
                  ),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondaryLink(String title) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          title,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 12,
              color: AppColors.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
