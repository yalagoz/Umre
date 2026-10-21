import 'package:flutter/material.dart';

import '../data/dualar.dart';
import '../data/rehber.dart';
import '../models.dart';
import '../state/app_state.dart';
import '../widgets/common.dart';
import 'counter_screen.dart';

/// Rehber adımlarını sayfa sayfa gösterir.
class GuideDetailScreen extends StatefulWidget {
  const GuideDetailScreen({super.key, required this.initialIndex});

  final int initialIndex;

  @override
  State<GuideDetailScreen> createState() => _GuideDetailScreenState();
}

class _GuideDetailScreenState extends State<GuideDetailScreen> {
  late final PageController _controller = PageController(
    initialPage: widget.initialIndex,
  );
  late int _index = widget.initialIndex;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goTo(int index) => _controller.animateToPage(
    index,
    duration: const Duration(milliseconds: 250),
    curve: Curves.easeOut,
  );

  @override
  Widget build(BuildContext context) {
    final count = guideSteps.length;
    return Scaffold(
      appBar: AppBar(title: Text('Adım ${_index + 1} / $count')),
      body: PageView.builder(
        controller: _controller,
        itemCount: count,
        onPageChanged: (i) => setState(() => _index = i),
        itemBuilder: (_, i) => _GuideStepView(step: guideSteps[i]),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _index > 0 ? () => _goTo(_index - 1) : null,
                  icon: const Icon(Icons.chevron_left),
                  label: const Text('Önceki'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _index < count - 1
                      ? () => _goTo(_index + 1)
                      : null,
                  icon: const Icon(Icons.chevron_right),
                  label: const Text('Sonraki'),
                  iconAlignment: IconAlignment.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GuideStepView extends StatelessWidget {
  const _GuideStepView({required this.step});

  final GuideStep step;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final scale = AppScope.of(context).textScale;
    final bodyStyle = TextStyle(
      fontSize: 16 * scale,
      height: 1.5,
      color: scheme.onSurface,
    );
    final duas = [for (final id in step.duaIds) duaById[id]!];

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: scheme.primaryContainer,
              foregroundColor: scheme.onPrimaryContainer,
              child: Icon(step.icon, size: 28),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.title,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    step.summary,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: scheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        for (final block in step.blocks) ...[
          const SizedBox(height: 14),
          switch (block) {
            GuideParagraph(:final text) => Text(text, style: bodyStyle),
            GuideCallout(:final text, :final warning) => Callout(
              text: text,
              warning: warning,
            ),
            GuideBullets() => _Bullets(block: block, style: bodyStyle),
          },
        ],
        if (step.counterMode != null) ...[
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CounterScreen(initialMode: step.counterMode!),
              ),
            ),
            icon: const Icon(Icons.radio_button_checked),
            label: Text(
              step.counterMode == CounterMode.tavaf
                  ? 'Tavaf Sayacını Aç'
                  : "Sa'y Sayacını Aç",
            ),
          ),
        ],
        if (duas.isNotEmpty) ...[
          const SizedBox(height: 24),
          Text(
            'Bu Adımın Duaları',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: scheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                for (var i = 0; i < duas.length; i++)
                  ListTile(
                    leading: Icon(Icons.menu_book, color: scheme.primary),
                    title: Text(duas[i].title),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => openDuas(context, duas, i, title: step.title),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _Bullets extends StatelessWidget {
  const _Bullets({required this.block, required this.style});

  final GuideBullets block;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (block.title != null) ...[
          Text(
            block.title!,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
        for (var i = 0; i < block.items.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28,
                  child: block.numbered
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
                Expanded(child: Text(block.items[i], style: style)),
              ],
            ),
          ),
      ],
    );
  }
}
