import 'package:flutter/widgets.dart';

/// Tek bir dua veya zikir.
class Dua {
  const Dua({
    required this.id,
    required this.title,
    required this.when,
    this.arabic,
    required this.okunus,
    required this.anlam,
    this.kaynak,
    this.not,
  });

  final String id;
  final String title;

  /// Ne zaman / nerede okunduğu.
  final String when;

  /// Arapça metin. Yalnızca Türkçe yapılan niyetlerde boş olabilir.
  final String? arabic;

  /// Latin harfleriyle okunuşu.
  final String okunus;

  /// Türkçe anlamı.
  final String anlam;

  final String? kaynak;
  final String? not;

  /// Aramada kullanılan, küçük harfe çevrilmiş ve sadeleştirilmiş metin.
  String get searchText => normalizeForSearch('$title $when $okunus $anlam');
}

class DuaCategory {
  const DuaCategory({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.duas,
  });

  final String id;
  final String title;
  final String description;
  final IconData icon;
  final List<Dua> duas;
}

/// Rehber adımlarının içerik blokları.
sealed class GuideBlock {
  const GuideBlock();
}

class GuideParagraph extends GuideBlock {
  const GuideParagraph(this.text);
  final String text;
}

class GuideBullets extends GuideBlock {
  const GuideBullets(this.items, {this.title, this.numbered = false});
  final String? title;
  final List<String> items;
  final bool numbered;
}

class GuideCallout extends GuideBlock {
  const GuideCallout(this.text, {this.warning = false});
  final String text;
  final bool warning;
}

class GuideStep {
  const GuideStep({
    required this.id,
    required this.title,
    required this.summary,
    required this.icon,
    required this.blocks,
    this.duaIds = const [],
    this.counterMode,
  });

  final String id;
  final String title;
  final String summary;
  final IconData icon;
  final List<GuideBlock> blocks;

  /// Bu adımda okunan duaların kimlikleri.
  final List<String> duaIds;

  /// Bu adım için sayaç kısayolu gösterilecekse sayaç türü.
  final CounterMode? counterMode;
}

class ChecklistSection {
  const ChecklistSection({
    required this.id,
    required this.title,
    required this.icon,
    required this.items,
  });

  final String id;
  final String title;
  final IconData icon;
  final List<String> items;

  String itemKey(int index) => '$id.$index';
}

enum CounterMode { tavaf, say }

/// Türkçe karakterleri ve şapkalı harfleri sadeleştirerek arama yapılabilir hale getirir.
String normalizeForSearch(String input) {
  const map = {
    'İ': 'i',
    'I': 'i',
    'ı': 'i',
    'î': 'i',
    'Î': 'i',
    'â': 'a',
    'Â': 'a',
    'û': 'u',
    'Û': 'u',
    'ş': 's',
    'Ş': 's',
    'ğ': 'g',
    'Ğ': 'g',
    'ü': 'u',
    'Ü': 'u',
    'ö': 'o',
    'Ö': 'o',
    'ç': 'c',
    'Ç': 'c',
    '’': '',
    "'": '',
    '‘': '',
  };
  final buffer = StringBuffer();
  for (final rune in input.runes) {
    final ch = String.fromCharCode(rune);
    buffer.write(map[ch] ?? ch.toLowerCase());
  }
  return buffer.toString();
}
