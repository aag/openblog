require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'less than minimum title length' do
    post = Post.new(title: 'A' * 9, body: 'test')

    assert_not post.valid?
  end

  test 'minimum title length' do
    post = Post.new(title: 'A' * 10, body: 'test')

    assert post.valid?
  end

  test 'maximum title length' do
    post = Post.new(title: 'A' * 50, body: 'test')

    assert post.valid?
  end

  test 'greater than maximum title length' do
    post = Post.new(title: 'A' * 51, body: 'test')

    assert_not post.valid?
  end

  test 'missing body' do
    post = Post.new(title: 'test', body: '')

    assert_not post.valid?
  end
end
