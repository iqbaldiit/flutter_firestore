import 'package:flutter/material.dart';
//import 'package:pet_medical/pet_room.dart';

//import 'models/pets.dart';
import 'models/adi_pupils.dart';

class PupilCard extends StatelessWidget {
  final Pupils pupil;
  final TextStyle boldStyle;
  final splashColor = {
    'cat': Colors.pink[100],
    'dog': Colors.blue[100],
    'other': Colors.grey[100]
  };

  PupilCard({Key? key, required this.pupil, required this.boldStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(pupil.firstName, style: boldStyle),
            ),
          ),
        ],
      ),
      // TODO Add pet room navigation
      // onTap: () => Navigator.push<Widget>(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => PetRoom(pet: pet),
      //   ),
      // ),

      //splashColor: splashColor[pet.type],
    ));
  }
}
