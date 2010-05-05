
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
#  The importNode method imports a node from another document to this document. 
#  A NOT_SUPPORTED_ERR is raised if the type of node being imported is
#  not supported
#  
#  Using the method importNode with deep=true, try to import a newly created DOcumentType
#  node. Since DocumentType nodes cannot be imported, a NOT_SUPPORTED_ERR should be raised.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#Core-Document-importNode]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=259]
##
DOMTestCase('documentimportnode08') do

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
  def test_documentimportnode08
    doc = nil
    imported = nil
    docType = nil
    domImpl = nil
    nullNS = nil;

    doc = load_document("staffNS", true)
      domImpl = doc.getImplementation()
      docType = domImpl.createDocumentType("test:root", nullNS, nullNS)
      
    begin
      success = false;
      begin
        imported = doc.importNode(docType, true)
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::NOT_SUPPORTED_ERR)
      end 
      assert(success, "throw_NOT_SUPPORTED_ERR")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/documentimportnode08"
  end
end

