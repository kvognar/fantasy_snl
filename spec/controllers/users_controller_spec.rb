require 'spec_helper'

describe UsersController do

  before(:each) do
    @user = create(:user, password: "widdershins")
    controller.stub(:current_user) { @user }
  end

  describe '#show' do
    it "loads the desired user" do
      get :show, id: @user.id
      expect(assigns(:user)).to eq(@user)
      response.should render_template("show")
    end
  end

  describe '#edit' do
    it "loads the user edit page" do
      get :edit, id: @user.id
      expect(assigns(:user)).to eq(@user)
      response.should render_template("edit")
    end
  end

  describe '#update' do
    it 'updates the user password' do
      patch :update, id: 1, user: { old_password: "widdershins",
                             new_password: "winter winds",
                             confirm_password: "winter winds"
                            }
      expect(@user.reload.is_password?("winter winds")).to be_true
    end
    it 'does not update if the password is wrong' do
      patch :update, id: 1, user: { old_password: "clockwise",
                                    new_password: "winter winds",
                                    confirm_password: "winter winds"
                                  }
      expect(@user.reload.is_password?("winter winds")).to be_false
    end
    it "does not update if the passwords confirm doesn't match" do
      patch :update, id: 1, user: { old_password: "widdershins",
                                    new_password: "winter winds",
                                    confirm_password: "wilder winds"
                                  }
      expect(@user.reload.is_password?("winter winds")).to be_false
      expect(@user.is_password?("widdershins")).to be_true
    end
    it "requires a password of minimum length 6" do
      patch :update, id: 1, user: { old_password: "widdershins",
                                    new_password: "winds",
                                    confirm_password: "winds"
                                  }
      expect(@user.reload.is_password?("winds")).to be_false
      expect(@user.is_password?("widdershins")).to be_true
    end
  end

end
