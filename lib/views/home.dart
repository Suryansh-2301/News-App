import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = new List<CategoryModel>();
  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter'),
            Text('News',style: TextStyle(color: Colors.blue),)
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal:16),
              height: MediaQuery.of(context).size.height / 10,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index){
                  return CategoryTile(
                    imageUrl: categories[index].imageUrl,
                    categoryName: categories[index].categoryName,
                  );
                },
              )
            ),
          ]
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl,categoryName;
  CategoryTile({this.imageUrl,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(imageUrl, width: 120, height: 60, fit:BoxFit.cover)
            ),
          Container(
            alignment: Alignment.center,
            width: 120, height: 60,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(6)
            ),
            child:Text(
            categoryName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          )),

        ],),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {

  final String imageUrl, title, desc;
  BlogTile({@required this.imageUrl,@required this.title,@required this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text(title),
          Text(desc)
        ]
      ),
    );
  }
}