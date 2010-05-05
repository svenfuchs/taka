
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
#     The "createDocument(namespaceURI,qualifiedName,doctype)" method for a 
#    DOMImplementation should raise WRONG_DOCUMENT_ERR DOMException
#    if parameter doctype was created from a different implementation.
#    
#    Invoke method createDocument(namespaceURI,qualifiedName,doctype) on
#    a domimplementation that is different from this domimplementation.
#    Doctype is the type of this document.
#    Method should raise WRONG_DOCUMENT_ERR DOMException.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#xpointer(id('ID-258A00AF')/constant[@name='WRONG_DOCUMENT_ERR'])]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#Level-2-Core-DOM-createDocument]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#xpointer(id('Level-2-Core-DOM-createDocument')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='WRONG_DOCUMENT_ERR'])]
##
DOMTestCase('createDocument04') do

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
    preload(contentType, "staffNS", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_createDocument04
    namespaceURI = "http://www.ecommerce.org/schema";
    qualifiedName = "namespaceURI:x";
    doc = nil
    docType = nil
    domImpl = nil
    aNewDoc = nil
    doc = load_document("staffNS", false)
      aNewDoc = load_document("staffNS", false)
      docType = doc.doctype()
      domImpl = aNewDoc.getImplementation()
      
    begin
      success = false;
      begin
        aNewDoc = domImpl.createDocument(namespaceURI, qualifiedName, docType)
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
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/createDocument04"
  end
end

