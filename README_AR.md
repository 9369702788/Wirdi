# وردي | Wirdi v1.0 Full Project Source

هذا ملف مشروع Flutter كامل للكود المصدري. أنشئ مشروع Flutter ثم انسخ هذه الملفات فوقه.

```bash
flutter create wirdi
cd wirdi
# انسخ محتويات هذا الملف فوق المشروع
flutter clean
flutter pub get
dart run flutter_native_splash:create
dart run flutter_launcher_icons
dart format .
flutter analyze
flutter test
flutter run
```

## مهم قبل النشر
- البيانات القرآنية الموجودة عينة فقط: الفاتحة والإخلاص. قبل النشر أضف 114 سورة كاملة من Tanzil دون تعديل.
- التفسير غير مفعّل في v1.0 لحين توفر مصدر مرخص.
- إذا Quran.com API احتاج Credentials استخدم Backend/Proxy ولا تضع أسرار داخل التطبيق.
- انسخ صلاحيات Android و iOS من مجلد docs بعد إنشاء المشروع.
