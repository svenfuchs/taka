
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
#     The "setPrefix(prefix)" method raises a 
#     INVALID_CHARACTER_ERR DOMException if the specified
#     prefix contains an illegal character.
#     
#     Attempt to insert a new namespace prefix on the first employee node.
#     An exception should be raised since the namespace prefix has an invalid 
#     character.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#xpointer(id('ID-258A00AF')/constant[@name='INVALID_CHARACTER_ERR'])]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-NodeNSPrefix]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#xpointer(id('ID-NodeNSPrefix')/setraises/exception[@name='DOMException']/descr/p[substring-before(.,':')='INVALID_CHARACTER_ERR'])]
##
DOMTestCase('prefix06') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
=begin
      org.w3c.domts.DocumentBuilderSetting[] settings = 
          new org.w3c.domts.DocumentBuilderSetting[] {
org.w3c.domts.DocumentBuilderSetting.namespaceAware
        };
        DOMTestDocumentBuilderFactory testFactory = factory.newInstance(settings)
        setFactory(testFactory)
=end

    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "staffNS", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_prefix06
    doc = nil
    elementList = nil
    employeeNode = nil
    doc = load_document("staffNS", true)
      elementList = doc.getElementsByTagName("employee")
      employeeNode = elementList.item(0)
      
    begin
      success = false;
      begin
        employeeNode.prefix = "pre^fix xmlns='http//www.nist.gov'"
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::INVALID_CHARACTER_ERR)
      end 
      assert(success, "throw_INVALID_CHARACTER_ERR")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/prefix06"
  end
end

