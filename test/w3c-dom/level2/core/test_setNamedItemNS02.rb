
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
#     The "setNamedItemNS(arg)" method for a 
#    NamedNodeMap should raise WRONG_DOCUMENT_ERR DOMException if arg was
#    created from a different document than the one that created this map.
#    
#    Create an attr node in a different document with qualifiedName equals
#    "dmstc:domestic" and namespaceURI is "http://www.usa.com".
#    Access the namednodemap of the first "address" element in this document.
#    Invoke method setNamedItemNS(arg) with arg being the attr node from above.
#    Method should raise WRONG_DOCUMENT_ERR DOMException.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#xpointer(id('ID-258A00AF')/constant[@name='WRONG_DOCUMENT_ERR'])]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-setNamedItemNS]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#xpointer(id('ID-setNamedItemNS')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='WRONG_DOCUMENT_ERR'])]
##
DOMTestCase('setNamedItemNS02') do

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
    preload(contentType, "staffNS", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_setNamedItemNS02
    namespaceURI = "http://www.usa.com";
    qualifiedName = "dmstc:domestic";
    doc = nil
    anotherDoc = nil
    arg = nil
    elementList = nil
    testAddress = nil
    attributes = nil
    setNode = nil
    doc = load_document("staffNS", true)
      anotherDoc = load_document("staffNS", true)
      arg = anotherDoc.createAttributeNS(namespaceURI, qualifiedName)
      arg.nodeValue = "Maybe"
      elementList = doc.getElementsByTagName("address")
      testAddress = elementList.item(0)
      attributes = testAddress.attributes()
      
    begin
      success = false;
      begin
        setNode = attributes.setNamedItemNS(arg)
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::WRONG_DOCUMENT_ERR)
      end 
      assert(success, "throw_WRONG_DOCUMENT_ERR")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/setNamedItemNS02"
  end
end

