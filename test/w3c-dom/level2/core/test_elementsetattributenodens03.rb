
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
#       The method setAttributeNodeNS adds a new attribute and raises the 
#       INUSE_ATTRIBUTE_ERR exception if the newAttr is already an attribute of 
#       another Element object. 
#       
#       Retreive an attribute node of an existing element node.  Attempt to add it to an another
#       element node.  Check if the INUSE_ATTRIBUTE_ERR exception is thrown.
 #     
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-ElSetAtNodeNS]
##
DOMTestCase('elementsetattributenodens03') do

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
  def test_elementsetattributenodens03
    doc = nil
    element1 = nil
    element2 = nil
    attribute = nil
    newAttribute = nil
    elementList = nil
    nullNS = nil;

    doc = load_document("staffNS", true)
      elementList = doc.getElementsByTagNameNS("http://www.nist.gov", "address")
      element1 = elementList.item(1)
      attribute = element1.getAttributeNodeNS(nullNS, "street")
      element2 = elementList.item(2)
      
    begin
      success = false;
      begin
        newAttribute = element2.setAttributeNodeNS(attribute)
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::INUSE_ATTRIBUTE_ERR)
      end 
      assert(success, "elementsetattributenodens03")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/elementsetattributenodens03"
  end
end
