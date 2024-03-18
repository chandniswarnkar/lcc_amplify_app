import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/category_page.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_api/amplify_api.dart';

//
// class YellowBird extends StatefulWidget {
//   const YellowBird({ super.key });
//
//   @override
//   State<YellowBird> createState() => _YellowBirdState();
// }
//
// class _YellowBirdState extends State<YellowBird> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(color: const Color(0xFFFFE306));
//   }
// }

class LCCLearningPage extends StatefulWidget {
  const LCCLearningPage({super.key});

  // This widget is the root of your application.
  @override
  State<LCCLearningPage> createState() => LCCLearningPageState();
}

class LCCLearningPageState extends State<LCCLearningPage> {
  bool _isAmplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    if (Amplify.isConfigured == false) {
      _configureAmplify();
    }

    print('Successfully init');
    //queryListItems();
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

  Future<List<Question?>> queryListItems() async {
    try {
      final request = ModelQueries.list(Question.classType);
      final response = await Amplify.API.query(request: request).response;

      final questions = response.data?.items;
      if (questions == null) {
        safePrint('errors: ${response.errors}');
        return const [];
      }
      return questions;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return const [];
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
              SizedBox(height: 60,),
              Container(
                height: 40,
               // color: Colors.green,
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
                 // color: Colors.orangeAccent,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child:

              ListView.builder(

              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 110,
                  child:
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                  children: [ Container(
                    height: 100,
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
                    decoration: ShapeDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.60),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    ),
                    child: GestureDetector(
                      onTap: snapshot.data?[index]?.questionLabel == "Transacting"?   () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CategoryPage()),
                        );
                      } : (){},
                      child:
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                 Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                   snapshot.data?[index]?.questionLabel ?? 'Transacting',
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
                                      snapshot.data?[index]?.questionDescription ?? '4 Skills',
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
                                //  const SizedBox(width: 80),

                                Stack(children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: ShapeDecoration(
                                      image: const DecorationImage(
                                        image:AssetImage("assets/images/communicating_ellipse.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(140),
                                      ),
                                    ),
                                  ),

                                Visibility(visible: snapshot.data?[index]?.questionLabel != "Transacting",

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


                  ///////
                  /*
                  ListTile(
                  title: Text(snapshot.data?[index]?.questionLabel ?? 'Line 1'),
                  subtitle: Text(
                      snapshot.data?[index]?.questionDescription ?? 'Line 2'),
                );*/
                /////
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
