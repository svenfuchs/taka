
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin


Copyright (c) 2001 World Wide Web Consortium, 
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
#     Retreive the second address element node having localName=adrress.  Retreive the attributes 
#     of this element into 2 nodemaps.  Create a new attribute node and add it to this element.  
#     Since NamedNodeMaps are live each one should get updated, using the getNamedItemNS retreive 
#     the newly created attribute from each node map.
#     Verify if the attr node has been retreived successfully by checking its nodeName atttribute.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-getNamedItemNS]
##
DOMTestCase('namednodemapgetnameditemns06') do

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
  def test_namednodemapgetnameditemns06
    doc = nil
    attributesMap1 = nil
    attributesMap2 = nil
    element = nil
    attribute = nil
    newAttr1 = nil
    newAttribute = nil
    elementList = nil
    attrName = nil
    doc = load_document("staffNS", true)
      elementList = doc.getElementsByTagNameNS("*", "address")
      element = elementList.item(1)
      attributesMap1 = element.attributes()
      attributesMap2 = element.attributes()
      newAttr1 = doc.createAttributeNS("http://www.w3.org/DOM/L1", "street")
      newAttribute = element.setAttributeNodeNS(newAttr1)
      attribute = attributesMap1.getNamedItemNS("http://www.w3.org/DOM/L1", "street")
      attrName = attribute.nodeName()
      assert_equal("street", attrName, "namednodemapgetnameditemnsMap106")
            attribute = attributesMap2.getNamedItemNS("http://www.w3.org/DOM/L1", "street")
      attrName = attribute.nodeName()
      assert_equal("street", attrName, "namednodemapgetnameditemnsMap206")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/namednodemapgetnameditemns06"
  end
end

