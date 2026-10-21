import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/dualar.dart';
import '../models.dart';
import '../state/app_state.dart';
import '../widgets/common.dart';

/// Tavaf ve sa'y için şavt sayacı. Sayı cihazda saklanır,
/// uygulama kapansa bile kaldığınız yerden devam eder.
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key, required this.initialMode});

  final CounterMode initialMode;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterMode _mode = widget.initialMode;

  static const _total = AppState.savtCount;

  List<Dua> get _quickDuas => _mode == CounterMode.tavaf
      ? [hacerulesvedTekbir, rabbenaAtina, tavafaBaslarken]
      : [safaMerveZikri, yesilIsiklar, safayaYaklasirken];

  void _increment(AppState state) {
    if (state.count(_mode) >= _total) return;
    state.increment(_mode);
    if (state.count(_mode) == _total) {
      HapticFeedback.heavyImpact();
    } else {
      HapticFeedback.mediumImpact();
    }
  }

  Future<void> _confirmReset(AppState state) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sayacı sıfırla'),
        content: Text(
          '${_mode == CounterMode.tavaf ? 'Tavaf' : "Sa'y"} sayacı sıfırlansın mı?',
        ),
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
    if (ok == true) state.resetCounter(_mode);
  }

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final count = state.count(_mode);
    final done = count >= _total;
    final screen = MediaQuery.sizeOf(context);
    final ringSize = [
      screen.width * 0.68,
      screen.height * 0.36,
      300.0,
    ].reduce(math.min);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tavaf ve Sa'y Sayacı"),
        actions: [
          IconButton(
            tooltip: 'Sıfırla',
            icon: const Icon(Icons.restart_alt),
            onPressed: count == 0 ? null : () => _confirmReset(state),
          ),
          const SettingsButton(),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
        children: [
          SegmentedButton<CounterMode>(
            segments: const [
              ButtonSegment(
                value: CounterMode.tavaf,
                icon: Icon(Icons.sync),
                label: Text('Tavaf'),
              ),
              ButtonSegment(
                value: CounterMode.say,
                icon: Icon(Icons.swap_vert),
                label: Text("Sa'y"),
              ),
            ],
            selected: {_mode},
            onSelectionChanged: (s) => setState(() => _mode = s.first),
          ),
          const SizedBox(height: 24),
          Center(
            child: Semantics(
              button: true,
              label: done
                  ? 'Tamamlandı, $_total şavt'
                  : '$count şavt tamamlandı. Şavtı tamamlamak için dokunun.',
              child: GestureDetector(
                onTap: () => _increment(state),
                child: SizedBox.square(
                  dimension: ringSize,
                  child: CustomPaint(
                    painter: _SavtRingPainter(
                      count: count,
                      total: _total,
                      doneColor: scheme.primary,
                      todoColor: scheme.surfaceContainerHighest,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (done)
                            Icon(
                              Icons.check_circle,
                              size: ringSize * 0.28,
                              color: scheme.primary,
                            )
                          else
                            Text(
                              '$count',
                              style: theme.textTheme.displayLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: ringSize * 0.3,
                                color: scheme.primary,
                              ),
                            ),
                          Text(
                            done ? 'Tamamlandı' : '/ $_total şavt',
                            style: theme.textTheme.titleMedium,
                          ),
                          if (!done) ...[
                            const SizedBox(height: 4),
                            Text(
                              'Dokunarak sayın',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: count == 0 ? null : () => state.decrement(_mode),
                  icon: const Icon(Icons.undo),
                  label: const Text('Geri Al'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: done
                    ? FilledButton.icon(
                        onPressed: () => state.resetCounter(_mode),
                        icon: const Icon(Icons.replay),
                        label: const Text('Yeniden Başla'),
                      )
                    : FilledButton.icon(
                        onPressed: () => _increment(state),
                        icon: const Icon(Icons.add),
                        label: Text('${count + 1}. Şavt Tamam'),
                      ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _HintCard(mode: _mode, count: count),
          const SizedBox(height: 24),
          Text(
            'Okunabilecek Dualar',
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
                for (var i = 0; i < _quickDuas.length; i++)
                  ListTile(
                    leading: Icon(Icons.menu_book, color: scheme.primary),
                    title: Text(_quickDuas[i].title),
                    subtitle: Text(
                      _quickDuas[i].okunus,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => openDuas(
                      context,
                      _quickDuas,
                      i,
                      title: _mode == CounterMode.tavaf
                          ? 'Tavaf Duaları'
                          : "Sa'y Duaları",
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Callout(
            text: 'Şavt sayısında şüpheye düşerseniz az olan sayıyı esas alın. Her şavt için belirlenmiş zorunlu bir dua yoktur; tekbir, tehlil, salavat, Kur\'an ve kendi dualarınızı okuyabilirsiniz.',
          ),
        ],
      ),
    );
  }
}

class _HintCard extends StatelessWidget {
  const _HintCard({required this.mode, required this.count});

  final CounterMode mode;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final current = count + 1;
    final done = count >= AppState.savtCount;

    final String title;
    final String body;
    if (mode == CounterMode.tavaf) {
      if (done) {
        title = 'Tavaf tamamlandı';
        body = "Hacerülesved'i son kez selamlayın. Ardından iki rekât tavaf namazı kılın ve zemzem için. Allah kabul etsin!";
      } else {
        title = '$current. şavt';
        body = [
          if (count == 0) "Hacerülesved hizasında niyet edip istilam yapın; Kâbe solunuzda kalacak şekilde başlayın.",
          if (current <= 3)
            'Erkekler için remel (kısa adımlarla, çalımlı ve hızlı yürüyüş) sünnettir.'
          else
            'Normal yürüyüşle devam edin.',
          "Hacerülesved hizasına gelince sayaca dokunun.",
        ].join(' ');
      }
    } else {
      if (done) {
        title = "Sa'y Merve'de tamamlandı";
        body = 'Şimdi tıraş olarak (saçları kısaltarak) ihramdan çıkabilirsiniz. Allah kabul etsin!';
      } else {
        final toMerve = current.isOdd;
        title = '$current. şavt: ${toMerve ? "Safa → Merve" : "Merve → Safa"}';
        body = [
          if (count == 0) "Safa'da niyet edip Kâbe'ye dönerek tekbir, tehlil ve dua ile başlayın.",
          'Erkekler yeşil ışıklar arasında koşar adımla (hervele) yürür.',
          "${toMerve ? "Merve'ye" : "Safa'ya"} varınca sayaca dokunun.",
        ].join(' ');
      }
    }

    return Card(
      color: done ? scheme.primaryContainer : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              done ? Icons.celebration : Icons.directions_walk,
              color: scheme.primary,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(body, style: const TextStyle(height: 1.4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Yedi şavtı halka üzerinde dilimler halinde çizer.
class _SavtRingPainter extends CustomPainter {
  _SavtRingPainter({
    required this.count,
    required this.total,
    required this.doneColor,
    required this.todoColor,
  });

  final int count;
  final int total;
  final Color doneColor;
  final Color todoColor;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.width * 0.075;
    final rect = Offset.zero & size;
    final arcRect = rect.deflate(stroke / 2);
    const gap = 0.07;
    final sweep = 2 * math.pi / total;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < total; i++) {
      paint.color = i < count ? doneColor : todoColor;
      final start = -math.pi / 2 + i * sweep + gap;
      canvas.drawArc(arcRect, start, sweep - 2 * gap, false, paint);
    }
  }

  @override
  bool shouldRepaint(_SavtRingPainter old) =>
      old.count != count ||
      old.doneColor != doneColor ||
      old.todoColor != todoColor;
}
