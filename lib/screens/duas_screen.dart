import 'package:flutter/material.dart';

import '../data/dualar.dart';
import '../models.dart';
import '../state/app_state.dart';
import '../widgets/common.dart';

/// Kategorilere ayrılmış dua listesi, arama ve favoriler.
class DuasScreen extends StatefulWidget {
  const DuasScreen({super.key});

  @override
  State<DuasScreen> createState() => _DuasScreenState();
}

class _DuasScreenState extends State<DuasScreen> {
  final _searchController = TextEditingController();
  String _query = '';
  bool _onlyFavorites = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final query = normalizeForSearch(_query.trim());

    bool matches(Dua dua) =>
        (!_onlyFavorites || state.isFavorite(dua.id)) &&
        (query.isEmpty || dua.searchText.contains(query));

    final filtering = query.isNotEmpty || _onlyFavorites;
    final results = filtering
        ? duaById.values.where(matches).toList()
        : const <Dua>[];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dualar'),
        actions: const [SettingsButton()],
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
            child: SearchBar(
              controller: _searchController,
              hintText: 'Dua ara (ör. telbiye, zemzem)',
              leading: const Icon(Icons.search),
              elevation: const WidgetStatePropertyAll(0),
              trailing: [
                if (_query.isNotEmpty)
                  IconButton(
                    tooltip: 'Temizle',
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _searchController.clear();
                      setState(() => _query = '');
                    },
                  ),
              ],
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Wrap(
              spacing: 8,
              children: [
                ChoiceChip(
                  label: const Text('Tümü'),
                  selected: !_onlyFavorites,
                  onSelected: (_) => setState(() => _onlyFavorites = false),
                ),
                ChoiceChip(
                  avatar: const Icon(Icons.star, size: 18),
                  label: Text('Favoriler (${state.favorites.length})'),
                  selected: _onlyFavorites,
                  onSelected: (_) => setState(() => _onlyFavorites = true),
                ),
              ],
            ),
          ),
          if (filtering) ...[
            if (results.isEmpty)
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  _onlyFavorites && query.isEmpty
                      ? 'Henüz favori dua eklemediniz.\nBir duayı açıp ☆ simgesine dokunarak ekleyebilirsiniz.'
                      : 'Aramanıza uygun dua bulunamadı.',
                  textAlign: TextAlign.center,
                ),
              )
            else ...[
              const SizedBox(height: 8),
              for (var i = 0; i < results.length; i++)
                DuaTile(
                  dua: results[i],
                  onTap: () => openDuas(
                    context,
                    results,
                    i,
                    title: _onlyFavorites ? 'Favoriler' : 'Arama',
                  ),
                ),
            ],
          ] else
            for (final category in duaCategories) ...[
              SectionHeader(
                title: category.title,
                subtitle: category.description,
                icon: category.icon,
              ),
              for (var i = 0; i < category.duas.length; i++)
                DuaTile(
                  dua: category.duas[i],
                  onTap: () => openDuas(
                    context,
                    category.duas,
                    i,
                    title: category.title,
                  ),
                ),
            ],
        ],
      ),
    );
  }
}
