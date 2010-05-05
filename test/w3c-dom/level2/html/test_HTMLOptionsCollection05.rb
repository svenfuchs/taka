
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
#     An HTMLOptionsCollection is a list of nodes representing HTML option
#     element.
#     An individual node may be accessed by either ordinal index, the node's
#     name or id attributes.  (Test node name).
#     The namedItem method retrieves a Node using a name.  It first searches
#     for a node with a matching id attribute.  If it doesn't find one, it
#     then searches for a Node with a matching name attribute, but only
#     those elements that are allowed a name attribute.  Upon failure(e.q., no
#     node with this name exists), returns null.
#     Retrieve the first FORM element.  Create a HTMLCollection of the elements.
#     Search for an element that has select9 as the value for the name attribute.
#     Null should be returned since there is not any name or id attribute with
#     select9 as a value.
# @author NIST
# @author Rick Rivello
# see[http://www.w3.org/TR/DOM-Level-2-HTML/html#HTMLOptionsCollection-namedItem]
##
DOMTestCase('HTMLOptionsCollection05') do

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
    preload(contentType, "optionscollection", false)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_HTMLOptionsCollection05
    nodeList = nil
    testNode = nil
    optionsNode = nil
    formsnodeList = nil
    vname = nil
    doc = nil
    doc = load_document("optionscollection", false)
      nodeList = doc.getElementsByTagName("form")
      assertSize("Asize", 1, nodeList)
      testNode = nodeList.item(0)
      formsnodeList = testNode.elements()
      optionsNode = formsnodeList.namedItem("select9")
      assert_nil(optionsNode, "nameIndexLink")
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/HTMLOptionsCollection05"
  end
end

