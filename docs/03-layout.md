# Step 3 — Widgets ও Responsive Layout

## Official documentation পড়ুন

- Widget catalog: https://docs.flutter.dev/ui/widgets
- Layout: https://docs.flutter.dev/ui/layout
- Material 3: https://docs.flutter.dev/ui/design/material

## Core widgets

- `Container`, `Padding`, `SizedBox`
- `Row`, `Column`, `Stack`
- `ListView`, `GridView`
- `Expanded`, `Flexible`, `Spacer`
- `Card`, `ListTile`
- `TextField`, `ElevatedButton`, `OutlinedButton`
- `SafeArea`, `Scaffold`

## প্রথম screen flow

1. `HomeScreen`
2. App bar
3. Attendance summary cards
4. Today’s task list
5. Recent activity list
6. Bottom navigation

## Responsive learning

### Mobile

- Bottom navigation
- Single-column dashboard

### Tablet/Desktop

- `NavigationRail` বা permanent sidebar
- Two-column dashboard
- Detail pane

Responsive করার আগে viewport breakpoint নিজে নির্ধারণ করুন। উদাহরণ: 600, 900 এবং 1200 logical pixels।

## আপনার পরীক্ষা

- Mobile ও desktop width উভয়েই overflow নেই।
- Text scaling 1.3 হলে layout readable।
- Pure widget ছোট reusable pieces-এ ভাগ করা হয়েছে।
- Hard-coded string সীমিত জায়গায় centralized আছে।
