import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models.dart';
import '../state/app_state.dart';
import '../widgets/dua_view.dart';
import 'settings_screen.dart';

/// Duaları sayfa sayfa gösterir; sağa-sola kaydırarak gezilebilir.
class DuaDetailScreen extends StatefulWidget {
  const DuaDetailScreen({
    super.key,
    required this.duas,
    this.initialIndex = 0,
    this.title,
  });

  final List<Dua> duas;
  final int initialIndex;
  final String? title;

  @override
  State<DuaDetailScreen> createState() => _DuaDetailScreenState();
}

class _DuaDetailScreenState extends State<DuaDetailScreen> {
  late final PageController _controller = PageController(
    initialPage: widget.initialIndex,
  );
  late int _index = widget.initialIndex;

  Dua get _current => widget.duas[_index];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _copy() {
    final dua = _current;
    final text = [
      dua.title,
      ?dua.arabic,
      dua.okunus,
      dua.anlam,
      if (dua.kaynak != null) 'Kaynak: ${dua.kaynak}',
    ].join('\n\n');
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Dua panoya kopyalandı')));
  }

  void _goTo(int index) => _controller.animateToPage(
    index,
    duration: const Duration(milliseconds: 250),
    curve: Curves.easeOut,
  );

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final favorite = state.isFavorite(_current.id);
    final count = widget.duas.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Dua'),
        actions: [
          IconButton(
            tooltip: favorite ? 'Favorilerden çıkar' : 'Favorilere ekle',
            icon: Icon(favorite ? Icons.star : Icons.star_border),
            onPressed: () => state.toggleFavorite(_current.id),
          ),
          IconButton(
            tooltip: 'Kopyala',
            icon: const Icon(Icons.copy_outlined),
            onPressed: _copy,
          ),
          IconButton(
            tooltip: 'Yazı boyutu',
            icon: const Icon(Icons.text_fields),
            onPressed: () => showTextSizeSheet(context),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _controller,
        itemCount: count,
        onPageChanged: (i) => setState(() => _index = i),
        itemBuilder: (_, i) => DuaView(dua: widget.duas[i]),
      ),
      bottomNavigationBar: count < 2
          ? null
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Row(
                  children: [
                    IconButton.filledTonal(
                      tooltip: 'Önceki dua',
                      onPressed: _index > 0 ? () => _goTo(_index - 1) : null,
                      icon: const Icon(Icons.chevron_left),
                    ),
                    Expanded(
                      child: Text(
                        '${_index + 1} / $count',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    IconButton.filledTonal(
                      tooltip: 'Sonraki dua',
                      onPressed: _index < count - 1
                          ? () => _goTo(_index + 1)
                          : null,
                      icon: const Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
