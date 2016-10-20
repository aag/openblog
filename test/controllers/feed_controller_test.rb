require 'test_helper'

class FeedControllerTest < ActionDispatch::IntegrationTest
  test 'should return successfully when there are no posts' do
    get '/feed/posts?format=rss'
    assert_response :success
  end

  test 'should return feed information when there are no posts' do
    get '/feed/posts?format=rss'
    assert_select 'title', 'OpenBlog'
  end

  test 'should return the post title when a published post exists' do
    Post.create(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)

    get '/feed/posts?format=rss'

    assert_select 'item' do |elements|
      assert_equal(1, elements.length)

      elements.each do |element|
        assert_select element, 'title', 'Test Post Title'
      end
    end
  end

  test 'should return no posts only draft posts exist' do
    Post.create(title: 'Test Post Title', body: 'Test Body')

    get '/feed/posts?format=rss'

    posts = css_select('item')
    assert_equal(0, posts.length)
  end
end