import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ku_gou_music/views/home/pc/router/router.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    LocalRouterController controller = Get.find();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // 标题栏
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  floating: true,
                  pinned: true,
                  snap: true,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    onPressed: () {
                      controller.goBack();
                    },
                  ),
                  // leading: SizedBox.shrink(),
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      'https://picsum.photos/800/400',
                      fit: BoxFit.cover,
                    ),
                  ),
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'Tab 1'),
                      Tab(text: 'Tab 2'),
                      Tab(text: 'Tab 3'),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              _buildTabContent('Tab 1 Content'),
              _buildTabContent('Tab 2 Content'),
              _buildTabContent('Tab 3 Content'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(String title) {
    return Builder(
      builder: (context) {
        return CustomScrollView(
          slivers: [
            // 必须添加 SliverOverlapInjector
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    title: Text('$title - Item $index'),
                    subtitle: Text('Subtitle for item $index'),
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                  );
                },
                childCount: 50,
              ),
            ),
          ],
        );
      },
    );
  }
}