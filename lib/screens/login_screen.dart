import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 110,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Icon(
                  Icons.person_outline,
                  size: 64,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Welcome back',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'This screen is UI only: the fields are not validated yet.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(height: 32),
              const TextField(
                key: Key('login_email'),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'student@school.edu',
                  prefixIcon: Icon(Icons.email_outlined),
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                key: const Key('login_password'),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'At least 6 characters',
                  prefixIcon: const Icon(Icons.lock_outline),
                  filled: true,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    tooltip: 'Show password',
                    onPressed: null,
                    icon: Icon(Icons.visibility_outlined),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton(
                key: const Key('login_submit'),
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(builder: (_) => const HomeScreen()),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text('Sign in'),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                key: const Key('login_skip'),
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(builder: (_) => const HomeScreen()),
                ),
                child: const Text('Skip for now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
