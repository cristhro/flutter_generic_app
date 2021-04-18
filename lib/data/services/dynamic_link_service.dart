import 'dart:developer' as developer;

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_generic_app/di/injection.dart';
import 'package:flutter_generic_app/domain/services/index.dart';
import 'package:flutter_generic_app/ui/pages/home/home_page.dart';
import 'package:flutter_generic_app/ui/services/navigation_service.dart';

class DynamicLinkService implements IDynamicLinkService {
  final NavigationService _navigationService = getIt<NavigationService>();

  @override
  Future handleDynamicLinks() async {
    // Get the initial dynamic link if the app is opened with a dynamic link
    final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();

    // handle link that has been retrieved
    _handleDeepLink(data);

    // Register a link callback to fire if the app is opened up from the background
    // using a dynamic link.
    FirebaseDynamicLinks.instance.onLink(onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      // handle link that has been retrieved
      _handleDeepLink(dynamicLink);
    }, onError: (OnLinkErrorException e) async {
      // ignore: avoid_print
    // ignore: avoid_print
      developer.log('Link Failed: ${e.message}');
    });
  }

  void _handleDeepLink(PendingDynamicLinkData? data) {
    final Uri? deepLink = data?.link;
    if (deepLink != null) {
      // ignore: avoid_print
      developer.log('_handleDeepLink | deeplink: $deepLink');

      final isPost = deepLink.pathSegments.contains('post');
      if (isPost) {
        final title = deepLink.queryParameters['title'];
        if (title != null) {
          _navigationService.navigateTo(HomePage.routeName(), arguments: title);
        }
      }
    }
  }

  @override
  Future<String> createFirstPostLink(String title) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://filledstacks.page.link',
      link: Uri.parse('https://www.compound.com/post?title=$title'),
      androidParameters: AndroidParameters(
        packageName: 'com.filledstacks.compound',
      ),

      // Other things to add as an example. We don't need it now
      iosParameters: IosParameters(
        bundleId: 'com.example.ios',
        minimumVersion: '1.0.1',
        appStoreId: '123456789',
      ),
      googleAnalyticsParameters: GoogleAnalyticsParameters(
        campaign: 'example-promo',
        medium: 'social',
        source: 'orkut',
      ),
      itunesConnectAnalyticsParameters: ItunesConnectAnalyticsParameters(
        providerToken: '123456',
        campaignToken: 'example-promo',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: 'Example of a Dynamic Link',
        description: 'This link works whether app is installed or not!',
      ),
    );

    final Uri dynamicUrl = await parameters.buildUrl();

    return dynamicUrl.toString();
  }
}
