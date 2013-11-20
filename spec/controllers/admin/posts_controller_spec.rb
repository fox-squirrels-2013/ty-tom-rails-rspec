require 'spec_helper'

describe Admin::PostsController do
  let(:post_params) { {title: "Wow, such post!", content: "Yay I like post"} }

  describe "admin panel" do
    it "#index" do
      get :index
      response.status.should eq 200
    end

    it "#new" do
      get :new
      response.status.should eq 200
      expect(assigns(:post)).to be_a_new(Post)
    end

    context "#create" do

      

      it "creates a post with valid params" do
        post :create, post: post_params
        response.status.should eq 302
        expect(assigns(:post).title).to eq "Wow, Such Post!"
      end

      it "doesn't create a post when params are invalid" do
        post :create, post: {title: "Wow, such post!"}
        response.status.should eq 200
        expect(assigns(:post).errors.messages).to_not be_empty
      end
    end

    context '#edit' do
      it "should load the post edit page" do
        post_ob = Post.create(post_params)
        get :edit, id: post_ob.id
        response.status.should eq 200
        expect(assigns(:post)).to be_an_instance_of(Post)
      end
    end

    context "#update" do
      it "updates a post with valid params" do
        post_ob = Post.create(post_params)
        put :update, id: post_ob.id, post: { title: "No such post!" }
        expect(assigns(:post).title).to eq "No Such Post!"
      end
      it "doesn't update a post when params are invalid" do
        post_ob = Post.create(post_params)
        put :update, id: post_ob.id, post: { title: nil }
        expect(assigns(:post).errors.messages).to_not be_empty
        response.status.should eq 200
      end
    end

    it "#destroy" do
        post_ob = Post.create(post_params)
        p '*' * 20
        p post_ob.id
        put :destroy, id: post_ob.id
        response.status.should eq 302
        # expect( Post.where('title = ?', "Wow, such post!") ).to be_empty   
    end
  end
end
