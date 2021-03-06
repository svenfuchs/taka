
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2004 World Wide Web Consortium,
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

require File.expand_path('../../../../w3c_helper', __FILE__)

###
# Create a document fragment with an empty text node, after normalization there should be no child nodes.
# were combined.
# @author Curt Arnold
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-F68D095]
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#ID-B63ED1A3]
##
DOMTestCase('hc_nodedocumentfragmentnormalize2') do

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
  def test_hc_nodedocumentfragmentnormalize2
    doc = nil
    docFragment = nil
    nodeValue = nil
    txtNode = nil
    retval = nil
    doc = load_document("hc_staff", true)
      docFragment = doc.createDocumentFragment()
      txtNode = doc.createTextNode("")
      retval = docFragment.appendChild(txtNode)
      docFragment.normalize()
      txtNode = docFragment.firstChild()
      assert_nil(txtNode, "noChild")
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_nodedocumentfragmentnormalize2"
  end
end

