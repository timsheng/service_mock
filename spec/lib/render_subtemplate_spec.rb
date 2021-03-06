require 'spec_helper'
require 'service_mock/render_subtemplate'

describe ::ServiceMock::RenderSubTemplate do
  it 'reads a file and provides the contents to erb' do
    expect(File).to receive(:read).and_return "<%= foo %>"
    object = OpenStruct.new('foo' => 'bar')
    object.extend ::ServiceMock::RenderSubTemplate
    output = object.render('/foo/bar')
    expect(output).to eql 'bar'
  end
end