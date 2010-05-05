
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
#     The insertRow() method throws a INDEX_SIZE_ERR DOMException
#     if the specified index is greater than the number of rows. 
#  
#     Retrieve the second TABLE element which has four rows.  Try
#     to insert a new row using an index of five.  This should throw
#     a INDEX_SIZE_ERR DOMException since there are only four rows.
# @author NIST
# @author Rick Rivello
# see[http://www.w3.org/TR/DOM-Level-2-HTML/html#ID-39872903]
# see[http://www.w3.org/TR/DOM-Level-2-HTML/html#xpointer(id('ID-39872903')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='INDEX_SIZE_ERR'])]
##
DOMTestCase('HTMLTableElement34') do

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
  def test_HTMLTableElement34
    nodeList = nil
    testNode = nil
    newRow = nil
    doc = nil
    doc = load_document("table", true)
      nodeList = doc.getElementsByTagName("table")
      assertSize("Asize", 3, nodeList)
      testNode = nodeList.item(1)
      
    begin
      success = false;
      begin
        newRow = testNode.insertRow(5)
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::INDEX_SIZE_ERR)
      end 
      assert(success, "HTMLTableElement34")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/HTMLTableElement34"
  end
end

