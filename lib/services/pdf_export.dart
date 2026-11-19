import 'dart:typed_data';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../data/hazirlik.dart';
import '../models.dart';

const _green = PdfColor.fromInt(0xFF0B6E4F);
const _gold = PdfColor.fromInt(0xFFC9A227);
const _warningBg = PdfColor.fromInt(0xFFFCE8E6);
const _warningFg = PdfColor.fromInt(0xFF8C1D18);
const _muted = PdfColor.fromInt(0xFF5F6B66);

/// PDF dosya adında kullanılan kısa adlar.
const _slugs = {
  'once': 'gitmeden-once',
  'mekke': 'mekke',
  'medine': 'medine',
  'donus': 'donus',
  'ulasim': 'ulasim-ve-yemek',
};

String pdfFileName(List<TripPhase> phases) => phases.length == 1
    ? 'umre-notlari-${_slugs[phases.single.id] ?? phases.single.id}.pdf'
    : 'umre-notlari-tumu.pdf';

String formatDate(DateTime d) =>
    '${d.day.toString().padLeft(2, '0')}.${d.month.toString().padLeft(2, '0')}.${d.year}';

/// Seçilen aşamaların notlarını, kişisel notları ve (gerekiyorsa)
/// hazırlık listesini içeren bir PDF oluşturur.
Future<Uint8List> buildTripPdf({
  required List<TripPhase> phases,
  required List<UserNote> Function(String phaseId) notesFor,
  required bool Function(String checklistKey) isChecked,
  PdfPageFormat format = PdfPageFormat.a4,
  DateTime? now,
}) async {
  final theme = pw.ThemeData.withFont(
    base: pw.Font.ttf(
      await rootBundle.load('assets/fonts/NotoSans-Regular.ttf'),
    ),
    bold: pw.Font.ttf(await rootBundle.load('assets/fonts/NotoSans-Bold.ttf')),
  );
  final doc = pw.Document(title: 'Umre Notları', author: 'Umre Rehberi');
  final subtitle = phases.length == 1 ? phases.single.title : 'Tüm Notlar';

  doc.addPage(
    pw.MultiPage(
      pageTheme: pw.PageTheme(
        pageFormat: format,
        theme: theme,
        margin: const pw.EdgeInsets.fromLTRB(40, 36, 40, 36),
      ),
      footer: (context) => pw.Container(
        margin: const pw.EdgeInsets.only(top: 12),
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'Umre Rehberi · $subtitle',
              style: const pw.TextStyle(fontSize: 8, color: _muted),
            ),
            pw.Text(
              '${context.pageNumber} / ${context.pagesCount}',
              style: const pw.TextStyle(fontSize: 8, color: _muted),
            ),
          ],
        ),
      ),
      build: (context) => [
        _cover(subtitle, now ?? DateTime.now()),
        for (final phase in phases) ...[
          if (phases.length > 1) _phaseTitle(phase.title),
          for (final section in phase.sections) ..._section(section),
          ..._userNotes(notesFor(phase.id)),
          if (phase.includesChecklist) ..._checklist(isChecked),
        ],
      ],
    ),
  );
  return doc.save();
}

pw.Widget _cover(String subtitle, DateTime date) => pw.Container(
  width: double.infinity,
  margin: const pw.EdgeInsets.only(bottom: 16),
  padding: const pw.EdgeInsets.all(18),
  decoration: const pw.BoxDecoration(
    color: _green,
    borderRadius: pw.BorderRadius.all(pw.Radius.circular(10)),
  ),
  child: pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(
        'Umre Notları',
        style: pw.TextStyle(
          fontSize: 24,
          fontWeight: pw.FontWeight.bold,
          color: PdfColors.white,
        ),
      ),
      pw.Container(
        width: 48,
        height: 3,
        margin: const pw.EdgeInsets.symmetric(vertical: 6),
        color: _gold,
      ),
      pw.Text(
        subtitle,
        style: const pw.TextStyle(fontSize: 14, color: PdfColors.white),
      ),
      pw.SizedBox(height: 8),
      pw.Text(
        'Hazırlanma tarihi: ${formatDate(date)}',
        style: const pw.TextStyle(fontSize: 9, color: PdfColors.white),
      ),
    ],
  ),
);

pw.Widget _phaseTitle(String title) => pw.Container(
  margin: const pw.EdgeInsets.only(top: 18, bottom: 4),
  padding: const pw.EdgeInsets.only(bottom: 4),
  decoration: const pw.BoxDecoration(
    border: pw.Border(bottom: pw.BorderSide(color: _gold, width: 2)),
  ),
  child: pw.Text(
    title,
    style: pw.TextStyle(
      fontSize: 18,
      fontWeight: pw.FontWeight.bold,
      color: _green,
    ),
  ),
);

pw.Widget _heading(String text, {bool important = false}) => pw.Padding(
  padding: const pw.EdgeInsets.only(top: 14, bottom: 6),
  child: pw.Row(
    children: [
      pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: 13,
          fontWeight: pw.FontWeight.bold,
          color: _green,
        ),
      ),
      if (important) ...[
        pw.SizedBox(width: 8),
        pw.Container(
          padding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: const pw.BoxDecoration(
            color: _gold,
            borderRadius: pw.BorderRadius.all(pw.Radius.circular(4)),
          ),
          child: pw.Text(
            'ÖNEMLİ',
            style: pw.TextStyle(
              fontSize: 8,
              fontWeight: pw.FontWeight.bold,
              color: PdfColors.black,
            ),
          ),
        ),
      ],
    ],
  ),
);

pw.Widget _item(String text, String marker) => pw.Padding(
  padding: const pw.EdgeInsets.only(bottom: 4, left: 4),
  child: pw.Row(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.SizedBox(
        width: 16,
        child: pw.Text(
          marker,
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: _green),
        ),
      ),
      pw.Expanded(
        child: pw.Text(
          text,
          style: const pw.TextStyle(fontSize: 10.5, lineSpacing: 2),
        ),
      ),
    ],
  ),
);

String _marker(TripNoteSection section, int i) =>
    section.numbered ? '${i + 1}.' : '•';

List<pw.Widget> _section(TripNoteSection section) => [
  // Başlık sayfa sonunda yalnız kalmasın diye ilk maddeyle birlikte tutulur.
  pw.Inseparable(
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _heading(section.title, important: section.important),
        _item(section.items.first, _marker(section, 0)),
      ],
    ),
  ),
  for (var i = 1; i < section.items.length; i++)
    _item(section.items[i], _marker(section, i)),
  for (final link in section.links)
    pw.Padding(
      padding: const pw.EdgeInsets.only(left: 20, bottom: 3),
      child: pw.UrlLink(
        destination: link.url,
        child: pw.Text(
          '${link.label}: ${link.url}',
          style: const pw.TextStyle(
            fontSize: 9.5,
            color: PdfColors.blue800,
            decoration: pw.TextDecoration.underline,
          ),
        ),
      ),
    ),
  if (section.warning != null)
    pw.Container(
      width: double.infinity,
      margin: const pw.EdgeInsets.only(top: 4, bottom: 2),
      padding: const pw.EdgeInsets.all(8),
      decoration: const pw.BoxDecoration(
        color: _warningBg,
        borderRadius: pw.BorderRadius.all(pw.Radius.circular(6)),
      ),
      child: pw.Text(
        section.warning!,
        style: const pw.TextStyle(fontSize: 9.5, color: _warningFg),
      ),
    ),
];

List<pw.Widget> _userNotes(List<UserNote> notes) => [
  for (var i = 0; i < notes.length; i++)
    pw.Inseparable(
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [if (i == 0) _heading('Notlarım'), _noteBox(notes[i])],
      ),
    ),
];

pw.Widget _noteBox(UserNote note) => pw.Container(
  width: double.infinity,
  margin: const pw.EdgeInsets.only(bottom: 6),
  padding: const pw.EdgeInsets.all(8),
  decoration: pw.BoxDecoration(
    border: pw.Border.all(color: _gold, width: 0.8),
    borderRadius: const pw.BorderRadius.all(pw.Radius.circular(6)),
  ),
  child: pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.start,
    children: [
      pw.Text(note.text, style: const pw.TextStyle(fontSize: 10.5)),
      pw.SizedBox(height: 3),
      pw.Text(
        formatDate(note.updatedAt),
        style: const pw.TextStyle(fontSize: 8, color: _muted),
      ),
    ],
  ),
);

List<pw.Widget> _checklist(bool Function(String key) isChecked) {
  pw.Widget row(ChecklistSection section, int i) => pw.Padding(
    padding: const pw.EdgeInsets.only(left: 4, bottom: 3),
    child: pw.Row(
      children: [
        _checkbox(isChecked(section.itemKey(i))),
        pw.SizedBox(width: 8),
        pw.Expanded(
          child: pw.Text(
            section.items[i],
            style: const pw.TextStyle(fontSize: 10.5),
          ),
        ),
      ],
    ),
  );

  return [
    for (final section in checklistSections) ...[
      pw.Inseparable(
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            if (section == checklistSections.first)
              _heading('Hazırlık Listesi'),
            pw.Padding(
              padding: const pw.EdgeInsets.only(top: 6, bottom: 3),
              child: pw.Text(
                section.title,
                style: pw.TextStyle(
                  fontSize: 11,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            row(section, 0),
          ],
        ),
      ),
      for (var i = 1; i < section.items.length; i++) row(section, i),
    ],
  ];
}

pw.Widget _checkbox(bool checked) => pw.Container(
  width: 10,
  height: 10,
  decoration: pw.BoxDecoration(
    color: checked ? _green : null,
    border: pw.Border.all(color: _green, width: 1),
    borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
  ),
);
