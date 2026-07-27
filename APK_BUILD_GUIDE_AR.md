# تجربة Wirdi على موبايل Android

## مهم
هذا الملف يحتوي على كود المشروع كامل، لكن لا يحتوي على APK جاهز لأن بناء APK يحتاج Flutter SDK و Android SDK، وهما غير متاحين داخل بيئة Copilot الحالية.

## الطريقة الأسرع على جهازك

```bash
flutter create wirdi
cd wirdi
```

انسخ محتويات هذا المشروع فوق مشروع Flutter، ثم شغل:

```bash
flutter clean
flutter pub get
dart run flutter_native_splash:create
dart run flutter_launcher_icons
flutter build apk --debug
```

ستجد ملف التجربة هنا:

```text
build/app/outputs/flutter-apk/app-debug.apk
```

انسخ الملف إلى موبايل Android وافتحه. قد تحتاج تفعيل:

```text
Install unknown apps
```

## بناء نسخة Release للتجربة

```bash
flutter build apk --release
```

الملف سيكون هنا:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## لو عايز APK بدون تثبيت Flutter على جهازك

ارفع المشروع على GitHub ثم استخدم GitHub Actions الموجود في:

```text
.github/workflows/build_android_debug_apk.yml
```

بعد تشغيل الـ workflow، ستجد APK كـ artifact باسم:

```text
wirdi-debug-apk
```

## تنبيه قبل النشر

بيانات القرآن داخل المشروع عينة فقط، وليست القرآن كاملًا. قبل النشر يجب استبدالها بملفات القرآن كاملة من Tanzil حسب الترخيص.
