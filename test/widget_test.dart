import 'package:ecommerce_ui/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> openHome(WidgetTester tester) async {
  await tester.pumpWidget(const ShopUiApp());
  await tester.pump(const Duration(seconds: 3));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(const Key('onboarding_skip')));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(const Key('login_submit')));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('splash hands over to onboarding', (WidgetTester tester) async {
    await tester.pumpWidget(const ShopUiApp());

    expect(find.text('Shop UI'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.text('Skip'), findsOneWidget);
    expect(find.text('Browse the catalog'), findsOneWidget);
  });

  testWidgets('onboarding pages forward and then open the login screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ShopUiApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('onboarding_next')));
    await tester.pumpAndSettle();
    expect(find.text('Learn the widgets'), findsOneWidget);

    await tester.tap(find.byKey(const Key('onboarding_next')));
    await tester.pumpAndSettle();
    expect(find.text('Static by design'), findsOneWidget);

    await tester.tap(find.byKey(const Key('onboarding_next')));
    await tester.pumpAndSettle();
    expect(find.text('Welcome back'), findsOneWidget);
  });

  testWidgets('login opens the menu of demos', (WidgetTester tester) async {
    await openHome(tester);

    expect(find.text('UI Playground'), findsOneWidget);
    expect(find.text('List view'), findsOneWidget);
    expect(find.text('Grid view'), findsOneWidget);
    expect(find.text('Product detail'), findsOneWidget);
    expect(find.text('Layout playground'), findsOneWidget);
  });

  testWidgets('list view renders every product', (WidgetTester tester) async {
    await openHome(tester);

    await tester.tap(find.text('List view'));
    await tester.pumpAndSettle();

    expect(find.text('Aurora Headphones'), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(6));
  });

  testWidgets('pushed pages get an automatic back button', (
    WidgetTester tester,
  ) async {
    await openHome(tester);

    await tester.tap(find.text('Grid view'));
    await tester.pumpAndSettle();

    expect(find.byType(BackButton), findsOneWidget);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text('UI Playground'), findsOneWidget);
  });

  testWidgets('tapping a row opens the detail page', (
    WidgetTester tester,
  ) async {
    await openHome(tester);

    await tester.tap(find.text('List view'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Pulse Smartwatch'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Fitness watch'), findsOneWidget);
    expect(find.text(r'$199.00'), findsOneWidget);
  });

  testWidgets('scroll views page shows every section', (
    WidgetTester tester,
  ) async {
    await openHome(tester);

    await tester.scrollUntilVisible(find.text('Scroll views'), 200);
    await tester.tap(find.text('Scroll views'));
    await tester.pumpAndSettle();

    expect(find.text('SingleChildScrollView'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('CustomScrollView'),
      400,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('CustomScrollView'), findsOneWidget);
  });

  testWidgets('images page shows assets, network images and fallbacks', (
    WidgetTester tester,
  ) async {
    await openHome(tester);

    await tester.scrollUntilVisible(
      find.text('Images'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Images'));
    await tester.pumpAndSettle();

    expect(find.text('Image.asset'), findsOneWidget);
    expect(find.byType(Image), findsWidgets);

    await tester.scrollUntilVisible(
      find.text('Broken link'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    expect(find.text('errorBuilder ran'), findsOneWidget);
  });

  testWidgets('typography page lists weights and icons', (
    WidgetTester tester,
  ) async {
    await openHome(tester);

    await tester.scrollUntilVisible(
      find.text('Fonts and icons'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('Fonts and icons'));
    await tester.pumpAndSettle();

    expect(find.text('Poppins 700'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Icons inside widgets'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Icons inside widgets'), findsOneWidget);
  });
}
