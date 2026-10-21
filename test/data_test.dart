import 'package:flutter_test/flutter_test.dart';
import 'package:umre/data/dualar.dart';
import 'package:umre/data/hazirlik.dart';
import 'package:umre/data/rehber.dart';
import 'package:umre/models.dart';

void main() {
  test('aynı kimliği taşıyan farklı dua yok', () {
    final seen = <String, Dua>{};
    for (final category in duaCategories) {
      for (final dua in category.duas) {
        final previous = seen.putIfAbsent(dua.id, () => dua);
        expect(identical(previous, dua), isTrue, reason: dua.id);
      }
    }
  });

  test('duaların zorunlu alanları dolu', () {
    for (final dua in duaById.values) {
      expect(dua.title.trim(), isNotEmpty, reason: dua.id);
      expect(dua.when.trim(), isNotEmpty, reason: dua.id);
      expect(dua.okunus.trim(), isNotEmpty, reason: dua.id);
      expect(dua.anlam.trim(), isNotEmpty, reason: dua.id);
      if (dua.arabic != null) {
        expect(
          RegExp(r'[\u0600-\u06FF]').hasMatch(dua.arabic!),
          isTrue,
          reason: '${dua.id} Arapça metin içermeli',
        );
      }
    }
  });

  test('rehberde geçen tüm dualar tanımlı', () {
    for (final step in guideSteps) {
      for (final id in step.duaIds) {
        expect(duaById.containsKey(id), isTrue, reason: '${step.id} → $id');
      }
    }
  });

  test('rehber ve liste kimlikleri benzersiz', () {
    final stepIds = guideSteps.map((s) => s.id).toList();
    expect(stepIds.toSet().length, stepIds.length);
    final sectionIds = checklistSections.map((s) => s.id).toList();
    expect(sectionIds.toSet().length, sectionIds.length);
  });

  test('umrenin dört temel adımı rehberde var', () {
    for (final id in ['mikat', 'tavaf', 'say', 'tiras']) {
      expect(guideStepById(id), isNotNull, reason: id);
    }
  });

  test('arama metni Türkçe karakterlerden bağımsız', () {
    expect(normalizeForSearch("Sa'y İçin Şükür"), 'say icin sukur');
    expect(normalizeForSearch('Lâ ilâhe'), 'la ilahe');
    expect(telbiye.searchText.contains(normalizeForSearch('Telbiye')), isTrue);
  });
}
