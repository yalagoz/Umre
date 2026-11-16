import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/notlar.dart';
import '../models.dart';
import '../services/pdf_export.dart';
import '../state/app_state.dart';
import '../theme.dart';
import '../widgets/common.dart';
import 'notes_pdf_screen.dart';

/// Yolculuk notları: hazır notlar, kişisel notlar ve PDF olarak indirme.
class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tripPhases.length,
      child: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Umre Notları'),
            actions: [
              IconButton(
                tooltip: 'PDF olarak indir',
                icon: const Icon(Icons.picture_as_pdf_outlined),
                onPressed: () => showPdfOptions(context),
              ),
              const SettingsButton(),
            ],
            bottom: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: [for (final phase in tripPhases) Tab(text: phase.tabLabel)],
            ),
          ),
          body: TabBarView(
            children: [
              for (final phase in tripPhases) _PhaseNotesView(phase: phase),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => editNote(
              context,
              tripPhases[DefaultTabController.of(context).index],
            ),
            icon: const Icon(Icons.edit_note),
            label: const Text('Not Ekle'),
          ),
        ),
      ),
    );
  }
}

void openPdf(BuildContext context, List<TripPhase> phases, String title) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) => NotesPdfScreen(phases: phases, title: title),
    ),
  );
}

/// Hangi bölümün PDF olarak indirileceğini seçtirir.
void showPdfOptions(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (sheetContext) {
      void open(List<TripPhase> phases, String title) {
        Navigator.pop(sheetContext);
        openPdf(context, phases, title);
      }

      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'PDF olarak indir',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              for (final phase in tripPhases)
                ListTile(
                  leading: Icon(phase.icon),
                  title: Text(phase.title),
                  onTap: () => open([phase], phase.title),
                ),
              ListTile(
                leading: const Icon(Icons.library_books_outlined),
                title: const Text('Tüm Notlar'),
                onTap: () => open(tripPhases, 'Tüm Notlar'),
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// Yeni not ekler ya da [note] verilmişse onu düzenler.
Future<void> editNote(
  BuildContext context,
  TripPhase phase, {
  UserNote? note,
}) async {
  final text = await showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => _NoteEditor(
      title:
          '${note == null ? 'Not ekle' : 'Notu düzenle'} · ${phase.tabLabel}',
      initialText: note?.text ?? '',
    ),
  );

  final trimmed = text?.trim() ?? '';
  if (trimmed.isEmpty || !context.mounted) return;
  final state = AppScope.read(context);
  if (note == null) {
    state.addNote(phase.id, trimmed);
  } else {
    state.updateNote(note, trimmed);
  }
}

class _NoteEditor extends StatefulWidget {
  const _NoteEditor({required this.title, required this.initialText});

  final String title;
  final String initialText;

  @override
  State<_NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends State<_NoteEditor> {
  late final _controller = TextEditingController(text: widget.initialText);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        16,
        0,
        16,
        16 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          TextField(
            controller: _controller,
            autofocus: true,
            minLines: 4,
            maxLines: 10,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              hintText: 'Notunuzu yazın…',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Vazgeç'),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: () => Navigator.pop(context, _controller.text),
                child: const Text('Kaydet'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PhaseNotesView extends StatelessWidget {
  const _PhaseNotesView({required this.phase});

  final TripPhase phase;

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final notes = state.notesFor(phase.id);
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 96),
      children: [
        for (final section in phase.sections) ...[
          _SectionCard(section: section),
          const SizedBox(height: 12),
        ],
        SectionHeader(
          title: 'Notlarım',
          icon: Icons.sticky_note_2_outlined,
          trailing: TextButton.icon(
            onPressed: () => editNote(context, phase),
            icon: const Icon(Icons.add),
            label: const Text('Ekle'),
          ),
        ),
        if (notes.isEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 12),
            child: Text(
              'Bu bölüme kendi notlarınızı ekleyebilirsiniz. Notlarınız PDF\'e de eklenir.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        for (final note in notes) ...[
          _UserNoteCard(phase: phase, note: note),
          const SizedBox(height: 8),
        ],
        const SizedBox(height: 8),
        FilledButton.tonalIcon(
          onPressed: () => openPdf(context, [phase], phase.title),
          icon: const Icon(Icons.picture_as_pdf_outlined),
          label: Text('${phase.tabLabel} notlarını PDF olarak indir'),
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.section});

  final TripNoteSection section;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final scale = AppScope.of(context).textScale;

    return Card(
      shape: section.important
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: brandGold, width: 2),
            )
          : null,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  section.icon,
                  color: section.important ? brandGold : scheme.primary,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    section.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (section.important)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: brandGold,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'ÖNEMLİ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            BulletList(
              items: section.items,
              numbered: section.numbered,
              style: TextStyle(
                fontSize: 15 * scale,
                height: 1.45,
                color: scheme.onSurface,
              ),
            ),
            if (section.warning != null) ...[
              Callout(text: section.warning!, warning: true),
              const SizedBox(height: 8),
            ],
            if (section.links.isNotEmpty)
              Wrap(
                spacing: 8,
                children: [
                  for (final link in section.links)
                    ActionChip(
                      avatar: const Icon(Icons.open_in_new, size: 18),
                      label: Text(link.label),
                      onPressed: () => launchUrl(
                        Uri.parse(link.url),
                        mode: LaunchMode.externalApplication,
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

enum _NoteAction { edit, share, delete }

class _UserNoteCard extends StatelessWidget {
  const _UserNoteCard({required this.phase, required this.note});

  final TripPhase phase;
  final UserNote note;

  void _share(BuildContext context) {
    final box = context.findRenderObject() as RenderBox?;
    SharePlus.instance.share(
      ShareParams(
        text: '${phase.title}\n\n${note.text}',
        subject: 'Umre notu',
        sharePositionOrigin: box == null
            ? null
            : box.localToGlobal(Offset.zero) & box.size,
      ),
    );
  }

  void _delete(BuildContext context) {
    final state = AppScope.read(context);
    final index = state.deleteNote(note);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: const Text('Not silindi'),
          action: SnackBarAction(
            label: 'Geri Al',
            onPressed: () => state.restoreNote(note, index),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scale = AppScope.of(context).textScale;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => editNote(context, phase, note: note),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 4, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(note.text, style: TextStyle(fontSize: 15 * scale)),
                    const SizedBox(height: 6),
                    Text(
                      formatDate(note.updatedAt),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              PopupMenuButton<_NoteAction>(
                tooltip: 'Not seçenekleri',
                onSelected: (action) => switch (action) {
                  _NoteAction.edit => editNote(context, phase, note: note),
                  _NoteAction.share => _share(context),
                  _NoteAction.delete => _delete(context),
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(
                    value: _NoteAction.edit,
                    child: ListTile(
                      leading: Icon(Icons.edit_outlined),
                      title: Text('Düzenle'),
                    ),
                  ),
                  PopupMenuItem(
                    value: _NoteAction.share,
                    child: ListTile(
                      leading: Icon(Icons.share_outlined),
                      title: Text('Paylaş'),
                    ),
                  ),
                  PopupMenuItem(
                    value: _NoteAction.delete,
                    child: ListTile(
                      leading: Icon(Icons.delete_outline),
                      title: Text('Sil'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
