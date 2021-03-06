
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001 World Wide Web Consortium,
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

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'w3c_helper'))

###
#     The "cloneNode(deep)" method does not copy text unless it
#     is deep cloned.(Test for deep=false)
#     
#     Retrieve the fourth child of the second employee and
#     the "cloneNode(deep)" method with deep=false.   The
#     duplicate node returned by the method should not copy
#     any text data contained in this node.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-3A0ED0A4]
##
DOMTestCase('nodeclonefalsenocopytext') do

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
  def test_nodeclonefalsenocopytext
    doc = nil
    elementList = nil
    employeeNode = nil
    childList = nil
    childNode = nil
    clonedNode = nil
    lastChildNode = nil
    doc = load_document("staff", true)
      elementList = doc.getElementsByTagName("employee")
      employeeNode = elementList.item(1)
      childList = employeeNode.childNodes()
      childNode = childList.item(3)
      clonedNode = childNode.cloneNode(false)
      lastChildNode = clonedNode.lastChild()
      assert_nil(lastChildNode, "noTextNodes")
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/nodeclonefalsenocopytext"
  end
end

