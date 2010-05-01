
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
# Add an empty text node to an existing attribute node, normalize the containing element
# and check that the attribute node has eliminated the empty text.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-162CF083]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=482]
##
DOMTestCase('hc_elementnormalize2') do

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
    preload(contentType, "hc_staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_elementnormalize2
    doc = nil
    root = nil
    elementList = nil
    element = nil
    firstChild = nil
    secondChild = nil
    childValue = nil
    emptyText = nil
    attrNode = nil
    retval = nil
    doc = load_document("hc_staff", true)
      root = doc.documentElement()
      emptyText = doc.createTextNode("")
      elementList = root.getElementsByTagName("acronym")
      element = elementList.item(0)
      attrNode = element.getAttributeNode("title")
      retval = attrNode.appendChild(emptyText)
      element.normalize()
      attrNode = element.getAttributeNode("title")
      firstChild = attrNode.firstChild()
      childValue = firstChild.nodeValue()
      assert_equal("Yes", childValue, "firstChild")
            secondChild = firstChild.nextSibling()
      assert_nil(secondChild, "secondChildNull")
      
  end if solved?(:node_normalize_not_implemented)

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_elementnormalize2"
  end
end

