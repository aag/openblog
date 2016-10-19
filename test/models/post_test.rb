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

  test 'published? false' do
    post = Post.new(title: 'test', body: '')

    assert_not post.published?
  end

  test 'published? true' do
    post = Post.new(title: 'test', body: '', published_at: Time.now)

    assert post.published?
  end

  test 'unpublished? false' do
    post = Post.new(title: 'test', body: '', published_at: Time.now)

    assert_not post.unpublished?
  end

  test 'unpublished? true' do
    post = Post.new(title: 'test', body: '')

    assert post.unpublished?
  end

  test 'publish_now! sets current time' do
    publish_time = Time.new(2004, 11, 24, 01, 04, 44)
    travel_to publish_time do
      post = Post.new(title: 'This is a test', body: 'This is a test')
      post.publish_now!

      assert_equal(publish_time, post.published_at)
    end
  end

  test 'publish_now! saves post' do
    publish_time = Time.new(2004, 11, 24, 01, 04, 44)
    travel_to publish_time do
      post = Post.new(title: 'This is a test', body: 'This is a test')
      post.publish_now!

      assert_not(post.changed?)
    end
  end
end
