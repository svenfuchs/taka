
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
#     The deleteRow() method deletes a table row.  If the index is -1
#     the last row of the table is deleted. 
#     
#     Retrieve the second TABLE element and invoke the deleteRow() method
#     with an index of negative one. Currently there are four rows in the  
#     table.  The deleteRow() method is called and now there should be three.
# @author NIST
# @author Rick Rivello
# see[http://www.w3.org/TR/DOM-Level-2-HTML/html#ID-13114938]
##
DOMTestCase('HTMLTableElement40') do

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
    preload(contentType, "table", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_HTMLTableElement40
    nodeList = nil
    testNode = nil
    rowsnodeList = nil
    vrows = nil
    doc = nil
    doc = load_document("table", true)
      nodeList = doc.getElementsByTagName("table")
      assertSize("Asize", 3, nodeList)
      testNode = nodeList.item(1)
      rowsnodeList = testNode.rows()
      vrows = rowsnodeList.length()
      assert_equal(4, vrows, "rowsLink1")
            testNode.deleteRow(-1)
      rowsnodeList = testNode.rows()
      vrows = rowsnodeList.length()
      assert_equal(3, vrows, "rowsLink2")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/HTMLTableElement40"
  end
end

