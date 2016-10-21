require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'a comment can find its post' do
    post = Post.new(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    comment = Comment.new(post: post, body: 'Test comment body test text', spam: false)

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

  test 'should be valid with 5 single-character words' do
    post = Post.create(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    comment = Comment.new(post: post, body: 'a a a a a', spam: false)

    assert comment.valid?
  end

  test 'should be valid with 5 single-character umlaut words' do
    post = Post.create(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    comment = Comment.new(post: post, body: 'ö ö ö ö ö', spam: false)

    assert comment.valid?
  end

  test 'should be invalid with empty body' do
    post = Post.create(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    comment = Comment.new(post: post, body: '', spam: false)

    assert_not comment.valid?
  end

  test 'should allow 2 comments per post in one day' do
    travel_to Time.new(2016, 10, 1, 12, 0, 0) do
      post = Post.create(title: 'Test Post Title', body: 'Test Body', published_at: Time.zone.now)
      Comment.create(post: post, body: 'Test comment body text 1')
      comment = Comment.new(post: post, body: 'Test comment body text 2')

      assert comment.valid?
    end
  end

  test 'should not allow 3 comments per post in one day' do
    travel_to Time.new(2016, 10, 1, 12, 0, 0) do
      post = Post.create(title: 'Test Post Title', body: 'Test Body', published_at: Time.zone.now)
      2.times do |i|
        Comment.create(post: post, body: "Test comment body text #{i}")
      end
      comment = Comment.new(post: post, body: 'Test comment body text 3')

      assert_not comment.valid?
    end
  end

  test 'should allow 10 comments per post' do
    post = Post.create(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    for i in 1..9
      travel_to Time.new(2016, 10, i, 01, 01, 0) do
        Comment.create(post: post, body: "Test comment body text #{i}")
      end
    end
    comment = Comment.new(post: post, body: 'Test comment body text 10')

    assert comment.valid?
  end

  test 'should disallow more than 10 comments per post' do
    post = Post.create(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    for i in 1..10
      travel_to Time.new(2016, 10, i, 01, 01, 0) do
        Comment.create(post: post, body: "Test comment body text #{i}")
      end
    end
    comment = Comment.new(post: post, body: 'Test comment body text 11')

    assert_not comment.valid?
  end

  test 'ham is the opposite of spam' do
    post = Post.new(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    comment = Comment.new(post: post, body: 'Test comment body test text', spam: false)

    assert_equal(comment.ham?, !comment.spam?)
  end

  test 'mark_as_spam! changes spam to true' do
    post = Post.new(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    comment = Comment.new(post: post, body: 'Test comment body test text', spam: false)
    comment.mark_as_spam!

    assert comment.spam?
  end

  test 'mark_as_ham! changes ham to true' do
    post = Post.new(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)
    comment = Comment.new(post: post, body: 'Test comment body test text', spam: true)
    comment.mark_as_ham!

    assert comment.ham?
  end
end
