
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
#  The method setAttributeNodeNS Adds a new attribute and raises an WRONG_DOCUMENT_ERR if this node 
#  is readonly.
#  Attempt to add an attribute node to an element node which is part of the replacement text of 
#  a read-only EntityReference node.
#  Check if a NO_MODIFICATION_ALLOWED_ERR is thrown.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-ElSetAtNodeNS]
##
DOMTestCase('elementsetattributenodens06') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
=begin
      org.w3c.domts.DocumentBuilderSetting[] settings = 
          new org.w3c.domts.DocumentBuilderSetting[] {
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
  def test_elementsetattributenodens06
    doc = nil
    element = nil
    attribute = nil
    attribute2 = nil
    entRef = nil
    elementList = nil
    newAttribute = nil
    newChild = nil
    doc = load_document("staffNS", true)
      element = doc.createElementNS("http://www.w3.org/DOM/Test", "elem1")
      attribute = doc.createAttributeNS("http://www.w3.org/DOM/Test", "attr")
      entRef = doc.createEntityReference("ent4")
      newChild = attribute.appendChild(entRef)
      newAttribute = element.setAttributeNodeNS(attribute)
      elementList = entRef.childNodes()
      element = elementList.item(0)
      attribute2 = doc.createAttributeNS("http://www.w3.org/DOM/Test", "attr2")
      
    begin
      success = false;
      begin
        newAttribute = element.setAttributeNodeNS(attribute2)
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::NO_MODIFICATION_ALLOWED_ERR)
      end 
      assert(success, "elementsetattributenodens06")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/elementsetattributenodens06"
  end
end
