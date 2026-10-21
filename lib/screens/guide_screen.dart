import 'package:flutter/material.dart';

import '../data/rehber.dart';
import '../widgets/common.dart';
import 'guide_detail_screen.dart';

/// Adım adım umre rehberinin listesi.
class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  /// Umrenin dört temel adımı ve rehberdeki karşılıkları.
  static const _coreSteps = [
    ('İhram', Icons.checkroom, 'mikat'),
    ('Tavaf', Icons.sync, 'tavaf'),
    ("Sa'y", Icons.swap_vert, 'say'),
    ('Tıraş', Icons.content_cut, 'tiras'),
  ];

  void _open(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => GuideDetailScreen(initialIndex: index)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Umre Rehberi'),
        actions: const [SettingsButton()],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    scheme.primary,
                    scheme.primary.withValues(alpha: 0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Umrenin 4 adımı',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: scheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Bir adıma dokunarak ayrıntıları görün.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: scheme.onPrimary.withValues(alpha: 0.85),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      for (var i = 0; i < _coreSteps.length; i++) ...[
                        if (i > 0)
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: scheme.onPrimary.withValues(alpha: 0.7),
                          ),
                        Expanded(
                          child: _CoreStepButton(
                            label: _coreSteps[i].$1,
                            icon: _coreSteps[i].$2,
                            onTap: () => _open(
                              context,
                              guideSteps.indexWhere(
                                (s) => s.id == _coreSteps[i].$3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SectionHeader(
            title: 'Adım Adım Umre',
            icon: Icons.format_list_numbered,
          ),
          for (var i = 0; i < guideSteps.length; i++)
            ListTile(
              onTap: () => _open(context, i),
              leading: CircleAvatar(
                backgroundColor: scheme.primaryContainer,
                foregroundColor: scheme.onPrimaryContainer,
                child: Icon(guideSteps[i].icon, size: 22),
              ),
              title: Text(
                guideSteps[i].title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(guideSteps[i].summary),
              trailing: const Icon(Icons.chevron_right),
            ),
        ],
      ),
    );
  }
}

class _CoreStepButton extends StatelessWidget {
  const _CoreStepButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: scheme.onPrimary.withValues(alpha: 0.18),
              child: Icon(icon, color: scheme.onPrimary),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: scheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
