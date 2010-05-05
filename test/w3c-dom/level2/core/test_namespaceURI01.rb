
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
#     The "getNamespaceURI()" method for an Attribute
#     returns the namespace URI of this node, or null if unspecified.
#     
#     Retrieve the first "emp:address" node which has an attribute of "emp:district"
#     that is specified in the DTD.
#     Invoke the "getNamespaceURI()" method on the attribute.   
#     The method should return "http://www.nist.gov". 
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-NodeNSname]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=238]
##
DOMTestCase('namespaceURI01') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
=begin
      org.w3c.domts.DocumentBuilderSetting[] settings = 
          new org.w3c.domts.DocumentBuilderSetting[] {
org.w3c.domts.DocumentBuilderSetting.namespaceAware,
org.w3c.domts.DocumentBuilderSetting.validating
        };
        DOMTestDocumentBuilderFactory testFactory = factory.newInstance(settings)
        setFactory(testFactory)
=end

    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "staffNS", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_namespaceURI01
    doc = nil
    elementList = nil
    testAddr = nil
    addrAttr = nil
    attrNamespaceURI = nil
    doc = load_document("staffNS", false)
      elementList = doc.getElementsByTagName("emp:address")
      testAddr = elementList.item(0)
      addrAttr = testAddr.getAttributeNodeNS("http://www.nist.gov", "district")
      attrNamespaceURI = addrAttr.namespaceURI()
      assert_equal("http://www.nist.gov", attrNamespaceURI, "namespaceURI")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/namespaceURI01"
  end
end

