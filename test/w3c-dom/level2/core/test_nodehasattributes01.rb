
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin


Copyright (c) 2001-2004 World Wide Web Consortium, 
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
#  The method hasAttributes returns whether this node (if it is an element) has any attributes.
#  Retreive an element node without attributes.  Verify if hasAttributes returns false.
#  Retreive another element node with attributes.  Verify if hasAttributes returns true. 
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-NodeHasAttrs]
##
DOMTestCase('nodehasattributes01') do

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
  def test_nodehasattributes01
    doc = nil
    element = nil
    elementList = nil
    hasAttributes = nil
    doc = load_document("staff", false)
      elementList = doc.getElementsByTagName("employeeId")
      element = elementList.item(0)
      hasAttributes = element.hasAttributes()
      assertFalse("employeeIdHasAttributesFalse", hasAttributes)
elementList = doc.getElementsByTagName("address")
      element = elementList.item(0)
      hasAttributes = element.hasAttributes()
      assertTrue("addressHasAttributesTrue", hasAttributes)
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/nodehasattributes01"
  end
end

