import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../models.dart';
import '../services/pdf_export.dart';
import '../state/app_state.dart';

/// Seçilen notların PDF önizlemesi; kaydetme, paylaşma ve yazdırma.
class NotesPdfScreen extends StatefulWidget {
  const NotesPdfScreen({super.key, required this.phases, required this.title});

  final List<TripPhase> phases;
  final String title;

  @override
  State<NotesPdfScreen> createState() => _NotesPdfScreenState();
}

class _NotesPdfScreenState extends State<NotesPdfScreen> {
  late final Future<Uint8List> _pdf = _build();

  Future<Uint8List> _build() {
    final state = AppScope.read(context);
    return buildTripPdf(
      phases: widget.phases,
      notesFor: state.notesFor,
      isChecked: state.isChecked,
    );
  }

  Future<void> _share() async {
    await Printing.sharePdf(
      bytes: await _pdf,
      filename: pdfFileName(widget.phases),
      subject: 'Umre Notları – ${widget.title}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: PdfPreview(
        build: (_) => _pdf,
        pdfFileName: pdfFileName(widget.phases),
        allowSharing: false,
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        loadingWidget: const CircularProgressIndicator(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: FilledButton.icon(
            onPressed: _share,
            icon: const Icon(Icons.download),
            label: const Text('PDF\'i Kaydet veya Paylaş'),
          ),
        ),
      ),
    );
  }
}
