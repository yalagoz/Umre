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

class NoteLink {
  const NoteLink(this.label, this.url);

  final String label;
  final String url;
}

/// Seyahat notlarında başlıklı bir madde grubu.
class TripNoteSection {
  const TripNoteSection({
    required this.title,
    required this.icon,
    required this.items,
    this.numbered = false,
    this.links = const [],
    this.warning,
    this.important = false,
  });

  final String title;
  final IconData icon;
  final List<String> items;
  final bool numbered;
  final List<NoteLink> links;

  /// Ekranda ve PDF'te "Önemli" olarak vurgulanır.
  final bool important;

  /// Bölümün altında gösterilen uyarı metni.
  final String? warning;
}

/// Yolculuğun bir aşaması: gitmeden önce, Mekke, Medine, dönüş.
class TripPhase {
  const TripPhase({
    required this.id,
    required this.title,
    required this.tabLabel,
    required this.icon,
    required this.sections,
    this.includesChecklist = false,
  });

  final String id;
  final String title;
  final String tabLabel;
  final IconData icon;
  final List<TripNoteSection> sections;

  /// PDF'e hazırlık listesinin de eklenip eklenmeyeceği.
  final bool includesChecklist;
}

/// Kullanıcının kendi yazdığı not.
class UserNote {
  const UserNote({
    required this.id,
    required this.phaseId,
    required this.text,
    required this.updatedAt,
  });

  final String id;
  final String phaseId;
  final String text;
  final DateTime updatedAt;

  UserNote copyWith({String? text, DateTime? updatedAt}) => UserNote(
    id: id,
    phaseId: phaseId,
    text: text ?? this.text,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  Map<String, Object> toJson() => {
    'id': id,
    'phase': phaseId,
    'text': text,
    'updated': updatedAt.toIso8601String(),
  };

  factory UserNote.fromJson(Map<String, dynamic> json) => UserNote(
    id: json['id'] as String,
    phaseId: json['phase'] as String,
    text: json['text'] as String,
    updatedAt: DateTime.parse(json['updated'] as String),
  );
}

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
