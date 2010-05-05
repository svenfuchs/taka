
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
#  The method getOwnerDocument returns the Document object associated with this node
#   
#  Create a new Document node.  Since this node is not used with any Document yet
#  verify if the ownerDocument is null.  Create a new element Node on the new Document
#  object.  Check the ownerDocument of the new element node.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#node-ownerDoc]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=259]
##
DOMTestCase('nodegetownerdocument02') do

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
    preload(contentType, "staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_nodegetownerdocument02
    doc = nil
    newDoc = nil
    newElem = nil
    ownerDocDoc = nil
    ownerDocElem = nil
    domImpl = nil
    docType = nil
    nullNS = nil;

    doc = load_document("staff", false)
      domImpl = doc.getImplementation()
      docType = domImpl.createDocumentType("mydoc", nullNS, nullNS)
      newDoc = domImpl.createDocument("http://www.w3.org/DOM/Test", "mydoc", docType)
      ownerDocDoc = newDoc.ownerDocument()
      assert_nil(ownerDocDoc, "nodegetownerdocument02_1")
      newElem = newDoc.createElementNS("http://www.w3.org/DOM/Test", "myelem")
      ownerDocElem = newElem.ownerDocument()
      assert_not_nil(ownerDocElem, "nodegetownerdocument02_2")
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/nodegetownerdocument02"
  end
end

