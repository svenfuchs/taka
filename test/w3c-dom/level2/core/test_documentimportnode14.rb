
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin


Copyright (c) 2001-2003 World Wide Web Consortium, 
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University).  All 
Rights Reserved.  This program is distributed under the W3C's Software
Intellectual Property License.  This program is distributed in the 
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
PURPOSE.  

See W3C License http://www.w3.org/Consortium/Legal/ for more details.


=end
#

require File.expand_path('../../../../w3c_helper', __FILE__)

###
#  Using the method importNode with deep=true, import the fourth employee element node of this
#  Document.  Verify if the node has been imported correctly by checking 
#  if the default attribute present on this node has not been imported
#  and an explicit attribute has been imported.  
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#Core-Document-importNode]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=259]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=402]
##
DOMTestCase('documentimportnode14') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
=begin
      org.w3c.domts.DocumentBuilderSetting[] settings = 
          new org.w3c.domts.DocumentBuilderSetting[] {
org.w3c.domts.DocumentBuilderSetting.namespaceAware
        };
        DOMTestDocumentBuilderFactory testFactory = factory.newInstance(settings)
        setFactory(testFactory)
=end

    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "staffNS", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_documentimportnode14
    doc = nil
    newDoc = nil
    domImpl = nil
    nullDocType = nil;

    childList = nil
    imported = nil
    employeeElem = nil
    attrNode = nil
    attrValue = nil
    nullNS = nil;

    doc = load_document("staffNS", true)
      childList = doc.getElementsByTagNameNS("*", "employee")
      employeeElem = childList.item(3)
      domImpl = getImplementation()
      newDoc = domImpl.createDocument(nullNS, "staff", nullDocType)
      imported = newDoc.importNode(employeeElem, true)
      attrNode = imported.getAttributeNodeNS(nullNS, "defaultAttr")
      assert_nil(attrNode, "defaultAttrNotImported")
      attrValue = imported.getAttributeNS("http://www.w3.org/2000/xmlns/", "emp")
      assert_equal("http://www.nist.gov", attrValue, "explicitAttrImported")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/documentimportnode14"
  end
end

