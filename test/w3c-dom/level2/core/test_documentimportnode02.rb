
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin


Copyright (c) 2001-2004 World Wide Web Consortium, 
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
#  The importNode method imports a node from another document to this document. 
#  The returned node has no parent; (parentNode is null). The source node is not 
#  altered or removed from the original document but a new copy of the source node
#  is created.
#  
#  Using the method importNode with deep=false, import the attribute, "emp:zone" of the 
#  element node which is retreived by its elementId="CANADA", into the another document.
#  Check the parentNode, nodeName, nodeType and nodeValue of the imported node to 
#  verify if it has been imported correctly.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#Core-Document-importNode]
##
DOMTestCase('documentimportnode02') do

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
    preload(contentType, "staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_documentimportnode02
    doc = nil
    docImported = nil
    element = nil
    attr = nil
    importedAttr = nil
    nodeName = nil
    nodeType = nil
    nodeValue = nil
    addresses = nil
    attrsParent = nil
    doc = load_document("staffNS", true)
      docImported = load_document("staff", true)
      addresses = doc.getElementsByTagNameNS("http://www.nist.gov", "address")
      element = addresses.item(1)
      attr = element.getAttributeNodeNS("http://www.nist.gov", "zone")
      importedAttr = docImported.importNode(attr, false)
      nodeName = importedAttr.nodeName()
      nodeType = importedAttr.nodeType()
      nodeValue = importedAttr.nodeValue()
      attrsParent = importedAttr.parentNode()
      assert_nil(attrsParent, "documentimportnode02_parentNull")
      assert_equal("emp:zone", nodeName, "documentimportnode02_nodeName")
            assert_equal(2, nodeType, "documentimportnode02_nodeType")
            assert_equal("CANADA", nodeValue, "documentimportnode02_nodeValue")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/documentimportnode02"
  end
end

