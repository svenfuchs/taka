
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
#  The method setNamedItemNS adds a node using its namespaceURI and localName and 
#  raises a NO_MODIFICATION_ALLOWED_ERR if this map is readonly.
#  
#  Create a new attribute node and attempt to add it to the nodemap of entities and notations
#  for this documenttype.  This should reaise a NO_MODIFICATION_ALLOWED_ERR.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-setNamedItemNS]
##
DOMTestCase('namednodemapsetnameditemns09') do

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
  def test_namednodemapsetnameditemns09
    doc = nil
    docType = nil
    entities = nil
    notations = nil
    attr = nil
    newNode = nil
    doc = load_document("staffNS", true)
      docType = doc.doctype()
      entities = docType.entities()
      notations = docType.notations()
      attr = doc.createAttributeNS("http://www.w3.org/DOM/Test", "test")
      
    begin
      success = false;
      begin
        newNode = entities.setNamedItemNS(attr)
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::NO_MODIFICATION_ALLOWED_ERR)
      end 
      assert(success, "throw_NO_MODIFICATION_ALLOWED_ERR_entities")
    end

    begin
      success = false;
      begin
        newNode = notations.setNamedItemNS(attr)
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::NO_MODIFICATION_ALLOWED_ERR)
      end 
      assert(success, "throw_NO_MODIFICATION_ALLOWED_ERR_notations")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/namednodemapsetnameditemns09"
  end
end

