
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
#       Test the setAttributeNodeNS method.
#       Retreive the street attribute from the second address element node.  
#       Clone it and add it to the first address node.  The INUSE_ATTRIBUTE_ERR exception
#       should not be thrown. Check the name and value of the newly added node.
 #     
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-ElSetAtNodeNS]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=259]
##
DOMTestCase('elementsetattributenodens02') do

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
  def test_elementsetattributenodens02
    doc = nil
    element = nil
    element2 = nil
    attribute = nil
    attributeCloned = nil
    newAttr = nil
    elementList = nil
    attrName = nil
    attrValue = nil
    nullNS = nil;

    doc = load_document("staffNS", true)
      elementList = doc.getElementsByTagNameNS("http://www.nist.gov", "address")
      element = elementList.item(1)
      attribute = element.getAttributeNodeNS(nullNS, "street")
      attributeCloned = attribute.cloneNode(true)
      element2 = elementList.item(2)
      newAttr = element2.setAttributeNodeNS(attributeCloned)
      attrName = newAttr.nodeName()
      attrValue = newAttr.nodeValue()
      assert_equal("street", attrName, "elementsetattributenodens02_attrName")
            assert_equal("Yes", attrValue, "elementsetattributenodens02_attrValue")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/elementsetattributenodens02"
  end
end

