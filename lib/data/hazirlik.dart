// Umre yolculuğu için hazırlık (bavul) kontrol listesi.

import 'package:flutter/material.dart';

import '../models.dart';

const List<ChecklistSection> checklistSections = [
  ChecklistSection(
    id: 'evrak',
    title: "Evrak ve Para",
    icon: Icons.badge,
    items: [
      "Pasaport (en az 1 yıl geçerli olması önerilir)",
      "Umre vizesi ve tur belgeleri",
      "Uçak bileti ve otel bilgileri",
      "Menenjit (ACWY) aşı kartı",
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
      "İhram kemeri veya bel çantası (boyun askılı çantalar kullanışlı olmakla birlikte boyunda ağırlık yapmaktadır; bel çantası daha rahattır)",
      "Topuğu ve ayak üstü açık terlik veya sandalet (2 adet önerilir)",
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
      "Priz dönüştürücü (İngiliz tipi, G; önerilir ancak zorunlu değildir)",
      "Telefonda Nusuk, Uber, Careem ve Haramain tren uygulamaları",
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
      "Katlanabilir seccade (hafif ve ince olması önerilir)",
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
