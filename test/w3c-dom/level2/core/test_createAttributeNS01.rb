
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
#     The "createAttributeNS(namespaceURI,qualifiedName)" method for a 
#    Document should raise NAMESPACE_ERR DOMException
#    if qualifiedName is malformed.
#    
#    Invoke method createAttributeNS(namespaceURI,qualifiedName) on
#    the XMLNS Document with namespaceURI being "http://www.ecommerce.org/",
#    qualifiedName as "prefix::local".  Method should raise
#    NAMESPACE_ERR DOMException.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#xpointer(id('ID-258A00AF')/constant[@name='NAMESPACE_ERR'])]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-DocCrAttrNS]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#xpointer(id('ID-DocCrAttrNS')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='NAMESPACE_ERR'])]
##
DOMTestCase('createAttributeNS01') do

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
    preload(contentType, "staffNS", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_createAttributeNS01
    namespaceURI = "http://www.ecommerce.org/";
    malformedName = "prefix::local";
    doc = nil
    newAttr = nil
    doc = load_document("staffNS", false)
      
    begin
      success = false;
      begin
        newAttr = doc.createAttributeNS(namespaceURI, malformedName)
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::NAMESPACE_ERR)
      end 
      assert(success, "throw_NAMESPACE_ERR")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/createAttributeNS01"
  end
end

