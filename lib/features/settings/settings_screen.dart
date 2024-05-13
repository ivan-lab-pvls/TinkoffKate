import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zenmoney/app/router/router.dart';
import 'package:zenmoney/common/layout/base_screen.dart';
import 'package:zenmoney/common/layout/section.dart';
import 'package:zenmoney/common/widget/custom_tile.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool shareable = true;
    return BaseScreen(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            transitionBetweenRoutes: false,
            largeTitle: Text('Settings'),
            border: null,
          ),
          SliverToBoxAdapter(
            child: Section(
              child: Column(
                children: [
                  SettingsItem(
                    title: 'Terms of Use',
                    assetName: 'assets/icons/settings/terms.svg',
                    onPressed: () =>
                        context.router.push(const TermsOfUseRoute()),
                  ),
                  SizedBox(height: 8.h),
                  SettingsItem(
                    title: 'Privacy Policy',
                    assetName: 'assets/icons/settings/privacy.svg',
                    onPressed: () =>
                        context.router.push(const PrivacyPolicyRoute()),
                  ),
                  SizedBox(height: 8.h),
                  SettingsItem(
                    title: 'Support page',
                    assetName: 'assets/icons/settings/support.svg',
                    onPressed: () => context.router.push(const SupportRoute()),
                  ),
                  SizedBox(height: 8.h),
                  Builder(builder: (ctx) {
                    return SettingsItem(
                      title: 'Share with friends',
                      assetName: 'assets/icons/settings/share.svg',
                      onPressed: () async {
                        if (shareable) {
                          shareable = false;
                          final box = ctx.findRenderObject() as RenderBox?;

                          await Share.share(
                            'Check out TinlyBank app on the AppStore. It\'s so worth it!',
                            sharePositionOrigin:
                                box!.localToGlobal(Offset.zero) & box.size,
                          ).whenComplete(() => shareable = true);
                        }
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  final String title;
  final String assetName;
  final VoidCallback onPressed;
  const SettingsItem({
    super.key,
    required this.title,
    required this.assetName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      assetName: assetName,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const CupertinoListTileChevron(),
        ],
      ),
    );
  }
}
