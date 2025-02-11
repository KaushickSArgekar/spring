import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
	static final TextTheme textTheme = TextTheme(
		displayLarge: GoogleFonts.inter(
			fontSize: 57,
			fontWeight: FontWeight.w700,
			color: AppColors.textPrimary,
		),
		displayMedium: GoogleFonts.inter(
			fontSize: 45,
			fontWeight: FontWeight.w600,
			color: AppColors.textPrimary,
		),
		displaySmall: GoogleFonts.inter(
			fontSize: 36,
			fontWeight: FontWeight.w600,
			color: AppColors.textPrimary,
		),
		headlineLarge: GoogleFonts.inter(
			fontSize: 32,
			fontWeight: FontWeight.w600,
			color: AppColors.textPrimary,
		),
		headlineMedium: GoogleFonts.inter(
			fontSize: 28,
			fontWeight: FontWeight.w600,
			color: AppColors.textPrimary,
		),
		titleLarge: GoogleFonts.inter(
			fontSize: 22,
			fontWeight: FontWeight.w600,
			color: AppColors.textPrimary,
		),
		bodyLarge: GoogleFonts.outfit(
			fontSize: 16,
			fontWeight: FontWeight.w400,
			color: AppColors.textPrimary,
		),
		bodyMedium: GoogleFonts.outfit(
			fontSize: 14,
			fontWeight: FontWeight.w400,
			color: AppColors.textSecondary,
		),
	);
}