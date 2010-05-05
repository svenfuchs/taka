
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
#     The method getNamedItemNS retrieves a node specified by local name and namespace URI. 
#   
#     Retreive the second address element node having localName=adrress.
#     Create a new attribute node having the same name as an existing node but different namespaceURI
#     and add it to this element.  Using the getNamedItemNS retreive the newly created attribute 
#     node from a nodemap of attributes of the retreive element node.
#     Verify if the attr node has been retreived successfully by checking its nodeName atttribute.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-getNamedItemNS]
##
DOMTestCase('namednodemapgetnameditemns04') do

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
  def test_namednodemapgetnameditemns04
    doc = nil
    attributes = nil
    element = nil
    attribute = nil
    newAttr1 = nil
    newAttribute = nil
    elementList = nil
    attrName = nil
    doc = load_document("staffNS", true)
      elementList = doc.getElementsByTagNameNS("*", "address")
      element = elementList.item(1)
      newAttr1 = doc.createAttributeNS("http://www.w3.org/DOM/L1", "street")
      newAttribute = element.setAttributeNodeNS(newAttr1)
      attributes = element.attributes()
      attribute = attributes.getNamedItemNS("http://www.w3.org/DOM/L1", "street")
      attrName = attribute.nodeName()
      assert_equal("street", attrName, "namednodemapgetnameditemns04")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/namednodemapgetnameditemns04"
  end
end

