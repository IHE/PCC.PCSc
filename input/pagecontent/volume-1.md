
**TODO: Provide an end-user friendly overview of what the profile does for them. Keep it brief (a paragraph or two, up to a page). If extensive detail is needed, it should be included in Section XX.4- Use Cases.**

**TODO: Explicitly state whether this is a Workflow, Transport, or Content Module (or combination) profile. See the IHE Technical Frameworks General Introduction for definitions of these profile types. The IHE Technical Frameworks [General Introduction](https://profiles.ihe.net/GeneralIntro/). **

<a name="actors-and-transactions"> </a>

## 1:X.1 PSCc Actors, Transactions, and Content Modules
This section defines the actors, transactions, and/or content modules in this implementation guide. General definitions of actors are given in the Technical Frameworks General Introduction Appendix A. IHE Transactions can be found in the Technical Frameworks General Introduction Appendix B. Both appendices are located at https://profiles.ihe.net/GeneralIntro/.

### 1:X.1.1 Actors
The actors in this profile are described in more detail in the sections below.
  - [PSCc Content Creator](https://profiles.ihe.net/ITI/sIPS/pcc.html#31-document-sharing-pcc-1)
  - [PSCc Content Consumer](https://profiles.ihe.net/ITI/sIPS/pcc.html#31-document-sharing-pcc-1)

<a name="Content-Creator"> </a>

#### 1:X.1.1.1 Content Creator

The [PSCc Content Creator](https://profiles.ihe.net/ITI/sIPS/pcc.html#31-document-sharing-pcc-1) creates the [PSCc content](StructureDefinition-IHE.PCC.mAPS.Composition.html) and shares it using one of the methods defined in the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).
**TODO Replace LINKS**

<a name="Content-Consumer"> </a>

#### 1:X.1.1.2 Content Consumer

The [PSCc Content Consumer](https://profiles.ihe.net/ITI/sIPS/pcc.html#31-document-sharing-pcc-1) consumes the [PSCc content](StructureDefinition-IHE.PCC.mAPS.Composition.html) and obtains it using one of the methods defined in the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).



**TODO Still TEMPLATE**
### 1:28.1.2 mAPS Content

The Content Creator and Content Consumer share the [APS content](StructureDefinition-IHE.PCC.mAPS.Composition.html) using one of the methods defined in the [IHE Document Sharing Health Information Exchange](https://profiles.ihe.net/ITI/HIE-Whitepaper/index.html).

<a name="actor-options"> </a>

## 1:28.2 mAPS Actor Options

Options that may be selected for each actor in this implementation guide, are listed in Table 3.2-1 below. Dependencies
between options when applicable are specified in notes.

|     Actor        |      Option          |
|------------------|----------------------|
| mAPS Content Consumer | View                 |
| mAPS Content Consumer | Document Import      |
| mAPS Content Consumer | Discrete Data Import |
{: .grid}

### 1:28.2.1 View Option

This option defines the processing requirements placed on Content Consumers for providing access, rendering and management of the medical document. See the [View Option in IHE PCC TF-2:3.1.1](https://profiles.ihe.net/ITI/sIPS/pcc.html#31-document-sharing-pcc-1) for more details on this option.

The Content Consumer Actor shall be able to present a view of the document. Minimal view guidance following [FHIR core Document Presentation](http://hl7.org/fhir/documents.html#presentation).

### 1:28.2.2 Document Import Option

This option defines the processing requirements placed on Content Consumers for providing access, and importing the entire medical document and managing it as part of the patient record. See the [Document Import Option in IHE PCC TF-2:3.1.2](https://profiles.ihe.net/ITI/sIPS/pcc.html#31-document-sharing-pcc-1) for more details on this option.

### 1:28.2.3 Discrete Data Import Option

This option defines the processing requirements placed on Content Consumers for providing access, and importing discrete data from selected sections of the medical document and
managing them as part of the patient record. See the [Discrete Data Import Option in IHE PCC TF-2:3.1.4](https://profiles.ihe.net/ITI/sIPS/pcc.html#31-document-sharing-pcc-1) for more details on this option.

<a name="required-groupings"> </a>

## 1:28.3 mAPS Required Actor Groupings

N/A

<a name="overview"> </a>

## 1:28.1 Overview
TBD
This FHIR document inherits its composition from the [International Patient Summary](https://hl7.org/fhir/uv/ips/) and will have some dependencies on that Implementation guide. 

The following table informs the Pregnancy observations that are defined in this profile, indicating where the observation is already included in the in the IPS. However, many of the sections and entries defined in the IPS were designed to be extensible, so the additional observations profiled by this specification do not impact conformance to the IPS document. 


|     mAPS Pregnancy Observations                                                                                                    |  Inherited from IPS (Y/N) |
|-----------------------------------------------------------------------------------------------------------------------------------|---------------------------|
| [Pregnancy History](StructureDefinition-IHE.PregnancyHistory.html)                                                                | N                         |
| [Date Of First Prenatal Visit](StructureDefinition-IHE.DateOfFirstPrenatalVisit.html)                                             | N                         |
| [Number Of Prenatal Visits For This Pregnancy](StructureDefinition-IHE.NumberOfPrenatalVisitsForThisPregnancy.html)               | N                         |
| [Pregnancy Status]({{site.data.fhir.hl7ips}}/StructureDefinition/Observation-pregnancy-status-uv-ips)                                                  | Y                         |
| [Menstrual Status](StructureDefinition-IHE.MenstrualStatus.html)                                                                  | N                         |
| [Date Of Last Menstral Period](StructureDefinition-IHE.DateOfLastMenstralPeriod.html)                                             | N                         |
| [Delivery Date Clinical Estimate](StructureDefinition-IHE.DeliveryDateClinicalEstimate.html)                                      | N                         |
| [Delivery Date Estimated From LMP](StructureDefinition-IHE.DeliveryDateEstimatedFromLMP.html)                                     | N                         |
| [Delivery Date Estimated From Ovulation Date](StructureDefinition-IHE.DeliveryDateEstimatedFromOvulationDate.html)                | N                         |
| [Multiple Pregnancy](StructureDefinition-IHE.MultiplePregnancy.html)                                                              | N                         |
| [Gestational Age](StructureDefinition-IHE.GestationalAge.html)                                                                    | N                         |
| [Fetus Gestational Age](StructureDefinition-IHE.FetusGestationalAge.html)                                                         | N                         |
| [Body Weight Measured Pre Pregnancy](StructureDefinition-IHE.BodyWeightMeasuredPrePregnancy.html)                                 | N                         |
| [Labor Risk](StructureDefinition-IHE.LaborRisk.html)                                                                              | N                         |
| [Delivery Risk](StructureDefinition-IHE.DeliveryRisk.html)                                                                        | N                         |
| [Fetus Gestational Age Clinical Estimate](StructureDefinition-IHE.FetusGestationalAgeClinicalEstimate.html)                       | N                         |
| [Fetus Gestational Age Estimated From LMP](StructureDefinition-IHE.FetusGestationalAgeEstimatedFromLMP.html)                      | N                         |
| [Fetus Gestational Age Estimated From Ovulation Date](StructureDefinition-IHE.FetusGestationalAgeEstimatedFromOvulationDate.html) | N                         |
| [Number Of Live Births](StructureDefinition-IHE.NumberOfLiveBirths.html)                                                          | N                         |
| [Number Of Preterm Births](StructureDefinition-IHE.NumberOfPretermBirths.html)                                                    | N                         |
| [Number Of Births StillLiving](StructureDefinition-IHE.NumberOfBirthsStillLiving.html)                                            | N                         |
| [Number Of Births To Term](StructureDefinition-IHE.NumberOfBirthsToTerm.html)                                                     | N                         |
| [Number Of Total Births](StructureDefinition-IHE.NumberOfTotalBirths.html)                                                        | N                         |
| [Number Of Abortions](StructureDefinition-IHE.NumberOfAbortions.html)                                                             | N                         |
| [Number Of Abortions Induced](StructureDefinition-IHE.NumberOfAbortionsInduced.html)                                              | N                         |
| [Number Of Abortions Spontanious](StructureDefinition-IHE.NumberOfAbortionsSpontanious.html)                                      | N                         |
| [Number Of Ectopic Pregnancies](StructureDefinition-IHE.NumberOfEctopicPregnancies.html)                                          | N                         |
| [Number Of Stillborn Births](StructureDefinition-IHE.NumberOfStillbornBirths.html)                                                | N                         |
| [Number Of Pregnancies](StructureDefinition-IHE.NumberOfPregnancies.html)                                                         | N                         |
| [Number Of Previous Live Births Now Dead](StructureDefinition-IHE.NumberOfPreviousLiveBirthsNowDead.html)                         | N                         |
| [Date Of Last Live Birth](StructureDefinition-IHE.DateOfLastLiveBirth.html)                                                       | N                         |
| [Number Of Previous Cesarean Deliveries](StructureDefinition-IHE.NumberOfPreviousCesareanDeliveries.html)                         | N                         |
| [Number Of Other Pregnancy Outcomes](StructureDefinition-IHE.NumberOfOtherPregnancyOutcomes.html)                                 | N                         |
| [Date Of Last Other Pregnancy Outcome](StructureDefinition-IHE.DateOfLastOtherPregnancyOutcome.html)                              | N                         |
| [Menses Monthly](StructureDefinition-IHE.MensesMonthly.html)                                                                      | N                         |
| [Prior Menses Date](StructureDefinition-IHE.PriorMensesDate.html)                                                                 | N                         |
| [Duration Of Menstrual Flow](StructureDefinition-IHE.DurationOfMenstrualFlow.html)                                                | N                         |
| [Frequency Of Menstrual Cycles](StructureDefinition-IHE.FrequencyOfMenstrualCycles.html)                                          | N                         |
| [Menarche](StructureDefinition-IHE.Menarche.html)                                                                                 | N                         |
| [Employment Status](https://profiles.ihe.net/PCC/ODH/StructureDefinition/odh-EmploymentStatus)                                                                | N                         |
| [HCG+](StructureDefinition-IHE.hCGPositive.html)                                                                                      | N                         |
| [Smoking Tobacco Use Frequency](StructureDefinition-IHE.SmokingTobaccoUseFrequency.html)                                          | N                         |
| [Smoking Status]({{site.data.fhir.hl7ips}}/StructureDefinition/Observation-tobaccouse-uv-ips)                                                          | Y                         |
| [alcohol Use]({{site.data.fhir.hl7ips}}/StructureDefinition/Observation-alcoholuse-uv-ips)                                                             | Y                         |
| [Alcohol Use Frequency](StructureDefinition-IHE.AlcoholUseFrequency.html)                                                         | N                         |
| [Drug Use](StructureDefinition-IHE.drugUse.html)                                                                                  | N                         |
| [Exercise](StructureDefinition-IHE.Exercise.html)                                                                                 | N                         |
| [Diet](StructureDefinition-IHE.Diet.html)                                                                                         | N                         |
| [Toxic Exposure](StructureDefinition-IHE.ToxicExposure.html)                                                                      | N                         |
| [Homelessness](StructureDefinition-IHE.Homelessness.html)                                                                         | N                         |
| [Domestic Violence Risk](StructureDefinition-IHE.ViolenceRisk.html)                                                               | N                         |
| [Pregnancy Education Observation](StructureDefinition-IHE.PregnancyEducationObservation.html)                                     | N                         |
{: .grid}

### 1:28.4.1 Concepts

### 1:28.4.2 Use Cases

## 1:28.2 Use Cases 

### 1:28.2.1.1 Use case 1
Precondition: The patient’s obstetrician sees the patient for her pregnancy in the ambulatory (office) setting.  During the pregnancy, the patient is noted to have a medical problem requiring consultation with a Maternal-Fetal Medicine specialist (perinatologist).  The office obtains pre-authorization from the insurance payer for the consult, and for the intended or anticipated route of delivery, and transmits that information to both the consultant and to the hospital.  

Events: The patient is seen in the obstetrician’s office where a complete medical and relevant social history are taken by the nurse and recorded in the office EHR, incorporating data from the perinatologist’s consultation report as appropriate. Laboratory and imaging reports ordered by the perinatologist as well as the perinatologist’s consultation report are displayed electronically to the obstetrician. The obstetrician reviews the consultation report from the perinatologist’s office and imaging studies ordered by the perinatologist along with data recorded by the nurse.  Physical exam reveals some abnormalities. The obstetrician orders additional laboratory studies, and sends the patient to the hospital to Labor and Delivery. 

When the laboratory results return, the physician completes the admission H&P, Allergies, Medications, includes the data prepared or ordered by the perinatologist, and makes it available to L&D.  This data includes an assessment of the patient’s health status, and the requisite data summarized from the antepartum care given. The charge nurse for L&D documents that the complete collection of documents needed is available.  The Post-Partum discharge planning is notified and assures that there is a suitable environment with appropriate support for post-delivery after-care.

Postcondition: The Pre-delivery H&P and Antepartum Summary with appropriate relationships to the Perinatologist Consultation, and all the antepartum laboratory and imaging studies are available to the obstetrician and the birthing center personnel for incorporation into their respective EHRs. The H&P is also available to the patient for viewing and incorporation into the patient’s PHR, and into the newborn baby’s PHR.

This section defines the actors and transactions in this implementation guide.

Figure below shows the actors directly
involved in the Antepartum Summary document exchange  
Profile and the relevant transactions between them.

<figure>
{%include ActorsAndTransactions.svg%}
<figcaption><b>Figure 28.1-2: PCC Content Creator Content Consumer [PCC-01] Actor Diagram</b></figcaption>
</figure>
<br clear="all">


<a name="security-considerations"> </a>

## 1:X.5 mAPS Security Considerations

See ITI TF-2x: [Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations)

<a name="other-grouping"> </a>

## 28.6 APS Cross-Profile Considerations

The content defined in this profile can serve as source information for many pregancy related public health reporting and research efforts. Information from this profile may provide content to the Labor and Delivery Summary and may be a source for Birth and Fetal Death Reporting (BFDRE). 