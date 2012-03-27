require 'spec_helper'

describe Movie do

describe 'get all ratings' do
  it 'return all ratings ' do
     assert Movie.all_ratings == [ 'G', 'PG' , 'PG-13', 'NC-17', 'R' ]
  end
end

describe 'get movie with the same director' do
  it 'should call where in Movie' do
     Movie.should_receive(:where)
     Movie.new.same_director
  end
end

end
