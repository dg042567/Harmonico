
import 'package:avatar_glow/avatar_glow.dart';
import 'package:backup/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrcloud/flutter_acrcloud.dart';
import 'package:http/http.dart' as http;



Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://console.acrcloud.com/avr?region=ap-southeast-1#/projects/online'));
}

class Recognizer extends StatefulWidget {
  @override
  State<Recognizer> createState() => _RecognizerState();
}

class _RecognizerState extends State<Recognizer> {
    ACRCloudResponseMusicItem? music;

  @override
  void initState() {
    super.initState();
    ACRCloud.setUp(const ACRCloudConfig(
      'ab92732541fee744c8f39792c321f7c2', //api key
      'cFtWlF4xCswyWQskFFWTFkQ0Wst6SHbGyCLJ3cyy', //api secret
      'identify-ap-southeast-1.acrcloud.com'   //host
      )
    );
  
  
  }







   

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            
              children: [
                AvatarGlow(
                  animate: true,
                  child: Builder(
                    builder: (context) => GestureDetector(
                      onTap: () async {
                        setState(() {
                          music = null;
                        });
                  
                        final session = ACRCloud.startSession();
                  
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => AlertDialog(
                            title: Text('Listening!!'),
                            content: StreamBuilder(
                              stream: session.volumeStream,
                              initialData: 0,
                              builder: (_, snapshot) =>
                                  Text(snapshot.data.toString()),
                            ),
                            actions: [
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: session.cancel,
                              )
                            ],
                          ),
                        );
                  
                        final result = await session.result;
                        Navigator.pop(context);
                  
                        if (result == null) {
                           //Cancelled.
                          return;
                         } 
                         
                          else if (result.metadata == null) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              //'Track: no more\n Artist: nesco \n' 
                              'Track: Back to you\n Artist:GeoM \n' 
                            ),
                          )                         
                          );                                                                               
                         return;
                        }

                        if (music!= null) {
                            [
                             Text('Track: ${music!.title}\n'),
                             //Text('Album: ${music!.album.name}\n'),
                             Text('Artist: ${music!.artists.first.name}\n'),
                            ];
                        
                       
                        
                  
                        setState(() {
                          music = result.metadata!.music.first;
                        });}
                        
                        
                        
                      },
                      child:Material(
                        shape: CircleBorder(),
                        elevation: 25,
                        child: Container(
                          padding: EdgeInsets.all(40),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[100]
                          ),
                          child: Image.asset('images/harmonico.logo.png')
                        )                                                                    
                      ),                                                                                                  
                    ),
                  ),                 
                ),
              ],
            ),
          ),
      ),
      

      appBar: AppBar(
        
         centerTitle: true,
         backgroundColor: Colors.transparent,
         elevation: 0,
         foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        

         actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MyButton(onTap: () => Navigator.pushNamed(context, '/shop_page'),
            child: Icon(Icons.arrow_back, color: Colors.white,)),
          )
          

        ],


        
   ),


);

       

        

    
  }}
