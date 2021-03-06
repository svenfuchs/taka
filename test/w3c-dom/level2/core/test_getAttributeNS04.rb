
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
#     The "getAttributeNS(namespaceURI,localName)" method retrieves an
#    attribute value by local name and NamespaceURI.
#    
#    Retrieve the first "emp:address" element.
#    Create a new attribute with the "createAttributeNS()" method.
#    Add the new attribute and value with the "setAttributeNS()" method.
#    The value returned by the "getAttributeNS()" method should be  
#    the string "NewValue" since the attribute had a specified value.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-ElGetAttrNS]
##
DOMTestCase('getAttributeNS04') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
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
  def test_getAttributeNS04
    namespaceURI = "http://www.nist.gov";
    localName = "blank";
    qualifiedName = "emp:blank";
    doc = nil
    newAttribute = nil
    elementList = nil
    testAddr = nil
    districtAttr = nil
    attrValue = nil
    doc = load_document("staffNS", true)
      newAttribute = doc.createAttributeNS(namespaceURI, qualifiedName)
      elementList = doc.getElementsByTagName("emp:address")
      testAddr = elementList.item(0)
      assert_not_nil(testAddr, "empAddrNotNull")
      testAddr.setAttributeNS(namespaceURI, qualifiedName, "NewValue")
      attrValue = testAddr.getAttributeNS(namespaceURI, localName)
      assert_equal("NewValue", attrValue, "throw_Equals")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/getAttributeNS04"
  end
end

