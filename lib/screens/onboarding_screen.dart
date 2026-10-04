import 'package:flutter/material.dart';

import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLastPage = _pageIndex == _pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                key: const Key('onboarding_skip'),
                onPressed: _goToLogin,
                child: const Text('Skip'),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (int index) =>
                    setState(() => _pageIndex = index),
                itemBuilder: (BuildContext context, int index) => _pages[index],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int index = 0; index < _pages.length; index++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: index == _pageIndex ? 24 : 8,
                    decoration: BoxDecoration(
                      color: index == _pageIndex
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  key: const Key('onboarding_next'),
                  onPressed: isLastPage
                      ? _goToLogin
                      : () => _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        ),
                  child: Text(isLastPage ? 'Get started' : 'Next'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 160,
            width: 160,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 88,
              color: theme.colorScheme.onSecondaryContainer,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

const List<_OnboardingPage> _pages = <_OnboardingPage>[
  _OnboardingPage(
    icon: Icons.grid_view,
    title: 'Browse the catalog',
    description: 'Every product shown with a grid, a list or a card.',
  ),
  _OnboardingPage(
    icon: Icons.widgets_outlined,
    title: 'Learn the widgets',
    description: 'See Container, Row, Column, Expanded and friends in action.',
  ),
  _OnboardingPage(
    icon: Icons.shopping_cart_outlined,
    title: 'Static by design',
    description: 'No state management and no storage, only layout and styling.',
  ),
];
