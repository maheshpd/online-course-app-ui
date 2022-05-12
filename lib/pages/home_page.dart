import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:online_course_app_ui/constant/data_json.dart';
import 'package:online_course_app_ui/pages/course_detail_page.dart';
import 'package:online_course_app_ui/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/images/burger_icon.svg")),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
                      fit: BoxFit.cover)),
            )
          ],
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
      children: <Widget>[
        const Text(
          "Hey, SopheaMen",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 15,
        ),
        const Text(
          "Find a course you want to learn",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: grey),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: TextField(
                cursorColor: black,
                controller: _searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search for anything",
                  prefixIcon: Icon(LineIcons.search, color: black.withOpacity(0.8),)
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Text("Categories", style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),),
            Text("See All", style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: primary
            ),
            ),
          ],
        ),
        const SizedBox(height: 40,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(online_data_one.length, (index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CourseDetailPage(
                        title: online_data_one[index]['title'],
                        imgDetail: online_data_one[index]['img_detail'],
                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Stack(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 60) / 2,
                            height: 200,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(online_data_one[index]['img']),
                                    fit: BoxFit.cover)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 18, right: 18),
                            child: Column(
                              children: <Widget>[
                                Text(online_data_one[index]['title'],
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8,),
                                Text(online_data_one[index]['courses'],
                                  style: TextStyle(fontSize: 14, color: black.withOpacity(0.6)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
            ),
            const SizedBox(width: 20,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(online_data_two.length, (index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => CourseDetailPage(
                        title: online_data_two[index]['title'],
                        imgDetail: online_data_two[index]['img_detail'],
                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Stack(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 60) / 2,
                            height: 240,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(online_data_two[index]['img']),
                                    fit: BoxFit.cover)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25, left: 18, right: 18),
                            child: Column(
                              children: <Widget>[
                                Text(online_data_two[index]['title'],
                                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8,),
                                Text(online_data_two[index]['courses'],
                                  style: TextStyle(fontSize: 14, color: black.withOpacity(0.6)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
            )
          ],
        ),
      ],
    );
  }
}
