
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
#     The "feature" parameter in the
#     isSupported(feature,version)" method is the name
#     of the feature and the version is the version number of the
#     feature to test.   CORE is a legal value for the feature parameter
#     (Test for CORE, upper case). 
#     Legal values for the version parameter are 1.0 and 2.0
#     (Test for 2.0).
#     
#     Retrieve the root node of the DOM document by invoking 
#     the "getDocumentElement()" method.   This should create a
#     node object on which the "isSupported(feature,version)"
#     method is invoked with "feature" equal to "CORE" and the version equal to 2.0.
#     The method should return a boolean "true".
# @author NIST
# @author Mary Brady
# see[http://www.w3.org/TR/DOM-Level-2-Core/core#Level-2-Core-Node-supports]
##
DOMTestCase('isSupported10') do

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
  def test_isSupported10
    doc = nil
    rootNode = nil
    state = nil
    doc = load_document("staff", false)
      rootNode = doc.documentElement()
      state = rootNode.isSupported("CORE", "2.0")
      assertTrue("throw_True", state)
      
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/isSupported10"
  end
end

