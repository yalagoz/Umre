import 'package:flutter/material.dart';

import '../data/hazirlik.dart';
import '../state/app_state.dart';
import '../widgets/common.dart';

/// Yolculuk için işaretlenebilir hazırlık listesi.
class ChecklistScreen extends StatelessWidget {
  const ChecklistScreen({super.key});

  Future<void> _confirmReset(BuildContext context, AppState state) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Listeyi sıfırla'),
        content: const Text('Tüm işaretler kaldırılsın mı?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Vazgeç'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Sıfırla'),
          ),
        ],
      ),
    );
    if (ok == true) state.resetChecklist();
  }

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final theme = Theme.of(context);
    final total = checklistSections.fold<int>(
      0,
      (sum, s) => sum + s.items.length,
    );
    final done = checklistSections.fold<int>(
      0,
      (sum, s) => sum + state.checkedCount(s),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hazırlık Listesi'),
        actions: [
          IconButton(
            tooltip: 'Listeyi sıfırla',
            icon: const Icon(Icons.restart_alt),
            onPressed: done == 0 ? null : () => _confirmReset(context, state),
          ),
          const SettingsButton(),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      done == total
                          ? 'Hazırsınız, hayırlı yolculuklar!'
                          : '$done / $total hazır',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: total == 0 ? 0 : done / total,
                        minHeight: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          for (final section in checklistSections) ...[
            SectionHeader(
              title: section.title,
              icon: section.icon,
              trailing: Text(
                '${state.checkedCount(section)} / ${section.items.length}',
                style: theme.textTheme.labelLarge,
              ),
            ),
            for (var i = 0; i < section.items.length; i++)
              CheckboxListTile(
                value: state.isChecked(section.itemKey(i)),
                onChanged: (_) => state.toggleChecked(section.itemKey(i)),
                title: Text(
                  section.items[i],
                  style: state.isChecked(section.itemKey(i))
                      ? TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: theme.colorScheme.onSurfaceVariant,
                        )
                      : null,
                ),
                controlAffinity: ListTileControlAffinity.leading,
              ),
          ],
        ],
      ),
    );
  }
}
