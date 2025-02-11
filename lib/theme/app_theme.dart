import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
	static ThemeData darkTheme = ThemeData(
		useMaterial3: true,
		brightness: Brightness.dark,
		scaffoldBackgroundColor: AppColors.background,
		colorScheme: const ColorScheme.dark(
			primary: AppColors.emeraldPrimary,
			secondary: AppColors.emeraldLight,
			surface: AppColors.surface,
			error: AppColors.error,
		),
		cardTheme: const CardTheme(
			color: AppColors.cardColor,
		),
		appBarTheme: const AppBarTheme(
			backgroundColor: AppColors.surface,
			foregroundColor: AppColors.textPrimary,
			elevation: 0,
		),
		textTheme: const TextTheme(
			bodyLarge: TextStyle(color: AppColors.textPrimary),
			bodyMedium: TextStyle(color: AppColors.textPrimary),
			titleLarge: TextStyle(color: AppColors.textPrimary),
			titleMedium: TextStyle(color: AppColors.textPrimary),
			labelLarge: TextStyle(color: AppColors.textPrimary),
		),
		iconTheme: const IconThemeData(
			color: AppColors.emeraldPrimary,
		),
		floatingActionButtonTheme: const FloatingActionButtonThemeData(
			backgroundColor: AppColors.emeraldPrimary,
			foregroundColor: AppColors.textPrimary,
		),
	);
}