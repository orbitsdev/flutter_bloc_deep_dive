import 'package:blockdeepdive/scroll/Featured.dart';
import 'package:blockdeepdive/scroll/content.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {

    static const String screen_name = '/test';
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  
  final List<Featured> featured = [

      Featured('1', 'Featured1 ', [Content('1', 'content1'),Content('2', 'content1'),Content('3', 'content1')]),
      Featured('2', 'Featured2 ', [Content('1', 'content1'),]),
      Featured('3', 'Featured3 ', [Content('1', 'content1'),Content('3', 'content1')]),
      Featured('3', 'Featured4 ', [Content('1', 'content2')]),
      Featured('2', 'Featured2 ', [Content('1', 'content1'),]),
      Featured('3', 'Featured3 ', [Content('1', 'content1'),Content('3', 'content1')]),
      Featured('3', 'Featured4 ', [Content('1', 'content2')]),
      Featured('2', 'Featured2 ', [Content('1', 'content1'),]),
      Featured('3', 'Featured3 ', [Content('1', 'content1'),Content('3', 'content1')]),
      Featured('3', 'Featured4 ', [Content('1', 'content2')]),
      Featured('2', 'Featured2 ', [Content('1', 'content1'),]),
      Featured('3', 'Featured3 ', [Content('1', 'content1'),Content('3', 'content1')]),
      Featured('3', 'Featured4 ', [Content('1', 'content2')]),
      Featured('2', 'Featured2 ', [Content('1', 'content1'),]),
      Featured('3', 'Featured3 ', [Content('1', 'content1'),Content('3', 'content1')]),
      Featured('3', 'Featured4 ', [Content('1', 'content2')]),
      Featured('2', 'Featured2 ', [Content('1', 'content1'),]),
      Featured('3', 'Featured3 ', [Content('1', 'content1'),Content('3', 'content1')]),
      Featured('3', 'Featured4 ', [Content('1', 'content2')]),

  ];
  final ScrollController _scrollController = ScrollController();
  int _selectedIndex = 0;

  void _scrollToIndex(int index) {
    _scrollController.animateTo(
      index.toDouble(), // replace 50.0 with the actual height of each item
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title: Text('My App'),
            pinned: true,
            floating: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Container(
                height: 50.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featured.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                        _scrollToIndex(index);
                      },
                      child: Text(
                        featured[index].name,
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? Colors.orange
                              : Colors.white,
                        ),
                      ),
                      
                    );
                  },
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade700),
                    ),
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
          
                        Text(featured[index].name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.grey.shade700,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: featured[index].contents.length,
                            itemBuilder: (context, index2) {
                              return Text(featured[index].contents[index2].name);
                            },
                          ),
                        ),
                      
                      ],
                    ),
                  );
                },
                childCount: featured.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
