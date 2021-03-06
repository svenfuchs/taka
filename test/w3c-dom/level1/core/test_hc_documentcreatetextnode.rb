
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
#     The "createTextNode(data)" method creates a Text node 
#    given the specfied string.
#    Retrieve the entire DOM document and invoke its 
#    "createTextNode(data)" method.  It should create a 
#    new Text node whose "data" is the specified string.
#    The NodeName and NodeType are also checked.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1975348127]
##
DOMTestCase('hc_documentcreatetextnode') do

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
  def test_hc_documentcreatetextnode
    doc = nil
    newTextNode = nil
    newTextName = nil
    newTextValue = nil
    newTextType = nil
    doc = load_document("hc_staff", true)
      newTextNode = doc.createTextNode("This is a new Text node")
      newTextValue = newTextNode.nodeValue()
      assert_equal("This is a new Text node", newTextValue, "value")
            newTextName = newTextNode.nodeName()
      assert_equal("#text", newTextName, "strong")
            newTextType = newTextNode.nodeType()
      assert_equal(3, newTextType, "type")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_documentcreatetextnode"
  end
end

