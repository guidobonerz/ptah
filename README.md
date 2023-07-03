# ptah
ptah - Petite Template Automation Handler...\
... or Ptah ("the builder") is one of the gods of the ancient Egyptian religion\
... is a template based code generator\
\
+++ still in development +++

Generator functions for use in templates

- getBaseNameSpace > return string
- getNameSpace > return string
- getNameSpaceByTemplate > parameter(s):templatename > return string
- getFullNameSpace > return string
- getTemplateName > return string
- getFullObjectName > parameter(s):templatename > return string
- getObjectName > parameter(s):templatename > return string
- getUpperCaseName > parameter(s):text > return string
- getCamelCaseName > parameter(s):text > return string
- needSize > parameter(s):attribute, includeMaxSize > return bool
- getSize > parameter(s):attribute > return string
- getAttributeSeparator > parameter(s):index, attributes[] > return string
- getAttributes > return attributes[]
- getDataTypes > parameter(s):attributes[] > return string[]
- getDataType > parameter(s):attribute > return string
- getGetterPrefix > parameter(s):attribute > return string
- getUid > return string
- getReferences > return map[string, attribute]
- getPrimaryAttributes > return attributes[]
- hasMultiplePrimaryAttriutes > return bool

A documentation of the general GO templates can be found [here](https://pkg.go.dev/text/template) 

