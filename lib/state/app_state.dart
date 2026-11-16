import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models.dart';

/// Uygulama genelindeki ayarlar ve kullanıcı verileri.
/// Tüm değerler cihazda saklanır; internet bağlantısı gerekmez.
class AppState extends ChangeNotifier {
  AppState(this._prefs) {
    _themeMode = ThemeMode.values[_prefs.getInt(_kTheme) ?? 0];
    _textScale = _prefs.getDouble(_kTextScale) ?? 1.0;
    _showArabic = _prefs.getBool(_kShowArabic) ?? true;
    _showOkunus = _prefs.getBool(_kShowOkunus) ?? true;
    _showAnlam = _prefs.getBool(_kShowAnlam) ?? true;
    _favorites = (_prefs.getStringList(_kFavorites) ?? []).toSet();
    _checked = (_prefs.getStringList(_kChecked) ?? []).toSet();
    _counts = {
      for (final mode in CounterMode.values)
        mode: _prefs.getInt('$_kCounter.${mode.name}') ?? 0,
    };
    _notes = _loadNotes();
  }

  static Future<AppState> load() async =>
      AppState(await SharedPreferences.getInstance());

  static const _kTheme = 'themeMode';
  static const _kTextScale = 'textScale';
  static const _kShowArabic = 'showArabic';
  static const _kShowOkunus = 'showOkunus';
  static const _kShowAnlam = 'showAnlam';
  static const _kFavorites = 'favorites';
  static const _kChecked = 'checklist';
  static const _kCounter = 'counter';
  static const _kNotes = 'userNotes';

  static const minTextScale = 0.85;
  static const maxTextScale = 1.6;

  /// Bir tavaf ya da sa'y yedi şavttır.
  static const savtCount = 7;

  final SharedPreferences _prefs;

  late ThemeMode _themeMode;
  late double _textScale;
  late bool _showArabic;
  late bool _showOkunus;
  late bool _showAnlam;
  late Set<String> _favorites;
  late Set<String> _checked;
  late Map<CounterMode, int> _counts;
  late List<UserNote> _notes;

  ThemeMode get themeMode => _themeMode;
  double get textScale => _textScale;
  bool get showArabic => _showArabic;
  bool get showOkunus => _showOkunus;
  bool get showAnlam => _showAnlam;
  Set<String> get favorites => Set.unmodifiable(_favorites);

  set themeMode(ThemeMode value) {
    _themeMode = value;
    _prefs.setInt(_kTheme, value.index);
    notifyListeners();
  }

  set textScale(double value) {
    _textScale = value.clamp(minTextScale, maxTextScale);
    _prefs.setDouble(_kTextScale, _textScale);
    notifyListeners();
  }

  set showArabic(bool value) {
    _showArabic = value;
    _prefs.setBool(_kShowArabic, value);
    notifyListeners();
  }

  set showOkunus(bool value) {
    _showOkunus = value;
    _prefs.setBool(_kShowOkunus, value);
    notifyListeners();
  }

  set showAnlam(bool value) {
    _showAnlam = value;
    _prefs.setBool(_kShowAnlam, value);
    notifyListeners();
  }

  bool isFavorite(String duaId) => _favorites.contains(duaId);

  void toggleFavorite(String duaId) {
    if (!_favorites.remove(duaId)) _favorites.add(duaId);
    _prefs.setStringList(_kFavorites, _favorites.toList());
    notifyListeners();
  }

  bool isChecked(String key) => _checked.contains(key);

  int checkedCount(ChecklistSection section) =>
      [for (var i = 0; i < section.items.length; i++) section.itemKey(i)]
          .where(_checked.contains)
          .length;

  void toggleChecked(String key) {
    if (!_checked.remove(key)) _checked.add(key);
    _prefs.setStringList(_kChecked, _checked.toList());
    notifyListeners();
  }

  void resetChecklist() {
    _checked.clear();
    _prefs.remove(_kChecked);
    notifyListeners();
  }

  int count(CounterMode mode) => _counts[mode]!;

  void _setCount(CounterMode mode, int value) {
    _counts[mode] = value.clamp(0, savtCount);
    _prefs.setInt('$_kCounter.${mode.name}', _counts[mode]!);
    notifyListeners();
  }

  void increment(CounterMode mode) => _setCount(mode, count(mode) + 1);
  void decrement(CounterMode mode) => _setCount(mode, count(mode) - 1);
  void resetCounter(CounterMode mode) => _setCount(mode, 0);

  List<UserNote> _loadNotes() {
    final raw = _prefs.getString(_kNotes);
    if (raw == null) return [];
    try {
      return [
        for (final item in jsonDecode(raw) as List)
          UserNote.fromJson(item as Map<String, dynamic>),
      ];
    } on FormatException {
      return [];
    }
  }

  void _saveNotes() {
    _prefs.setString(_kNotes, jsonEncode([for (final n in _notes) n.toJson()]));
    notifyListeners();
  }

  /// Bir aşamaya ait kişisel notlar, eklenme sırasıyla.
  List<UserNote> notesFor(String phaseId) =>
      _notes.where((n) => n.phaseId == phaseId).toList();

  void addNote(String phaseId, String text) {
    final now = DateTime.now();
    _notes.add(
      UserNote(
        id: now.microsecondsSinceEpoch.toString(),
        phaseId: phaseId,
        text: text,
        updatedAt: now,
      ),
    );
    _saveNotes();
  }

  void updateNote(UserNote note, String text) {
    final index = _notes.indexWhere((n) => n.id == note.id);
    if (index < 0) return;
    _notes[index] = note.copyWith(text: text, updatedAt: DateTime.now());
    _saveNotes();
  }

  /// Notu siler ve geri almak için eski konumunu döndürür.
  int deleteNote(UserNote note) {
    final index = _notes.indexWhere((n) => n.id == note.id);
    if (index >= 0) {
      _notes.removeAt(index);
      _saveNotes();
    }
    return index;
  }

  void restoreNote(UserNote note, int index) {
    _notes.insert(index.clamp(0, _notes.length), note);
    _saveNotes();
  }
}

/// [AppState]'i widget ağacına taşır ve değişikliklerde yeniden çizim yapar.
class AppScope extends InheritedNotifier<AppState> {
  const AppScope({super.key, required AppState state, required super.child})
    : super(notifier: state);

  static AppState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppScope>()!.notifier!;

  /// Yeniden çizime abone olmadan erişim (ör. buton geri çağrılarında).
  static AppState read(BuildContext context) =>
      context.getInheritedWidgetOfExactType<AppScope>()!.notifier!;
}
