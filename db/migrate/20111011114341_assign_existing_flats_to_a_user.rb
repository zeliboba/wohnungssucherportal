class AssignExistingFlatsToAUser < ActiveRecord::Migration
  def up
    user = User.create!(:email => 'katarzyna.saja@gmail.com', :password => 'password')
    Flat.update_all("user_id=#{user.id}")
    FavoritePlace.update_all("user_id=#{user.id}")
  end

  def down
    # existing flats should not be deleted, so using delete (it does not run the callbacks)
    user = User.find_by_email('katarzyna.saja@gmail.com')
    User.delete(user.id)
  end
end
