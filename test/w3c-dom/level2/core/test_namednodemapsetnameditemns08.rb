
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
#     raises a INUSE_ATTRIBUTE_ERR Raised if arg is an Attr that is already an 
#     attribute of another Element object. 
#  Retreieve the first element whose localName is address and its attributes into a named node map.
#  Retreiving the domestic attribute from the namednodemap.  Retreieve the second element whose 
#  localName is address and its attributes into a named node map. Invoke setNamedItemNS on the 
#  second NamedNodeMap specifying the attribute from the first map.  
#  This should raise an INUSE_ATTRIBIUTE_ERR.
# @author IBM
# @author Neil Delima
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-setNamedItemNS]
##
DOMTestCase('namednodemapsetnameditemns08') do

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
  def test_namednodemapsetnameditemns08
    doc = nil
    attributes = nil
    elementList = nil
    element = nil
    attr = nil
    newNode = nil
    doc = load_document("staffNS", true)
      elementList = doc.getElementsByTagNameNS("*", "address")
      element = elementList.item(0)
      attributes = element.attributes()
      attr = attributes.getNamedItemNS("http://www.usa.com", "domestic")
      element = elementList.item(1)
      attributes = element.attributes()
      
    begin
      success = false;
      begin
        newNode = attributes.setNamedItemNS(attr)
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::INUSE_ATTRIBUTE_ERR)
      end 
      assert(success, "namednodemapsetnameditemns08")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/namednodemapsetnameditemns08"
  end
end

