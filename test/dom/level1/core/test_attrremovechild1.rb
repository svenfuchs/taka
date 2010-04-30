
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
# Removing a child node from an attribute in an entity reference
# should result in an NO_MODIFICATION_ALLOWED_ERR DOMException.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1734834066]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#xpointer(id('ID-1734834066')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='NO_MODIFICATION_ALLOWED_ERR'])]
##
DOMTestCase('attrremovechild1') do

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
    preload(contentType, "staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_attrremovechild1
    doc = nil
    entRef = nil
    entElement = nil
    attrNode = nil
    textNode = nil
    removedNode = nil
    doc = load_document("staff", true)
      entRef = doc.createEntityReference("ent4")
      assert_not_nil(entRef, "createdEntRefNotNull")
      entElement = entRef.firstChild()
      assert_not_nil(entElement, "entElementNotNull")
      attrNode = entElement.getAttributeNode("domestic")
      textNode = attrNode.firstChild()
      assert_not_nil(textNode, "attrChildNotNull")

    begin
      success = false;
      begin
        removedNode = attrNode.removeChild(textNode)
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::NO_MODIFICATION_ALLOWED_ERR)
      end
      assert(success, "setValue_throws_NO_MODIFICATION_ERR")
    end

  end if nokogiri_entity_resolve_bug_solved?

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/attrremovechild1"
  end
end

