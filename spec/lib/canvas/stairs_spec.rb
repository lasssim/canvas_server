module Canvas
  describe Stairs do
    subject { described_class.new }

    its(:pixels) do
      expected_hash = {}
      109.times { |i| expected_hash[[0, i]] = a_kind_of(Pixel) }
       98.times { |i| expected_hash[[1, i]] = a_kind_of(Pixel) }


      is_expected.to include(expected_hash)
    end
  end
end
