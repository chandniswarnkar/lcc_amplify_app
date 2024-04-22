import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/category_page.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';

class LCCLearningPage extends StatefulWidget {
  const LCCLearningPage({super.key});

  // This widget is the root of your application.
  @override
  State<LCCLearningPage> createState() => LCCLearningPageState();
}

class LCCLearningPageState extends State<LCCLearningPage> {
  bool _isAmplifyConfigured = false;

  List<AssetImage> listOfImages = [ AssetImage("assets/images/transacting_ellipse.png"),
  AssetImage("assets/images/communicating_ellipse.png"),
  AssetImage("assets/images/handling_ellipse.png"),
  AssetImage("assets/images/problem_solving_ellipse.png"),
  AssetImage("assets/images/online_safety_ellipse.png")
  ];


  @override
  void initState() {

    super.initState();
    if (Amplify.isConfigured == false) {
      _configureAmplify();
    }


  }

  Future<void> _configureAmplify() async {
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);
    await Amplify.addPlugin(api);

    try {
      await Amplify.configure(amplifyconfig);
      setState(() => _isAmplifyConfigured = true);
      print('Successfully configured');
    } on Exception catch (e) {
      safePrint('An error occurred configuring Amplify: $e');
    }
  }

  Future<List<Content?>> questionListItems() async
  {
    return [ Content(id: "123",contentLabel: "Transacting", contentDescription: "4 Skills"),
      Content(id: "124",contentLabel: "Communicating", contentDescription: "7 Skills"),
      Content(id: "125",contentLabel: "Handling Content", contentDescription: "8 Skills"),
      Content(id: "126",contentLabel: "Problem Solving", contentDescription: "4 Skills"),
      Content(id: "127",contentLabel: "Online Safety", contentDescription: "9 Skills")

    ];

  }

  Future<List<Content?>> queryListItems() async {
    try {
      final request = ModelQueries.list(Content.classType);
      final response = await Amplify.API.query(request: request).response;

      final questions = response.data?.items;
      if (questions == null) {
        safePrint('errors: ${response.errors}');
        return questionListItems();
      }
      return questions;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return questionListItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: Color(0xFFD6C4E4) ,
      body: FutureBuilder(
        future: queryListItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {

            return Text('Error: ${snapshot.error}');
          } else {
            return Column(children: [
              SizedBox(height: 55,),
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child:
              Row(
                children: [
                  const Text(
                    'Essential Digital Skills',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/user_profile.png"),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(140),
                      ),
                    ),
                  ),


                ],
              ),
                ),
              ////
              Expanded(child:
                Container(

                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child:

              ListView.builder(

              itemCount: snapshot.data != null ? snapshot.data?.length : 5,
              itemBuilder: (context, index) {
                return Container(
                  height: 120,
                  child:
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  children: [
                  GestureDetector(
                  onTap: snapshot.data?[index]?.contentLabel == "Transacting"?   () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryPage()),
                );
                } : (){},
                child:
                    Container(
                    height: 110,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                    decoration: ShapeDecoration(
                      color:   snapshot.data?[index]?.contentLabel  == "Transacting" ? const Color.fromRGBO(255, 255, 255, 1) :
                      const Color.fromRGBO(255, 255, 255, 0.6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    child:
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,


                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                            //  mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                // color:Colors.green,
                                 // margin: const EdgeInsets.symmetric(vertical: 10),
                                  child:
                                 Column(

                                 // mainAxisSize: MainAxisSize.min,
                                //  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                   snapshot.data?[index]?.contentLabel ?? 'Transacting',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      snapshot.data?[index]?.contentDescription ?? '4 Skills',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0.09,
                                      ),
                                    ),
                                  ],
                                ),
                                    ),
                                //  const SizedBox(width: 80),

                                Stack(children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: listOfImages[index] ,
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(140),
                                      ),
                                    ),
                                  ),

                                Visibility(visible: snapshot.data?[index]?.contentLabel != "Transacting",

                                  child:
                                  Positioned(
                                    top: 0,
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Center(
                                        child: Image.asset("assets/images/Lock.png",  fit: BoxFit.fill,

                                        )
                                    ),
                                  ),
                          ),

                                ],),


                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),



                  ],
                ),
                );

              },

            ),
          ),
          ),
         ])
            ;
          }
        },
      ),
    );
  }
}
