Instance: IHE.pscc.Content-Creator
InstanceOf: CapabilityStatement
Title: "PSCc Content Creator"
Usage: #definition
* name = "IHE_PSCc_Content_Creator"
* title = "PSCc Content Creator"
* status = #active
* experimental = false
* date = "2025-10-20"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* description = "The PSCc[Content Creator](volume-1.html#Content-Creator)"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* document[+].mode = #producer 
//* document[=].profile = Canonical(IHE_PCC_mAPS_Composition)

Instance: IHE.PSCc.Content-Consumer
InstanceOf: CapabilityStatement
Title: "PSCc Content Consumer"
Usage: #definition
* name = "IHE_PSCc_Content_Consumer"
* title = "PSCc Content Consumer"
* status = #active
* experimental = false
* date = "2025-10-20"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* description = "The PSCc[Content Consumer](volume-1.html#Content-Consumer)"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* document[+].mode = #producer 
//* document[=].profile = Canonical(IHE_PCC_mAPS_Composition)
