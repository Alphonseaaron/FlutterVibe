import 'package:flutter/cupertino.dart';

class PaginatedListView extends StatefulWidget {
  final Future<List<dynamic>> Function(int page) onFetchPage;
  final Widget Function(dynamic item) itemBuilder;

  const PaginatedListView({
    super.key,
    required this.onFetchPage,
    required this.itemBuilder,
  });

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState();
}

class _PaginatedListViewState extends State<PaginatedListView> {
  final _scrollController = ScrollController();
  final _items = [];
  int _page = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchPage();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchPage();
    }
  }

  Future<void> _fetchPage() async {
    if (_isLoading) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    final newItems = await widget.onFetchPage(_page);
    setState(() {
      _items.addAll(newItems);
      _page++;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _items.length + (_isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _items.length) {
          return const Center(child: CupertinoActivityIndicator());
        }
        return widget.itemBuilder(_items[index]);
      },
    );
  }
}
