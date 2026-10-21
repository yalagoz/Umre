import 'package:flutter/material.dart';

import '../models.dart';
import '../state/app_state.dart';
import '../theme.dart';
import 'common.dart';

/// Bir duanın Arapça metni, okunuşu ve anlamıyla birlikte gösterimi.
class DuaView extends StatelessWidget {
  const DuaView({super.key, required this.dua});

  final Dua dua;

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final scale = state.textScale;
    final isNiyet = dua.arabic == null;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      children: [
        Text(
          dua.title,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        _WhenCard(text: dua.when),
        if (dua.arabic != null && state.showArabic) ...[
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: scheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: brandGold.withValues(alpha: 0.6)),
            ),
            child: Text(
              dua.arabic!,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: arabicFontFamily,
                fontSize: 27 * scale,
                height: 2.1,
                color: scheme.onSurface,
              ),
            ),
          ),
        ],
        if (isNiyet || state.showOkunus) ...[
          const SizedBox(height: 20),
          _Label(isNiyet ? 'Niyet' : 'Okunuşu'),
          const SizedBox(height: 6),
          SelectableText(
            dua.okunus,
            style: TextStyle(
              fontSize: 18 * scale,
              height: 1.55,
              fontStyle: isNiyet ? FontStyle.normal : FontStyle.italic,
              fontWeight: FontWeight.w500,
              color: scheme.onSurface,
            ),
          ),
        ],
        if (isNiyet || state.showAnlam) ...[
          const SizedBox(height: 20),
          _Label(isNiyet ? 'Açıklama' : 'Anlamı'),
          const SizedBox(height: 6),
          SelectableText(
            dua.anlam,
            style: TextStyle(
              fontSize: 17 * scale,
              height: 1.55,
              color: scheme.onSurface,
            ),
          ),
        ],
        if (dua.not != null) ...[
          const SizedBox(height: 20),
          Callout(text: dua.not!),
        ],
        if (dua.kaynak != null) ...[
          const SizedBox(height: 20),
          Text(
            'Kaynak: ${dua.kaynak}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text.toUpperCase(),
      style: theme.textTheme.labelMedium?.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.1,
      ),
    );
  }
}

class _WhenCard extends StatelessWidget {
  const _WhenCard({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.schedule, size: 20, color: scheme.primary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: scheme.onSurfaceVariant,
              fontSize: 15,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
