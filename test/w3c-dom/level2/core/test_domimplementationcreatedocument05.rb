
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
#  The createDocument method should throw a NAMESPACE_ERR if the qualifiedName has 
#  a prefix that is xml and the namespaceURI is different from 
#  http://www..w3.org/XML/1998/namespace.
#  
#  Call the createDocument on this DOMImplementation with namespaceURI that is 
#  http://www.w3.org/xml/1998/namespace and a qualifiedName that has the prefix xml
#  Check if the NAMESPACE_ERR is thrown.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#Level-2-Core-DOM-createDocument]
##
DOMTestCase('domimplementationcreatedocument05') do

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
  def test_domimplementationcreatedocument05
    doc = nil
    domImpl = nil
    newDoc = nil
    namespaceURI = "http://www.w3.org/xml/1998/namespace";
    qualifiedName = "xml:root";
    docType = nil;

    doc = load_document("staffNS", false)
      domImpl = doc.getImplementation()
      
    begin
      success = false;
      begin
        newDoc = domImpl.createDocument(namespaceURI, qualifiedName, docType)
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::NAMESPACE_ERR)
      end 
      assert(success, "domimplementationcreatedocument05")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/domimplementationcreatedocument05"
  end
end

