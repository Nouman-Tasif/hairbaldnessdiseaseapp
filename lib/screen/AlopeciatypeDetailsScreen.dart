
import 'package:flutter/material.dart';

class AlopeciaTypeDetailsScreen extends StatelessWidget {
  final int index;
  final String title;

  AlopeciaTypeDetailsScreen({required this.index, required this.title});

  final Map<int, String> details = {
    0: 'The main symptom of alopecia areata is hair that falls out in patches, usually on the scalp. But alopecia areata can affect the eyebrows, eyelashes, and elsewhere on the body.\n\nAlopecia areata is an autoimmune disorder. With alopecia areata, the body’s immune system mistakenly attacks healthy hair follicles, small, pocket-like holes in our skin that grow hair, similar to the way the immune system might fight an infection. Injury to the follicles results in hair loss. This type of alopecia tends to run in families.',
    1: 'When patchy hair loss continues but does not improve or worsen over time, it’s characterized as persistent patchy alopecia areata. It’s caused by the same factors that lead to alopecia areata.',
    2: 'When the entire scalp experiences hair loss, the condition is called alopecia totalis. Like some other forms of alopecia, it appears to be related to an unusual immune system response. However, researchers are still trying to discover the exact causes of alopecia totalis.',
    3: 'As its name implies, alopecia universalis is a condition that involves complete hair loss. This includes the scalp and the rest of the body. Like other autoimmune diseases, it’s unclear why some people develop this condition and others don’t.',
    4: 'Diffuse alopecia areata is also known as telogen effluvium. It’s different from alopecia areata because your hair thins and then falls out in scattered areas across the scalp, instead of falling out in patches. In rare cases, similar hair loss patterns will occur in other areas of the body. Causes include severe stress, sudden hormonal changes, and medication side effects.',
    5: 'Ophiasis alopecia is a form of alopecia areata that mostly affects the sides and back of the scalp. It’s an autoimmune disorder that mainly affects young people.',
    6: 'Androgenic alopecia is a common genetic condition that affects people of all genders.',
    7: 'Male pattern baldness usually starts with a receding hairline or hair loss on the crown. The sides and lower back of the head are usually the last areas to lose hair, if they lose any at all.',
    8: 'Female pattern baldness is different from male pattern baldness because it usually starts with thinning hair along the part line. The part line can eventually widen, but complete baldness is rare.',
    9: 'Experts don’t entirely understand the causes of cicatricial alopecia, though this inflammatory condition sometimes develops after the skin is damaged by a burn or severe infection. Hair loss may occur slowly in patches or more rapidly in larger areas. The skin underneath may also become itchy and inflamed.',
    10: 'Lichen planopilaris is another inflammatory condition that tends to affect young women more often than men. It’s a rare disorder with an unknown cause that results in smooth patches of skin on the scalp.',
    11: 'Frontal fibrosing alopecia is a form of lichen planopilaris. It usually causes slow but progressive hair loss, usually just above the forehead. The eyebrows and eyelashes may also be affected.',
    12: 'CCCA causes hair loss that starts on the crown and then spreads across the top of the head. According to a 2020 report, CCCA almost exclusively affects Black women over 30 years old. Experts aren’t sure why, but CCCA probably has multiple causes.',
    13: 'Traction alopecia is hair loss triggered by repeatedly pulling or tightening hair in the same direction.',
    14: 'An autoimmune condition, alopecia barbae causes beard hair to fall out in small circular patches. Sometimes patches overlap as the condition progresses. However, it’s difficult to predict how much hair will be lost.',
    15: 'The rapid and significant drop in estrogen levels following childbirth can result in a condition known as postpartum alopecia. However, doctors don’t consider this to be typical hair loss. Instead, postpartum alopecia is actually the hair shedding following the enhanced hair growth that can occur during pregnancy. Within a few months, regular hair growth usually resumes.'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: 'heading_$index',
          child: Material(
            color: Colors.transparent,
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                details[index] ?? 'No details available.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}