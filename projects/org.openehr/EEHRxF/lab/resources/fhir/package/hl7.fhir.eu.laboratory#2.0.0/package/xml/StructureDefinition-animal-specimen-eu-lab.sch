<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile RelatedPerson
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:RelatedPerson</sch:title>
    <sch:rule context="f:RelatedPerson">
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/practitioner-animalSpecies']) &gt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/practitioner-animalSpecies': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/practitioner-animalSpecies']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/practitioner-animalSpecies': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://hl7.org/fhir/StructureDefinition/individual-recordedSexOrGender']) &lt;= 1">extension with URL = 'http://hl7.org/fhir/StructureDefinition/individual-recordedSexOrGender': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:relationship) &lt;= 0">relationship: maximum cardinality of 'relationship' is 0</sch:assert>
      <sch:assert test="count(f:telecom) &lt;= 0">telecom: maximum cardinality of 'telecom' is 0</sch:assert>
      <sch:assert test="count(f:gender) &lt;= 0">gender: maximum cardinality of 'gender' is 0</sch:assert>
      <sch:assert test="count(f:address) &lt;= 0">address: maximum cardinality of 'address' is 0</sch:assert>
      <sch:assert test="count(f:photo) &lt;= 0">photo: maximum cardinality of 'photo' is 0</sch:assert>
      <sch:assert test="count(f:period) &lt;= 0">period: maximum cardinality of 'period' is 0</sch:assert>
      <sch:assert test="count(f:communication) &lt;= 0">communication: maximum cardinality of 'communication' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:RelatedPerson/f:extension</sch:title>
    <sch:rule context="f:RelatedPerson/f:extension">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:url) &lt;= 1">url: maximum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &gt;= 1">value[x]: minimum cardinality of 'value[x]' is 1</sch:assert>
      <sch:assert test="count(f:value[x]) &lt;= 1">value[x]: maximum cardinality of 'value[x]' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
