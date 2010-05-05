
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
#    The "createElementNS(namespaceURI,qualifiedName") method for
#    a Document should raise NAMESPACE_ERR DOMException if the
#    qualifiedName has an "xml" prefix and the namespaceURI is different
#    from http://www.w3.org/XML/1998/namespace".
#    
#    Invoke method createElementNS(namespaceURI,qualifiedName) on this document
#    with qualifiedName being "xml:element1" and namespaceURI equals the string
#    "http://www.w3.org/XML/1997/namespace" (which differs from the required 
#    string "http://www.w3.org/XML/1998/namespace").
#    Method should raise NAMESPACE_ERR DOMException.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#xpointer(id('ID-258A00AF')/constant[@name='NAMESPACE_ERR'])]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-DocCrElNS]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#xpointer(id('ID-DocCrElNS')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='NAMESPACE_ERR'])]
##
DOMTestCase('createElementNS04') do

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
  def test_createElementNS04
    namespaceURI = "http://www.w3.org/XML/1998/namespaces";
    qualifiedName = "xml:element1";
    doc = nil
    newElement = nil
    doc = load_document("staffNS", false)
      
    begin
      success = false;
      begin
        newElement = doc.createElementNS(namespaceURI, qualifiedName)
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
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/createElementNS04"
  end
end

