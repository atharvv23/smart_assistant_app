import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/suggestion.dart';
import '../themes/app_theme.dart';

class SuggestionCard extends StatelessWidget {
  final Suggestion suggestion;
  final VoidCallback? onTap;

  const SuggestionCard({super.key, required this.suggestion, this.onTap});

  static const List<IconData> _icons = [
    Icons.forum_rounded,
    Icons.email_outlined,
    Icons.translate,
    Icons.spellcheck,
    Icons.create,
    Icons.lightbulb_outline,
    Icons.checklist,
    Icons.edit_note,
    Icons.code,
    Icons.psychology,
  ];

  static const List<Color> _gradients = [
    Color(0xFF7C4DFF),
    Color(0xFF00BCD4),
    Color(0xFFFF6B6B),
    Color(0xFF4CAF50),
    Color(0xFFFF9800),
    Color(0xFF9C27B0),
    Color(0xFF2196F3),
    Color(0xFFE91E63),
    Color(0xFF009688),
    Color(0xFF673AB7),
  ];

  @override
  Widget build(BuildContext context) {
    final colorIndex = (suggestion.id - 1) % _gradients.length;
    final iconIndex = (suggestion.id - 1) % _icons.length;
    final color = _gradients[colorIndex];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: color.withOpacity(0.1)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(_icons[iconIndex], color: Colors.white, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      suggestion.title,
                      style: GoogleFonts.outfit(
                        color: AppTheme.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      suggestion.description,
                       style: GoogleFonts.outfit(
                        color: AppTheme.textPrimary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.arrow_forward_ios, size: 13, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
