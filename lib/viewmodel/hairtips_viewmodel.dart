import 'package:flutter/cupertino.dart';

import '../model/hairmodel.dart';

class HairTipsViewModel with ChangeNotifier {
  final List<Heading> headings = [
    Heading(
      title: "Rosemary",
      description:
          "The benefits of rosemary for hair are multiple, but the main advantage is its vasodilator effect, which promotes the circulation of blood in the follicles.This means they receive more nutrients, so the hair stays strong. It can be administered in the form of rosemary oil and gently massaged into the scalp. It’s also anti-inflammatory, so it calms and soothes irritated scalps ",
      image: "assets/images/rosemarry.jpeg",
    ),
    Heading(
      title: "Apple Vinegar",
      description:
          "Apple cider vinegar, or simply apple vinegar, is nothing more than fermented juice.It helps keep the pH of the scalp balanced.It also prevents frizz and softens the hair, leaving it noticeably thicker and shinier. Use once a week, always diluted in warm water, applying it to the tips and the scalp after washing by way of a gentle massage. Leave for a few minutes and remove with plenty of water to eliminate the smell",
      image: "assets/images/juicewithfruits.jpeg",
    ),
    Heading(
      title: "AAlmond oil ",
      description:
          "This oil is very easy to find in herbalists, specialty stores, and even pharmacies.It’s rich in vitamin E, a natural antioxidant that is very beneficial for skin and hair.Applying it is easy: place a few drops on the scalp and massage gently. Daily, if possible. This will nourish and hydrate the hair fibres, restore damaged hair, and give it a healthy shine and softness",
      image: "assets/images/almonds-oil.jpeg",
    ),
    Heading(
      title: "Coconut oil ",
      description:
          "Another option to prevent hair loss is to massage your head for a few minutes with coconut oil after washing. Let it work for half an hour so that the fatty acids can penetrate the cuticle and strengthen its structure. Coconut also restores balance to the pH of the scalp. It contains vitamin E, which is key to strengthening hair fibres, and has antimicrobial, antibacterial, and antifungal properties. It is a natural remedy against alopecia that is very well worth considering",
      image: "assets/images/coconods.jpeg",
    ),
    Heading(
      title: "Olive oil ",
      description:
          "You only need to apply a few drops of extra virgin olive oil to your hair and gently massage it for fifteen minutes to benefit from its properties. Its high content of vitamins E and K helps to repair and strengthen the hair, thus making it less brittle. Olive oil also protects the hair from harsh external elements, especially the sun, while moisturising and nourishing it. It also repairs the scalp.",
      image: "assets/images/greaanteawithfruits.jpeg",
    ),
    Heading(
      title: "Onion ",
      description:
          "Onion juice is another well-known home remedy against alopecia because it stimulates circulation, increases the blood flow to the follicle and enhances hair regeneration. The easiest way to apply it to the hair is to crush it until you get a paste, which can then be strained to get the juice. Dilute it in water or essential oils and just leave it on the hair for a few minutes before washing it off with shampoo",
      image: "assets/images/onion.jpeg",
    ),
    Heading(
      title: "Green tea ",
      description:
          "The well-known tea contains a large number of antioxidants, which are essential for enhancing hair growth, as well as strengthening the hair. Green tea is also rich in minerals like sodium, magnesium, potassium, and iron. A natural way to treat alopecia with green tea is to prepare a cup, let it cool and pour it on the hair as a tonic after washing",
      image: "assets/images/greaanteawithfruits.jpeg",
    ),
    Heading(
      title: "Biotin ",
      description:
          "Biotin has well-established benefits and is key in the formation of skin, nails, and hair. It helps to strengthen hair, preventing it from becoming brittle, and improving the condition of the follicles. It is an ingredient in some hair products formulated to regulate grease and dandruff",
      image: "assets/images/vegetables.jpeg",
    ), // Add more headings here...
    Heading(
      title: "Wash your hair ",
      description:
          "Do not pull on it or rub it too much with the towel; dry it by giving it delicate touches and avoid very hot air. Opt for broad spiked combs, ideally made of wood or tortoise shell. Pay close attention to washing, especially in the summer",
      image: "assets/images/takebath.jpeg",
    ), // Add more headings here...
  ];
}
