import 'package:flutter/material.dart';

class RecentlyPage extends StatefulWidget {
  const RecentlyPage({super.key});

  @override
  _ComplexNestedScrollViewState createState() => _ComplexNestedScrollViewState();
}

class _ComplexNestedScrollViewState extends State<RecentlyPage> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['精选', '热门', '推荐', '最新'];
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,  // 允许头部浮动
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // 主 AppBar
            // SliverAppBar(
            //   expandedHeight: 300,
            //   pinned: true,  // 固定顶部
            //   floating: true,
            //   snap: true,
            //   flexibleSpace: FlexibleSpaceBar(
            //     title: Text('复杂嵌套滚动'),
            //     background: Stack(
            //       fit: StackFit.expand,
            //       children: [
            //         Image.network(
            //           'https://picsum.photos/1200/600',
            //           fit: BoxFit.cover,
            //         ),
            //         Container(
            //           decoration: BoxDecoration(
            //             gradient: LinearGradient(
            //               begin: Alignment.bottomCenter,
            //               end: Alignment.topCenter,
            //               colors: [Colors.black54, Colors.transparent],
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            
            // 用户信息卡片
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage('https://picsum.photos/100'),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Flutter Developer',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('高级开发工程师'),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  _buildStat('关注', '1.2K'),
                                  SizedBox(width: 20),
                                  _buildStat('粉丝', '3.5K'),
                                  SizedBox(width: 20),
                                  _buildStat('获赞', '12K'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('关注'),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text('私信'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            // TabBar
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyTabBarDelegate(
                child: TabBar(
                  controller: _tabController,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Theme.of(context).primaryColor,
                  indicatorWeight: 2,
                  tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
                  isScrollable: true,
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: _tabs.map((tab) {
            return _buildTabContent(tab);
          }).toList(),
        ),
      ),
    );
  }
  
  Widget _buildStat(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
  
  Widget _buildTabContent(String tabName) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage('https://picsum.photos/50'),
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '用户 ${index + 1}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '2小时前',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Text(
                      '这是 $tabName 的内容项 $index，展示了复杂嵌套滚动效果。',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://picsum.photos/400/200?random=$index',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildActionButton(Icons.thumb_up, '赞', () {}),
                        _buildActionButton(Icons.comment, '评论', () {}),
                        _buildActionButton(Icons.share, '分享', () {}),
                        _buildActionButton(Icons.bookmark, '收藏', () {}),
                      ],
                    ),
                  ],
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
  
  Widget _buildActionButton(IconData icon, String text, VoidCallback onPressed) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 20),
      label: Text(text),
      style: TextButton.styleFrom(
        iconColor: Colors.grey[700],
      ),
    );
  }
}

// 自定义粘性 TabBar 代理
class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;
  
  _StickyTabBarDelegate({required this.child});
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: child,
    );
  }
  
  @override
  double get maxExtent => child.preferredSize.height;
  
  @override
  double get minExtent => child.preferredSize.height;
  
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}