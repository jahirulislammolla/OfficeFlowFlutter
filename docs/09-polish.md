# Step 9 — Theme, Accessibility ও Production Polish

## Official documentation পড়ুন

- Themes: https://docs.flutter.dev/cookbook/design/themes
- Localization: https://docs.flutter.dev/ui/accessibility-and-internationalization/internationalization
- Accessibility: https://docs.flutter.dev/ui/accessibility-and-internationalization/accessibility
- Performance: https://docs.flutter.dev/perf

## Theme

- Light theme
- Dark theme
- `ColorScheme.fromSeed`
- Central text theme
- Reusable button/card styles
- Theme preference storage

## English/Bangla localization

শুরুর language দুইটি রাখুন:

- English
- বাংলা

বাংলা font package/asset প্রয়োজনে local licensed font ব্যবহার করুন। সব UI string localization file-এ রাখুন।

## Accessibility

- Semantics labels
- Minimum tap target
- Screen-reader text
- Color contrast
- Text scaling support
- Icon-only button tooltip

## Performance

- `ListView.builder`
- Image cache ও size
- expensive build এ `const`
- unnecessary state rebuild কমানো
- API pagination

## আপনার পরীক্ষা

- Both theme ব্যবহারযোগ্য।
- Text scaling 200% overflow না করে।
- বাংলা ও English switch হয়।
- Loading state skeleton/shimmer নয় শুধু spinner হিসেবেও প্রয়োজনে readable।
