import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:umre/main.dart';
import 'package:umre/models.dart';
import 'package:umre/state/app_state.dart';

Future<AppState> pumpApp(
  WidgetTester tester, [
  Map<String, Object> prefs = const {},
]) async {
  SharedPreferences.setMockInitialValues(prefs);
  final state = await AppState.load();
  await tester.pumpWidget(UmreApp(state: state));
  await tester.pumpAndSettle();
  return state;
}

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('rehber ekranı açılır ve bir adım görüntülenir', (tester) async {
    await pumpApp(tester);

    expect(find.text('Umre Rehberi'), findsOneWidget);
    expect(find.text('Umrenin 4 adımı'), findsOneWidget);

    await tester.tap(find.text('Tavaf').first);
    await tester.pumpAndSettle();

    expect(find.text('Umre Tavafı'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Tavaf Sayacını Aç'),
      300,
      scrollable: find.byType(Scrollable).last,
    );
    expect(find.text('Tavaf Sayacını Aç'), findsOneWidget);
  });

  testWidgets('dua aranır ve ayrıntısı açılır', (tester) async {
    final state = await pumpApp(tester);

    await tester.tap(find.text('Dualar'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(SearchBar), 'zemzem');
    await tester.pumpAndSettle();

    expect(find.text('Zemzem İçerken'), findsOneWidget);
    expect(find.text('Telbiye'), findsNothing);

    await tester.tap(find.text('Zemzem İçerken'));
    await tester.pumpAndSettle();

    expect(find.textContaining('ilmen nâfiâ'), findsOneWidget);

    await tester.tap(find.byTooltip('Favorilere ekle'));
    await tester.pump();
    expect(state.isFavorite('zemzem'), isTrue);
  });

  testWidgets('sayaç yedi şavtta tamamlanır ve sınırı aşmaz', (tester) async {
    // Tipik bir telefon ekranı: buton kaydırmadan görünür olmalı.
    tester.view.devicePixelRatio = 3;
    tester.view.physicalSize = const Size(1080, 2400);
    addTearDown(tester.view.reset);
    final state = await pumpApp(tester);

    await tester.tap(find.text('Sayaç'));
    await tester.pumpAndSettle();

    for (var i = 1; i <= 7; i++) {
      await tester.tap(find.text('$i. Şavt Tamam'));
      await tester.pump();
    }
    expect(state.count(CounterMode.tavaf), 7);
    expect(find.text('Tavaf tamamlandı'), findsOneWidget);
    expect(find.text('Yeniden Başla'), findsOneWidget);

    // Halkaya dokunmak 7'yi aşmamalı.
    await tester.tap(find.text('Tamamlandı'));
    await tester.pump();
    expect(state.count(CounterMode.tavaf), 7);

    await tester.tap(find.text('Geri Al'));
    await tester.pump();
    expect(state.count(CounterMode.tavaf), 6);

    await tester.tap(find.text("Sa'y"));
    await tester.pumpAndSettle();
    expect(find.text('1. şavt: Safa → Merve'), findsOneWidget);
    expect(state.count(CounterMode.say), 0);
  });

  testWidgets('sayaç değeri yeniden açılışta korunur', (tester) async {
    await pumpApp(tester, {'counter.say': 3});

    await tester.tap(find.text('Sayaç'));
    await tester.pumpAndSettle();
    await tester.tap(find.text("Sa'y"));
    await tester.pumpAndSettle();

    expect(find.text('4. şavt: Merve → Safa'), findsOneWidget);
  });

  testWidgets('hazırlık listesi işaretlenir', (tester) async {
    final state = await pumpApp(tester);

    await tester.tap(find.text('Hazırlık'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Pasaport (en az 6 ay geçerli)'));
    await tester.pump();

    expect(state.isChecked('evrak.0'), isTrue);
    expect(find.textContaining('1 / '), findsWidgets);
  });
}
