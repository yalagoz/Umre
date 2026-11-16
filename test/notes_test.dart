import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umre/data/notlar.dart';
import 'package:umre/main.dart';
import 'package:umre/services/pdf_export.dart';
import 'package:umre/state/app_state.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('not verileri', () {
    test('dört aşama benzersiz ve dolu', () {
      expect(tripPhases.map((p) => p.id), ['once', 'mekke', 'medine', 'donus']);
      for (final phase in tripPhases) {
        expect(phase.sections, isNotEmpty, reason: phase.id);
        for (final section in phase.sections) {
          expect(section.items, isNotEmpty, reason: section.title);
          for (final link in section.links) {
            expect(Uri.parse(link.url).scheme, 'https', reason: link.url);
          }
        }
      }
    });

    test('yalnızca "Gitmeden Önce" hazırlık listesini içerir', () {
      expect(tripPhases.where((p) => p.includesChecklist).map((p) => p.id), [
        'once',
      ]);
    });

    test('PDF dosya adları', () {
      expect(
        pdfFileName([tripPhaseById('once')]),
        'umre-notlari-gitmeden-once.pdf',
      );
      expect(pdfFileName(tripPhases), 'umre-notlari-tumu.pdf');
    });
  });

  group('kişisel notlar', () {
    test('eklenen, düzenlenen ve silinen notlar saklanır', () async {
      SharedPreferences.setMockInitialValues({});
      final prefs = await SharedPreferences.getInstance();
      final state = AppState(prefs);

      state.addNote('mekke', 'Kral Abdülaziz Kapısı');
      state.addNote('medine', 'Bakî ikindiden sonra');
      expect(state.notesFor('mekke').single.text, 'Kral Abdülaziz Kapısı');

      state.updateNote(state.notesFor('mekke').single, 'Düzenlendi');
      final reloaded = AppState(prefs);
      expect(reloaded.notesFor('mekke').single.text, 'Düzenlendi');
      expect(reloaded.notesFor('medine'), hasLength(1));

      final note = reloaded.notesFor('mekke').single;
      final index = reloaded.deleteNote(note);
      expect(reloaded.notesFor('mekke'), isEmpty);
      reloaded.restoreNote(note, index);
      expect(AppState(prefs).notesFor('mekke').single.id, note.id);
    });

    test('bozuk kayıt uygulamayı çökertmez', () async {
      SharedPreferences.setMockInitialValues({'userNotes': '{bozuk'});
      final state = AppState(await SharedPreferences.getInstance());
      expect(state.notesFor('once'), isEmpty);
    });
  });

  group('PDF', () {
    Future<List<int>> build(List phases, AppState state) => buildTripPdf(
      phases: phases.cast(),
      notesFor: state.notesFor,
      isChecked: state.isChecked,
      now: DateTime(2026, 11, 16),
    );

    test('her bölüm ve tümü için geçerli PDF üretilir', () async {
      SharedPreferences.setMockInitialValues({});
      final state = AppState(await SharedPreferences.getInstance());
      state.addNote('mekke', 'Şemsiye ve su şişesi almayı unutma — ğüşıöç');
      state.toggleChecked('evrak.0');

      for (final phase in tripPhases) {
        final bytes = await build([phase], state);
        expect(String.fromCharCodes(bytes.take(5)), '%PDF-', reason: phase.id);
        expect(bytes.length, greaterThan(5000), reason: phase.id);
      }
      final all = await build(tripPhases, state);
      final mekke = await build([tripPhaseById('mekke')], state);
      expect(all.length, greaterThan(mekke.length));
    });
  });

  group('Notlar ekranı', () {
    testWidgets('not eklenir, silinir ve geri alınır', (tester) async {
      tester.view.devicePixelRatio = 3;
      tester.view.physicalSize = const Size(1080, 2400);
      addTearDown(tester.view.reset);
      SharedPreferences.setMockInitialValues({});
      final state = await AppState.load();
      await tester.pumpWidget(UmreApp(state: state));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Notlar'));
      await tester.pumpAndSettle();
      expect(find.text('Umre Notları'), findsOneWidget);
      expect(find.text('Vize Nasıl Alınır?'), findsOneWidget);

      await tester.tap(find.text('Mekke'));
      await tester.pumpAndSettle();
      expect(find.text('Mescid-i Haram Kapıları'), findsOneWidget);

      await tester.tap(find.text('Not Ekle'));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'Su şişesi al');
      await tester.tap(find.text('Kaydet'));
      await tester.pumpAndSettle();
      expect(state.notesFor('mekke').single.text, 'Su şişesi al');

      final card = find.text('Su şişesi al');
      await tester.scrollUntilVisible(
        card,
        300,
        scrollable: find
            .descendant(
              of: find.byType(ListView).first,
              matching: find.byType(Scrollable),
            )
            .first,
      );
      await tester.tap(find.byTooltip('Not seçenekleri'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Sil'));
      await tester.pumpAndSettle();
      expect(state.notesFor('mekke'), isEmpty);

      await tester.tap(find.text('Geri Al'));
      await tester.pumpAndSettle();
      expect(state.notesFor('mekke'), hasLength(1));
    });

    testWidgets('PDF seçenekleri listelenir', (tester) async {
      SharedPreferences.setMockInitialValues({});
      final state = await AppState.load();
      await tester.pumpWidget(UmreApp(state: state));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Notlar'));
      await tester.pumpAndSettle();
      await tester.tap(find.byTooltip('PDF olarak indir'));
      await tester.pumpAndSettle();

      for (final phase in tripPhases) {
        expect(find.text(phase.title), findsOneWidget);
      }
      expect(find.text('Tüm Notlar'), findsOneWidget);
    });
  });
}
