
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
#     Retrieve the textual data from the last child of the 
#     second employee.   That node is composed of two   
#     EntityReference nodes and two Text nodes.   After
#     the content node is parsed, the "acronym" Element
#     should contain four children with each one of the
#     EntityReferences containing one child.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1451460987]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-11C98490]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-745549614]
##
DOMTestCase('hc_textparseintolistofelements') do

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
    preload(contentType, "hc_staff", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_textparseintolistofelements
    doc = nil
    elementList = nil
    addressNode = nil
    childList = nil
    child = nil
    value = nil
    grandChild = nil
    length = nil
    result = []
      
    expectedNormal = []
      expectedNormal << "β"
      expectedNormal << " Dallas, "
      expectedNormal << "γ"
      expectedNormal << "\n 98554"
      
    expectedExpanded = []
      expectedExpanded << "β Dallas, γ\n 98554"
      
    doc = load_document("hc_staff", false)
      elementList = doc.getElementsByTagName("acronym")
      addressNode = elementList.item(1)
      childList = addressNode.childNodes()
      length = childList.length()
      indexid4900025 = 0
    while (indexid4900025 < childList.length)
      child = childList.item(indexid4900025)
    value = child.nodeValue()
      
      if ((value == nil))
        grandChild = child.firstChild()
      assert_not_nil(grandChild, "grandChildNotNull")
      value = grandChild.nodeValue()
      result << value
      
          else
            result << value
      
         end
       indexid4900025 += 1
            end
      
      if (equals(1, length))
        assert_equal(expectedExpanded, result, "assertEqCoalescing")
            
          else
            assert_equal(expectedNormal, result, "assertEqNormal")
            
         end
       
  end if solved?(:nokogiri_entity_resolve_bug)

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_textparseintolistofelements"
  end
end

