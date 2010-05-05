
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

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'w3c_helper'))

###
#   Retrieve the attribute named class from the last 
#   child of of the second "p" element and examine its 
#   NodeName.
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-F68D095]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1112119403]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=236]
# see[http://lists.w3.org/Archives/Public/www-dom-ts/2003Jun/0011.html]
##
DOMTestCase('hc_attrname') do

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
  def test_hc_attrname
    doc = nil
    addressList = nil
    testNode = nil
    attributes = nil
    streetAttr = nil
    strong1 = nil
    strong2 = nil
    doc = load_document("hc_staff", false)
      addressList = doc.getElementsByTagName("acronym")
      testNode = addressList.item(1)
      attributes = testNode.attributes()
      streetAttr = attributes.getNamedItem("class")
      strong1 = streetAttr.nodeName()
      strong2 = streetAttr.name()
      assertEqualsAutoCase("attribute", "nodeName", "class", strong1)
        assertEqualsAutoCase("attribute", "name", "class", strong2)
        
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_attrname"
  end
end
