import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int index;
  final String title;

  DetailScreen({required this.index, required this.title});

  final Map<int, String> details = {
    0: 'Male pattern baldness is a type of hair loss and thinning that is common in adult men. It is also known as androgenetic alopecia. Male pattern baldness involves hair loss that starts at the hairline above the temples and leads to a receding hairline. This is followed by hair loss on the top or ‘crown’ of the head, leaving behind a horseshoe-shaped pattern of hair. While it is commonly seen in older men, male pattern baldness can affect young adult men as well.',
    1: 'Alopecia in men; Baldness - male; Hair loss in men; Androgenetic alopecia',
    2: 'The typical pattern of male baldness begins at the hairline in the front of the head. The hairline gradually moves backward (recedes) and forms an "M" shape. A circular area on the back of the head (vertex) often thins and expands in size over time. Eventually the hair becomes finer, shorter, and thinner, and creates a U-shaped (or horseshoe) pattern of hair around the sides of the head and a bald area on the back of the head.',
    3: 'Male pattern hair loss is an inherited (genetic) condition that affects how some of the hair on your scalp responds to certain male hormones. There is no genetic test currently available to predict whether you will experience male pattern baldness.\n\nMale pattern baldness is very common among Caucasian men. It affects about 1 in 5 men in their 20s, 1 in 3 men in their 30s and nearly 1 in every 2 men in their 40s. Other population groups, for example, Japanese and Chinese men, are generally less affected. If affected, men in these groups may experience a milder and more general pattern of hair thinning or loss.',
    4: 'Alopecia areata usually leads to one or more circular patches of hair loss, usually on your head. Bald patches can get bigger quickly. The skin in these patches looks normal. You may have some white or broken hairs in the bald patches.\n\nThe hair usually grows back, but it can take several months or even years. Sometimes your hair will fall out again and then grow back again, with alopecia coming and going. In some people, it may never grow back.',
    5: 'Loss of hair; Alopecia; Baldness; Scarring alopecia; Non-scarring alopecia',
    6: 'Alopecia areata primarily affects hair, but in some cases, there are nail changes as well. People with the disease are usually healthy and have no other symptoms.\n\nHair Changes: Alopecia areata typically begins with sudden loss of round or oval patches of hair on the scalp, but any part of the body may be affected, such as the beard area in men, or the eyebrows or eyelashes. Around the edges of the patch, there are often short broken hairs or “exclamation point” hairs that are narrower at their base than their tip. There is usually no sign of a rash, redness, or scarring on the bare patches. Some people say they feel tingling, burning, or itching on patches of skin right before the hair falls out.\n\nWhen a bare patch develops, it is hard to predict what will happen next. The possibilities include:\n\nThe hair regrows within a few months. It may look white or gray at first but may regain its natural color over time.\n\nAdditional bare patches develop. Sometimes hair regrows in the first patch while new bare patches are forming.\n\nSmall patches join to form larger ones. In rare cases, hair is eventually lost from the entire scalp, called alopecia totalis.\n\nThere is a progression to complete loss of body hair, a type of the disease called alopecia universalis. This is rare.',
    7: 'In alopecia areata, the immune system mistakenly attacks hair follicles, causing inflammation. Researchers do not fully understand what causes the immune attack on hair follicles, but they believe that both genetic and environmental (non-genetic) factors play a role.\n\nCauses of this type of hair loss are:\n\nHigh fever or severe infection\n\nChildbirth\n\nMajor surgery, major illness, sudden blood loss\n\nSevere emotional stress\n\nCrash diets, especially those that do not contain enough protein\n\nDrugs, including retinoids, birth control pills, beta-blockers, calcium channel blockers, certain antidepressants, NSAIDs (including ibuprofen)\n\nAlopecia areata (bald patches on the scalp, beard, and, possibly, eyebrows; eyelashes may fall out)\n\nAnemia\n\nAutoimmune conditions such as lupus\n\nBurns\n\nCertain infectious diseases such as syphilis\n\nExcessive shampooing and blow-drying\n\nHormone changes\n\nThyroid diseases\n\nNervous habits such as continual hair pulling or scalp rubbing\n\nRadiation therapy\n\nTinea capitis (ringworm of the scalp)\n\nTumor of the ovary or adrenal glands\n\nHair styles that put too much tension on the hair follicles\n\nBacterial infections of the scalp',
    8: 'Treatment of alopecia depends on what is causing it. You may have an underlying infection or health condition that can be treated. If it’s caused by a medicine, you may be able to stop taking it.\n\nIf you have androgenetic alopecia, you can take medicines to slow down hair loss. If you have smaller patches of alopecia areata that are likely to grow back, you might choose not to have any treatment.',
    9: 'You can’t prevent all types of hair loss, but you can take steps to help keep your hair healthy and minimize loss. To help prevent hair loss:\n\nEat a healthy diet that includes enough calories, protein and iron.\n\nFind ways to cope with stress.\n\nManage thyroid disease or other medical conditions that could result in hair loss.\n\nAvoid hairstyles that pull hair tightly.\n\nDuring chemotherapy treatment, try a cooling cap.',
    10: 'Male pattern baldness is hereditary (genetic), so it can’t be prevented. However, looking after your diet and lifestyle will help maximise your general health, including the health of your hair.\n\nSome treatments for male pattern baldness are more effective when hair loss is still mild. If you are concerned about hair loss, it is a good idea to ask your doctor for information and advice sooner rather than later.\n\nEffective but can be very expensive, and it may lead to complications including scarring and infection.\n\nThere are many other treatments advertised to improve hair loss, including laser treatment and plasma injections. Many of these do not have evidence to prove that they are effective, and they may be expensive.'
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
          child: Text(
            details[index]!,
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ),
      ),
    );
  }
}
