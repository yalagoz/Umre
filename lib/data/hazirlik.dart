// Umre yolculuğu için hazırlık (bavul) kontrol listesi.

import 'package:flutter/material.dart';

import '../models.dart';

const List<ChecklistSection> checklistSections = [
  ChecklistSection(
    id: 'evrak',
    title: "Evrak ve Para",
    icon: Icons.badge,
    items: [
      "Pasaport (en az 6 ay geçerli)",
      "Umre vizesi ve tur belgeleri",
      "Uçak bileti ve otel bilgileri",
      "Kimlik fotokopisi ve vesikalık fotoğraf",
      "Aşı kartı ve sağlık raporu",
      "Kredi kartı ve bir miktar Suudi Riyali",
      "Tur rehberinin ve kafile görevlisinin telefon numaraları",
    ],
  ),
  ChecklistSection(
    id: 'ihram',
    title: "İhram ve Giyim",
    icon: Icons.checkroom,
    items: [
      "En az 2 takım ihram (erkekler)",
      "İhram kemeri veya bel çantası",
      "Topuğu ve ayak üstü açık terlik / sandalet",
      "Tesettüre uygun rahat kıyafetler (kadınlar)",
      "Rahat yürüyüş ayakkabısı",
      "Klimalı ortamlar için ince hırka",
    ],
  ),
  ChecklistSection(
    id: 'saglik',
    title: "Sağlık ve Bakım",
    icon: Icons.medical_services,
    items: [
      "Düzenli kullanılan ilaçlar ve reçeteleri",
      "Ağrı kesici, ateş düşürücü, mide ilacı",
      "Kokusuz sabun ve şampuan",
      "Kokusuz pişik kremi veya vazelin",
      "Yara bandı ve küçük ilk yardım seti",
      "Maske ve el dezenfektanı (kokusuz)",
      "Güneş gözlüğü ve şemsiye",
      "Diş fırçası, diş macunu, misvak",
      "Tırnak makası (ihramdan önce kullanmak için)",
    ],
  ),
  ChecklistSection(
    id: 'elektronik',
    title: "Elektronik",
    icon: Icons.power,
    items: [
      "Telefon ve şarj aleti",
      "Taşınabilir şarj cihazı (powerbank)",
      "Priz dönüştürücü (çoğunlukla İngiliz tipi, G)",
    ],
  ),
  ChecklistSection(
    id: 'ibadet',
    title: "İbadet",
    icon: Icons.menu_book,
    items: [
      "Dua kitabı veya bu uygulama",
      "Küçük boy Kur'an-ı Kerim",
      "Tesbih veya tavaf sayacı",
      "Katlanabilir seccade",
      "Mescitte ayakkabılar için bez torba",
    ],
  ),
  ChecklistSection(
    id: 'diger',
    title: "Diğer",
    icon: Icons.backpack,
    items: [
      "Küçük sırt çantası",
      "Su şişesi",
      "Not defteri ve kalem",
      "Dua edilecek ve selam iletilecek kişilerin listesi",
    ],
  ),
];
