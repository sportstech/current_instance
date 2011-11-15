require 'minitest/autorun'
require File.join(File.dirname(__FILE__), '..' , 'lib', 'current_instance')
require File.join(File.dirname(__FILE__), 'user')



describe "A User class that includes CurrentInstance" do
  before do
    @user = User.new({:id => 1, :other => "something"})    
  end
  
  it '@@current_name = :current_user' do
    User.current_name.must_equal :current_user
  end
  
  it '@@current_name_id = :current_user_id' do
    User.current_name_id.must_equal :current_user_id
  end
  
  it 'has a current_name class attr' do
    User.must_respond_to :current_name
    User.must_respond_to :current_name=
  end
  
  it 'has a current_name_id class attr' do
    User.must_respond_to :current_name_id
    User.must_respond_to :current_name_id=
  end
  
  

  describe "#current" do
    it 'exists' do
      User.must_respond_to :current
    end
    it 'can be set' do
      User.current = @user
      User.current.must_equal @user
    end
    it 'sets current_id as well' do
      User.current = @user
      User.current_id.must_equal @user.id
    end
  end

  describe "#current_id" do
    it 'exists' do
      User.must_respond_to :current_id
    end
    it 'can be set' do
      User.current_id = @user.id
      User.current_id.must_equal @user.id
    end
    it 'does not set current' do
      User.current_id = @user.id
      User.current.wont_equal @user
    end
  end
  

end