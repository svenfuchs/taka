
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
#     The "getNodeType()" method for an Entity Node
#     returns the constant value 6.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-111237558]
##
DOMTestCase('nodeentitynodetype') do

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
  def test_nodeentitynodetype
    doc = nil
    docType = nil
    entities = nil
    entityNode = nil
    nodeType = nil
    doc = load_document("staff", false)
      docType = doc.doctype()
      assert_not_nil(docType, "docTypeNotNull")
      entities = docType.entities()
      assert_not_nil(entities, "entitiesNotNull")
      entityNode = entities.getNamedItem("ent1")
      assert_not_nil(entityNode, "ent1NotNull")
      nodeType = entityNode.nodeType()
      assert_equal(6, nodeType, "entityNodeType")
            
  end if nokogiri_entity_resolve_bug_solved?

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/nodeentitynodetype"
  end
end

