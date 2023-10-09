import 'package:flutter/material.dart';
import 'package:setup_structure/res/app_context_extension.dart';

class CommonEmptyView extends StatelessWidget {
  const CommonEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image:
          AssetImage(context.resources.drawable.mainBackgroundPNG),
          fit: BoxFit.cover,
        ),
      ),
      // margin: const EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 140,
            margin: const EdgeInsets.only(bottom: 24, top: 100),
            child: Image.asset(context.resources.drawable.noCampaigns),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 24),
            child: Text(
              '告知必要なキャンペーンはありません。',
              style: context.resources.style.w500s16(context.resources.color.white.withOpacity(0.7)),
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollableEmptyView extends StatelessWidget {
  const ScrollableEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return const CommonEmptyView();
      },
    );
  }
}
