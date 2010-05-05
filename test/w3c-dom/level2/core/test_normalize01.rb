
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
#     The "normalize()" method puts all the nodes in the full
#     depth of the sub-tree underneath this element into a 
#     "normal" form. 
#     
#     Retrieve the third employee and access its second child.
#     This child contains a block of text that is spread 
#     across multiple lines.   The content of the "name" child
#     should be parsed and treated as a single Text node.
#     This appears to be a duplicate of elementnormalize.xml in DOM L1 Test Suite
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-normalize]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-72AB8359]
##
DOMTestCase('normalize01') do

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
  def test_normalize01
    doc = nil
    root = nil
    elementList = nil
    firstChild = nil
    textList = nil
    textNode = nil
    data = nil
    doc = load_document("staff", false)
      root = doc.documentElement()
      root.normalize()
      elementList = root.getElementsByTagName("name")
      firstChild = elementList.item(2)
      textList = firstChild.childNodes()
      textNode = textList.item(0)
      data = textNode.data()
      assert_equal("Roger\n Jones", data, "data")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/normalize01"
  end
end

