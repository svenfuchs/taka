
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
#     The "setAttributeNS(namespaceURI,qualifiedName,value)" method for an attribute causes the 
#    DOMException NO_MODIFICATION_ALLOWED_ERR to be raised
#    if the node is readonly.
#    
#    Obtain the children of the THIRD "gender" element.  The elements
#    content is an entity reference.  Try to set an attribute
#    in the entity reference by executing the 
#    "setAttributeNS(namespaceURI,qualifiedName,value)" method.
#    This causes a NO_MODIFICATION_ALLOWED_ERR DOMException to be thrown.
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#xpointer(id('ID-258A00AF')/constant[@name='NO_MODIFICATION_ALLOWED_ERR'])]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-ElSetAttrNS]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#xpointer(id('ID-ElSetAttrNS')/raises/exception[@name='DOMException']/descr/p[substring-before(.,':')='NO_MODIFICATION_ALLOWED_ERR'])]
##
DOMTestCase('setAttributeNS03') do

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
    preload(contentType, "staffNS", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_setAttributeNS03
    namespaceURI = "www.xyz.com";
    qualifiedName = "emp:local1";
    doc = nil
    genderList = nil
    gender = nil
    genList = nil
    gen = nil
    gList = nil
    genElement = nil
    nodeType = nil
    doc = load_document("staffNS", true)
      genderList = doc.getElementsByTagName("gender")
      gender = genderList.item(2)
      genList = gender.childNodes()
      gen = genList.item(0)
      nodeType = gen.nodeType()
      
      if (equals(1, nodeType))
        gen = doc.createEntityReference("ent4")
      assert_not_nil(gen, "createdEntRefNotNull")
      
         end
       gList = gen.childNodes()
      genElement = gList.item(0)
      assert_not_nil(genElement, "notnull")
      
    begin
      success = false;
      begin
        genElement.setAttributeNS(namespaceURI, qualifiedName, "newValue")
      rescue Taka::DOMException => ex
        success = (ex.code == Taka::DOMException::NO_MODIFICATION_ALLOWED_ERR)
      end 
      assert(success, "throw_NO_MODIFICATION_ALLOWED_ERR")
    end

  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/setAttributeNS03"
  end
end

