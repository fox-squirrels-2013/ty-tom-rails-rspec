require 'spec_helper'

describe Post do
  it "title should be automatically titleized before save" do
    post = Post.new
    post.title = "Wow, such post!"
    post.content = "Woo, I like post"
    post.save
    expect(post.title).to eq "Wow, Such Post!"
  end

  it "title should be automatically titleized before save" do
    post = Post.new
    post.title = "Wow, such post!"
    post.content = "Woo, I like post"
    expect(post.title).to eq "Wow, such post!"
  end

  it "post should be unpublished by default" do
    pending
  end

  # a slug is an automaticaly generated url-friendly
  # version of the title
  it "slug should be automatically generated" do
    post = Post.new
    post.title   = "New post!"
    post.content = "A great story"
    post.slug.should be_nil
    post.save

    post.slug.should eq "new-post"
  end
end
