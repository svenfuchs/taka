
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
# The "getElementsByTagName(name)" method returns a list
# of all descendant Elements in the order the children
# were encountered in a pre order traversal of the element
# tree.
# Create a NodeList of all the descendant elements
# using the string "p" as the tagName.
# The method should return a NodeList whose length is
# "5" in the order the children were encountered.
# Access the FOURTH element in the NodeList.  The FOURTH
# element, the first or second should be an "em" node with
# the content "EMP0004".
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-1938918D]
# see[http://www.w3.org/Bugs/Public/show_bug.cgi?id=246]
##
DOMTestCase('hc_elementgetelementsbytagnameaccessnodelist') do

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
  def test_hc_elementgetelementsbytagnameaccessnodelist
    doc = nil
    elementList = nil
    testEmployee = nil
    firstC = nil
    childName = nil
    nodeType = nil
    employeeIDNode = nil
    employeeID = nil
    doc = load_document("hc_staff", false)
      elementList = doc.getElementsByTagName("p")
      testEmployee = elementList.item(3)
      firstC = testEmployee.firstChild()
      nodeType = firstC.nodeType()
      
    while (equals(3, nodeType))
    firstC = firstC.nextSibling()
      nodeType = firstC.nodeType()
      
    end
childName = firstC.nodeName()
      assertEqualsAutoCase("element", "childName", "em", childName)
        employeeIDNode = firstC.firstChild()
      employeeID = employeeIDNode.nodeValue()
      assert_equal("EMP0004", employeeID, "employeeID")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_elementgetelementsbytagnameaccessnodelist"
  end
end

