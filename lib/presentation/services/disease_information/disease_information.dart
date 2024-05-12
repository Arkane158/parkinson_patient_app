import 'package:flutter/material.dart';

class DiseaseInformationScreen extends StatelessWidget {
  const DiseaseInformationScreen({super.key});
  static const String screenName = "disease-information";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disease Information'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * .02,
          vertical: size.height * .02,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Parkinson’s Disease: Causes, Symptoms',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Image.asset('assets/images/disease_info.jpeg'),
              const SizedBox(height: 10),
              const Text(
                "Parkinson's disease is a progressive disorder that affects the nervous system and the parts of the body controlled by the nerves.\nSymptoms usually begin gradually and worsen over time. As the disease progresses, people may have difficulty walking and talking. They may also have mental and behavioral changes, sleep problems, depression, memory difficulties, and fatigue.\nWhile virtually anyone could be at risk for developing Parkinson’s, some research studies suggest this disease affects more men than women. It’s unclear why, but studies are underway to understand factors that may increase a person’s risk. One clear risk is age: Although most people with Parkinson’s first develop the disease after age 60, about 5% to 10% experience onset before the age of 50. Early-onset forms of Parkinson’s are often, but not always, inherited, and some forms have been linked to specific alterations in genes.",
              ),
              SizedBox(
                height: size.height * .02,
              ),
              Center(
                child: Text(
                  "What causes Parkinson’s disease?",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              const Text(
                  "The most prominent signs and symptoms of Parkinson’s disease occur when nerve cells in the basal ganglia, an area of the brain that controls movement, become impaired and/or die. Normally, these nerve cells, or neurons, produce an important brain chemical known as dopamine. When the neurons die or become impaired, they produce less dopamine, which causes the movement problems associated with the disease. Scientists still do not know what causes the neurons to die."),
              SizedBox(
                height: size.height * .02,
              ),
              const Image(image: AssetImage('assets/images/brain.jpeg')),
              SizedBox(
                height: size.height * .02,
              ),
              const Text(
                  "People with Parkinson’s disease also lose the nerve endings that produce norepinephrine, the main chemical messenger of the sympathetic nervous system, which controls many functions of the body, such as heart rate and blood pressure. The loss of norepinephrine might help explain some of the non-movement features of Parkinson’s, such as fatigue, irregular blood pressure, decreased movement of food through the digestive tract, and sudden drop in blood pressure when a person stands up from a sitting or lying position.\nMany brain cells of people with Parkinson’s disease contain Lewy bodies, unusual clumps of the protein alpha-synuclein. Scientists are trying to better understand the normal and abnormal functions of alpha-synuclein and its relationship to genetic variants that impact Parkinson’s and Lewy body dementia.\nSome cases of Parkinson’s disease appear to be hereditary, and a few cases can be traced to specific genetic variants. While genetics is thought to play a role in Parkinson’s, in most cases the disease does not seem to run in families. Many researchers now believe that Parkinson’s results from a combination of genetic and environmental factors, such as exposure to toxins."),
              SizedBox(
                height: size.height * .02,
              ),
              Center(
                child: Text(
                  "Diagnosis of Parkinson’s disease",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              const Text(
                  "There are currently no blood or laboratory tests to diagnose non-genetic cases of Parkinson’s. Doctors usually diagnose the disease by taking a person’s medical history and performing a neurological examination. If symptoms improve after starting to take medication, it’s another indicator that the person has Parkinson’s.\nA number of disorders can cause symptoms similar to those of Parkinson’s disease. People with Parkinson’s-like symptoms that result from other causes, such as multiple system atrophy and dementia with Lewy bodies, are sometimes said to have parkinsonism. While these disorders initially may be misdiagnosed as Parkinson’s, certain medical tests, as well as response to drug treatment, may help to better evaluate the cause. Many other diseases have similar features but require different treatments, so it is important to get an accurate diagnosis as soon as possible."),
              SizedBox(
                height: size.height * .02,
              ),
              const Image(image: AssetImage('assets/images/brain2.jpeg')),
              SizedBox(
                height: size.height * .02,
              ),
              Center(
                child: Text(
                  "Treatments for Parkinson’s disease",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              const Text(
                  'Although there is no cure for Parkinson’s disease, medicines, surgical treatment, and other therapies can often relieve some symptoms.'),
              SizedBox(
                height: size.height * .02,
              ),
              Center(
                child: Text(
                  "Medicines for Parkinson’s disease",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              const Text(
                  "Medicines can help treat the symptoms of Parkinson’s by:\nIncreasing the level of dopamine in the brain\nHaving an effect on other brain chemicals, such as neurotransmitters, which transfer information between brain cells\nHelping control non-movement symptoms\nThe main therapy for Parkinson’s is levodopa. Nerve cells use levodopa to make dopamine to replenish the brain’s dwindling supply. Usually, people take levodopa along with another medication called carbidopa. Carbidopa prevents or reduces some of the side effects of levodopa therapy — such as nausea, vomiting, low blood pressure, and restlessness — and reduces the amount of levodopa needed to improve symptoms.\nPeople living with Parkinson’s disease should never stop taking levodopa without telling their doctor. Suddenly stopping the drug may have serious side effects, like being unable to move or having difficulty breathing."),
              SizedBox(
                height: size.height * .02,
              ),
              Center(
                child: Text(
                  "The doctor may prescribe other medicines \nto treat Parkinson’s symptoms, including:",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .02,
              ),
              const Text(
                  "Dopamine agonists to stimulate the production of dopamine in the brain\nEnzyme inhibitors (e.g., MAO-B inhibitors, COMT inhibitors) to increase the amount of dopamine by slowing down the enzymes that break down dopamine in the brain\nAmantadine to help reduce involuntary movements\nAnticholinergic drugs to reduce tremors and muscle rigidity")
            ],
          ),
        ),
      ),
    );
  }
}
