import 'package:flutter/material.dart';

import '../models.dart';
import '../screens/dua_detail_screen.dart';
import '../screens/settings_screen.dart';
import '../state/app_state.dart';

/// Uygulama çubuğundaki ayarlar butonu.
class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Ayarlar',
      icon: const Icon(Icons.settings_outlined),
      onPressed: () =>
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const SettingsScreen())),
    );
  }
}

/// Bir dua listesini ayrıntı ekranında, seçilen duadan başlayarak açar.
void openDuas(
  BuildContext context,
  List<Dua> duas,
  int index, {
  String? title,
}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) =>
          DuaDetailScreen(duas: duas, initialIndex: index, title: title),
    ),
  );
}

class DuaTile extends StatelessWidget {
  const DuaTile({super.key, required this.dua, required this.onTap});

  final Dua dua;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final favorite = AppScope.of(context).isFavorite(dua.id);
    return ListTile(
      onTap: onTap,
      title: Text(
        dua.title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(dua.when, maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: favorite
          ? Icon(Icons.star, color: scheme.tertiary, semanticLabel: 'Favori')
          : const Icon(Icons.chevron_right),
    );
  }
}

/// Bilgi veya uyarı kutusu.
class Callout extends StatelessWidget {
  const Callout({super.key, required this.text, this.warning = false});

  final String text;
  final bool warning;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final background = warning
        ? scheme.errorContainer
        : scheme.secondaryContainer;
    final foreground = warning
        ? scheme.onErrorContainer
        : scheme.onSecondaryContainer;
    final scale = AppScope.of(context).textScale;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            warning ? Icons.warning_amber_rounded : Icons.lightbulb_outline,
            color: foreground,
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: foreground,
                fontSize: 15 * scale,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final IconData? icon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                if (subtitle != null)
                  Text(subtitle!, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}

/// Madde işaretli veya numaralı liste.
class BulletList extends StatelessWidget {
  const BulletList({
    super.key,
    required this.items,
    required this.style,
    this.numbered = false,
  });

  final List<String> items;
  final TextStyle style;
  final bool numbered;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < items.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28,
                  child: numbered
                      ? CircleAvatar(
                          radius: 11,
                          backgroundColor: scheme.primary,
                          child: Text(
                            '${i + 1}',
                            style: TextStyle(
                              fontSize: 12,
                              color: scheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 8, left: 6),
                          child: Icon(
                            Icons.circle,
                            size: 7,
                            color: scheme.primary,
                          ),
                        ),
                ),
                const SizedBox(width: 6),
                Expanded(child: Text(items[i], style: style)),
              ],
            ),
          ),
      ],
    );
  }
}
