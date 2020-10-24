import 'package:MyFlutterBloc/auth/bloc/auth_bloc.dart';
import 'package:MyFlutterBloc/item/bloc/items_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class Home extends StatefulWidget {

  const Home({Key key}) : super(key: key);
  
  @override
  HomeState createState() => HomeState(); 

}
class HomeState extends State<Home> {
  
  ItemsBloc _itemsBloc ;
  
  @override
  void initState() {
    super.initState();
    _itemsBloc = BlocProvider.of<ItemsBloc>(context);
    _itemsBloc.add(LoadItems());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsBloc, ItemsState>(
      
      builder: (context, state){
        List<String> items = state.items;
        return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: Container(
          height: 500.0,
          width: 300.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'I am signed in',
              ),
              RaisedButton(
                child: const Text('Sign Out'),
                onPressed: () async {
                  await HydratedBloc.storage.clear();
                  context
                      .bloc<AuthBloc>()
                      .add(AuthEvent_SignOut());
                },
              ),
              RaisedButton(
                child: const Text('Clear items'),
                onPressed: () {
                  _itemsBloc.add(ClearItems());
                },
              ),
              Container(
                height: 300.0,
                width: 300.0,
                child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
                  );
                },
              ) 

              )
             
            ],
          ),
        ),
      );
    }
  );

    
  }
}
