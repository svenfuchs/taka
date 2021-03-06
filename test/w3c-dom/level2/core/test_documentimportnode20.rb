
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
#  The importNode method imports a node from another document to this document. 
#  The returned node has no parent; (parentNode is null). The source node is not 
#  altered or removed from the original document but a new copy of the source node
#  is created.
#  
#  Using the method importNode with deep=true, import a entity node ent4 
#  from this document to a new document object.  The replacement text of this entity is an element
#  node, a cdata node and a pi.  Verify if the nodes have been 
#  imported correctly by checking the nodeNames of the imported element node, the data for the
#  cdata nodes and the PItarget and PIData for the pi nodes.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#Core-Document-importNode]
##
DOMTestCase('documentimportnode20') do

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
org.w3c.domts.DocumentBuilderSetting.notExpandEntityReferences
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
  def test_documentimportnode20
    doc = nil
    docImp = nil
    domImpl = nil
    docType = nil
    docTypeNull = nil;

    nodeMap = nil
    entity4 = nil
    entityImp4 = nil
    element = nil
    cdata = nil
    pi = nil
    childList = nil
    elemchildList = nil
    ent4Name = nil
    ent4ImpName = nil
    cdataVal = nil
    piTargetVal = nil
    piDataVal = nil
    doc = load_document("staffNS", true)
      domImpl = doc.getImplementation()
      docType = doc.doctype()
      docImp = domImpl.createDocument("http://www.w3.org/DOM/Test", "a:b", docTypeNull)
      nodeMap = docType.entities()
      entity4 = nodeMap.getNamedItem("ent4")
      entityImp4 = docImp.importNode(entity4, true)
      childList = entityImp4.childNodes()
      element = childList.item(0)
      elemchildList = element.childNodes()
      cdata = elemchildList.item(0)
      pi = childList.item(1)
      ent4Name = entity4.nodeName()
      ent4ImpName = entityImp4.nodeName()
      cdataVal = cdata.data()
      piTargetVal = pi.target()
      piDataVal = pi.data()
      assert_equal(ent4Name, ent4ImpName, "documentimportnode20_Ent4NodeName")
            assert_equal("Element data", cdataVal, "documentimportnode20_Cdata")
            assert_equal("PItarget", piTargetVal, "documentimportnode20_PITarget")
            assert_equal("PIdata", piDataVal, "documentimportnode20_PIData")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/documentimportnode20"
  end
end

