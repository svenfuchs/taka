
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001-2004 World Wide Web Consortium,
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University). All
Rights Reserved. This program is distributed under the W3C's Software
Intellectual Property License. This program is distributed in the
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
See W3C License http://www.w3.org/Consortium/Legal/ for more details.

=end
#

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'helper'))

###
#     The "getEntities()" method is a NamedNodeMap that contains
#    the general entities for this document. 
#    
#    Retrieve the Document Type for this document and create 
#    a NamedNodeMap of all its entities.  The entire map is
#    traversed and the names of the entities are retrieved.
#    There should be 5 entities.  Duplicates should be ignored.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1788794630]
##
DOMTestCase('documenttypegetentities') do

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
    preload(contentType, "staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_documenttypegetentities
    doc = nil
    docType = nil
    entityList = nil
    name = nil
    expectedResult = []
      expectedResult << "ent1"
      expectedResult << "ent2"
      expectedResult << "ent3"
      expectedResult << "ent4"
      expectedResult << "ent5"
      
    expectedResultSVG = []
      expectedResultSVG << "ent1"
      expectedResultSVG << "ent2"
      expectedResultSVG << "ent3"
      expectedResultSVG << "ent4"
      expectedResultSVG << "ent5"
      expectedResultSVG << "svgunit"
      expectedResultSVG << "svgtest"
      
    nameList = []
      
    entity = nil
    doc = load_document("staff", false)
      docType = doc.doctype()
      assert_not_nil(docType, "docTypeNotNull")
      entityList = docType.entities()
      assert_not_nil(entityList, "entitiesNotNull")
      indexid1404553 = 0
    while (indexid1404553 < entityList.length)
      entity = entityList.item(indexid1404553)
      name = entity.nodeName()
      nameList << name
      indexid1404553 += 1
    end
      
      if (("image/svg+xml" == getContentType()))
        assert_equal(expectedResultSVG, nameList, "entityNamesSVG")
            
          else
            
# <["ent1", "ent2", "ent3", "ent4", "ent5"]> expected but was
# <["ent4", "ent5", "ent1", "ent2", "ent3"]>.

# so apparently there's a Hash involved which should be sorted?
            
            assert_equal(expectedResult, nameList, "entityNames")
            
         end
       
  end if solved?(:nokogiri_ordered_hashes)

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/documenttypegetentities"
  end
end

