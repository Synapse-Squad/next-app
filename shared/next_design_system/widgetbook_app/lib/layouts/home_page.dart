import 'package:flutter/material.dart';
import 'package:next_design_system/next_design_system.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'HomePage',
  type: HomePage,
  designLink: '',
)
Widget homePageUseCase(BuildContext context) {
  return HomePage();
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
          color: context.iconTheme.white,
        ),
        title: AppText(
          'Home',
          style: context.typography.titleLarge,
          color: context.typographyTheme.title,
        ),
        forceMaterialTransparency: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: context.iconTheme.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_alt),
            color: context.iconTheme.white,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: AppSpacing.xs),
          SizedBox(
            height: 35,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return AppBadge(
                  title: 'Type #$index',
                  checked: index == 0,
                  badgeSize: AppBadgeSize.sm,
                );
              },
              itemCount: 10,
              separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.xl),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return AppListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.withAlpha(40),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.podcasts,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  title: 'Title of collection as an example #$index',
                  subtitle: 'N items #$index',
                );
              },
              separatorBuilder: (_, __) =>
                  const SizedBox(height: AppSpacing.xl),
              itemCount: 50,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: context.buttonTheme.primaryDefault,
        shape: CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
