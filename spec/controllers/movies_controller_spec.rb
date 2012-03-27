require 'spec_helper'

describe MoviesController do

describe 'showing the detail of the movie' do
  it 'should call find in Movie' do
    Movie.should_receive(:find).with("1").and_return(mock('Movie'))
    get :show, :id => "1"
  end
end

describe 'showing all movies' do
  it 'should call all_ratings in Movie' do
    Movie.should_receive(:all_ratings)
    get :index
  end
end

describe 'showing new page' do
  it 'should render new template' do
    get :new
    response.should render_template('new')
  end
end

describe 'creating movie' do
  it 'should redirect to home page' do
    get :create, :movie => {}
    response.should redirect_to(movies_path)
  end
end

describe 'editing movie' do
  it 'should call find in the Movie' do
    Movie.should_receive(:find)
    get :edit, :id => '1'
  end
end

describe 'updating movie' do
  it 'should call find in Movie' do
    m=mock('Movie')
    m.stub(:update_attributes!).with({})
    m.stub(:title).and_return('')
    Movie.should_receive(:find).with("1").and_return(m)
    put :update, :id => '1', :movie => {}
  end
end

describe 'destroying movie' do
  it 'should call find in Movie' do
    m=mock('Movie')
    m.stub(:destroy)
    m.stub(:title).and_return('')
    Movie.should_receive(:find).and_return(m)
    get :destroy, :id => '1'
  end
end

describe 'same movie director' do
  it 'should call find in Movie when the director is known' do
    m=mock('Movie')
    m.stub(:director).and_return('Steven Spielberg')
    m.stub(:same_director).and_return([m])
    Movie.should_receive(:find).with("1").and_return(m)
    get :same_director, :id => '1'
  end
  it 'should call find in Movie when the director is unknown' do
    m=mock('Movie')
    m.stub(:director).and_return('')
    m.stub(:title).and_return('Aladdin')
    Movie.should_receive(:find).with("1").and_return(m)
    get :same_director, :id => '1'
  end

end

end
