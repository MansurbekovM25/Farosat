# Inson Farosat

1–4-sinf o'quvchilari uchun ta'limiy mobil ilova (interfeys o'zbek tilida).

## Holat (1-bosqich)

| Funksiya | Holat |
|---|---|
| 4 ta sinf kartasi, pastki navigatsiya | Maket (kod yozilgan, hali qurilmada sinalmagan) |
| Muloqot, Yangiliklar, Hisob | Bo'sh sahifalar |
| Firebase, autentifikatsiya | **Ulanmagan** |
| Video darslar, obuna | **Yo'q** |
| To'lov (Payme/boshqa) | **Ulanmagan** |
| Admin panel | **Yo'q** |
| `firebase/firestore.rules` | Qoralama, sinalmagan |

## Ishga tushirish

1. [Flutter SDK](https://docs.flutter.dev/get-started/install) o'rnating.
2. Papka ichida platforma fayllarini yarating (avval o'zgarishlarni `git commit` qiling):
   ```
   flutter create . --project-name inson_farosat --org uz.insonfarosat
   ```
   Keyin `git status` bilan `lib/` ichidagi fayllar o'zgarmaganini tekshiring.
3. Paketlarni yuklang va ishga tushiring:
   ```
   flutter pub get
   flutter test
   flutter run
   ```

## Loyiha tuzilmasi

```
lib/
  main.dart
  theme/app_theme.dart
  pages/ main_shell.dart, home_page.dart, grade_page.dart
  widgets/grade_card.dart
firebase/firestore.rules
test/widget_test.dart
```

## Xavfsizlik

Maxfiy kalitlarni (to'lov kalitlari, service account fayllari, `.env`) GitHub'ga **hech qachon** yuklamang. `.gitignore` ularning ko'p turini yopadi, lekin har bir commit oldidan `git status` ni tekshiring.

## Yo'l xaritasi

1. UI va bosh ekran ← hozir
2. Firebase va autentifikatsiya
3. Darslar ro'yxati va video pleyer
4. Admin panel
5. To'lov integratsiyasi
6. Yangiliklar, Hisob, Menejerga yozish
7. Moderatsiyali jamoa (ixtiyoriy)
8. Test va do'konlarga topshirish
