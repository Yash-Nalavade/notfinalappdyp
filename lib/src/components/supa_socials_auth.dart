import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_auth_ui/src/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension on OAuthProvider {
  IconData get iconData => FontAwesomeIcons.google;
  Color get btnBgColor => Colors.white;
  String get capitalizedName => name[0].toUpperCase() + name.substring(1);
}

enum SocialButtonVariant {
  icon,
  iconAndText,
}

class NativeGoogleAuthConfig {
  final String? webClientId;
  final String? iosClientId;

  const NativeGoogleAuthConfig({
    this.webClientId,
    this.iosClientId,
  });
}

class SupaSocialsAuth extends StatefulWidget {
  final NativeGoogleAuthConfig? nativeGoogleAuthConfig;
  final bool enableNativeAppleAuth;
  final List<OAuthProvider> socialProviders;
  final bool colored;
  final SocialButtonVariant socialButtonVariant;
  final String? redirectUrl;
  final void Function(Session session) onSuccess;
  final void Function(Object error)? onError;
  final bool showSuccessSnackBar;
  final Map<OAuthProvider, String>? scopes;
  final Map<OAuthProvider, Map<String, String>>? queryParams;

  const SupaSocialsAuth({
    Key? key,
    this.nativeGoogleAuthConfig,
    this.enableNativeAppleAuth = true,
    required this.socialProviders,
    this.colored = true,
    this.redirectUrl,
    required this.onSuccess,
    this.onError,
    this.socialButtonVariant = SocialButtonVariant.iconAndText,
    this.showSuccessSnackBar = true,
    this.scopes,
    this.queryParams,
  }) : super(key: key);

  @override
  State<SupaSocialsAuth> createState() => _SupaSocialsAuthState();
}

class _SupaSocialsAuthState extends State<SupaSocialsAuth> {
  late final StreamSubscription<AuthState> _gotrueSubscription;

  Future<AuthResponse> _nativeGoogleSignIn({
    required String? webClientId,
    required String? iosClientId,
  }) async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );

    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw const AuthException(
          'No Access Token found from Google sign in result.');
    }
    if (idToken == null) {
      throw const AuthException(
          'No ID Token found from Google sign in result.');
    }

    return supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  void onAuthButtonPressed() async {
    try {
      final googleAuthConfig = widget.nativeGoogleAuthConfig;
      // Check if native Google login should be performed
      final webClientId = googleAuthConfig?.webClientId;
      final iosClientId = googleAuthConfig?.iosClientId;
      final shouldPerformNativeGoogleSignIn =
          (webClientId != null && !kIsWeb && Platform.isAndroid) ||
              (iosClientId != null && !kIsWeb && Platform.isIOS);

      if (shouldPerformNativeGoogleSignIn) {
        await _nativeGoogleSignIn(
          webClientId: webClientId,
          iosClientId: iosClientId,
        );
        return;
      }

      // Perform regular Supabase Google login
      await supabase.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: widget.redirectUrl,
        scopes: widget.scopes?[OAuthProvider.google],
        queryParams: widget.queryParams?[OAuthProvider.google],
      );
    } on AuthException catch (error) {
      if (widget.onError == null && context.mounted) {
        context.showErrorSnackBar(error.message);
      } else {
        widget.onError?.call(error);
      }
    } catch (error) {
      if (widget.onError == null && context.mounted) {
        context.showErrorSnackBar('Unexpected error has occurred: $error');
      } else {
        widget.onError?.call(error);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _gotrueSubscription =
        Supabase.instance.client.auth.onAuthStateChange.listen((data) {
          final session = data.session;
          if (session != null && mounted) {
            widget.onSuccess.call(session);
            if (widget.showSuccessSnackBar) {
              context.showSnackBar('Successfully signed in!');
            }
          }
        });
  }

  @override
  void dispose() {
    super.dispose();
    _gotrueSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final providers = widget.socialProviders;
    final googleAuthConfig = widget.nativeGoogleAuthConfig;
    final isNativeAppleAuthEnabled = widget.enableNativeAppleAuth;
    final coloredBg = widget.colored == true;

    if (providers.isEmpty) {
      return ErrorWidget(Exception('Social provider list cannot be empty'));
    }

    final authButtons = List.generate(
      providers.length,
          (index) {
        final socialProvider = providers[index];

        if (socialProvider != OAuthProvider.google) {
          return SizedBox.shrink(); // Skip other providers
        }

        Color? foregroundColor = coloredBg ? Colors.white : null;
        Color? backgroundColor = coloredBg ? socialProvider.btnBgColor : null;
        Color? overlayColor = coloredBg ? Colors.white10 : null;
        Color? iconColor = coloredBg ? Colors.white : null;

        Widget iconWidget = SizedBox(
          height: 48,
          width: 48,
          child: Icon(
            socialProvider.iconData,
            color: iconColor,
          ),
        );

        if (socialProvider == OAuthProvider.google && coloredBg) {
          iconWidget = Image.asset(
            'assets/logos/google_light.png',
            package: 'supabase_auth_ui',
            width: 48,
            height: 48,
          );

          foregroundColor = Colors.black;
          backgroundColor = Colors.white;
          overlayColor = Colors.white;
        }

        final authButtonStyle = ButtonStyle(
          foregroundColor: MaterialStateProperty.all(foregroundColor),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          overlayColor: MaterialStateProperty.all(overlayColor),
          iconColor: MaterialStateProperty.all(iconColor),
        );

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: widget.socialButtonVariant == SocialButtonVariant.icon
              ? Material(
            shape: const CircleBorder(),
            elevation: 2,
            color: backgroundColor,
            child: InkResponse(
              radius: 24,
              onTap: onAuthButtonPressed,
              child: iconWidget,
            ),
          )
              : ElevatedButton.icon(
            icon: iconWidget,
            style: authButtonStyle,
            onPressed: onAuthButtonPressed,
            label: Text('Continue with ${socialProvider.capitalizedName}'),
          ),
        );
      },
    );

    return widget.socialButtonVariant == SocialButtonVariant.icon
        ? Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: authButtons,
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: authButtons,
    );
  }
}
