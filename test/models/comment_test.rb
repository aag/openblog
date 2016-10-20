require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'a comment can find its post' do
    post = Post.new(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    comment = Comment.new(post: post, body: 'Test comment body', spam: false)

    assert_equal(post, comment.post)
  end

  test 'a post can find its comments' do
    post = Post.create(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    comment1 = Comment.create(post: post, body: 'Test comment body text 1', spam: false)
    comment2 = Comment.create(post: post, body: 'Test comment body text 2', spam: false)

    comments = post.reload.comments
    assert_equal(2, comments.length)
    assert_equal(comment1, comments[0])
    assert_equal(comment2, comments[1])
  end

  test 'should be invalid with 4 words' do
    post = Post.create(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    comment = Comment.new(post: post, body: 'Test comment body 1', spam: false)

    assert_not comment.valid?
  end

  test 'should be valid with 5 words' do
    post = Post.create(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    comment = Comment.new(post: post, body: 'Test comment body text 1', spam: false)

    assert comment.valid?
  end

  test 'should be invalid with empty body' do
    post = Post.create(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    comment = Comment.new(post: post, body: '', spam: false)

    assert_not comment.valid?
  end
end
