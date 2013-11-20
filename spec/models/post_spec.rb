require 'spec_helper'

describe Post do

  let (:post) do
    Post.new :title => "Wow, such post!", 
             :content => "Woo, I like post"
  end

  it "title should be automatically titleized before save" do
    post.save
    expect(post.title).to eq "Wow, Such Post!"
  end

  it "post should be unpublished by default" do
    expect(post.is_published?).to eq false
  end

  # a slug is an automaticaly generated url-friendly
  # version of the title
  it "slug should be automatically generated" do
    post.slug.should be_nil
    post.save

    post.slug.should eq "new-post"
  end
end
