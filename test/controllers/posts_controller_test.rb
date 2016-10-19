require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should show an existing post' do
    post = Post.create(title: 'Test Post Title', body: 'Test Body', published_at: Time.now)

    get post_url(post)
    assert_response :success
  end

  test 'should return a 404 for a draft post' do
    post = Post.create(title: 'Test Post Title', body: 'Test Body')

    get post_url(post)
    assert_response :missing
  end

  test 'should show a form on the posts/new page' do
    get new_post_url
    assert_response :success

    forms = css_select('form')
    assert_equal(1, forms.count)
  end

  test 'should create a new post on valid form submission' do
    post posts_path params: { post: { title: 'New Post Title', body: 'New Post Body' } }
    assert_redirected_to admin_path

    assert_equal('Artikel wurde erfolgreich erstellt', flash[:success])
  end

  test 'should re-render the form with errors on invalid form submission' do
    post posts_path params: { post: { title: 'Short', body: 'New Post Body' } }
    assert_response :success

    assert_equal('Fehler beim Erstellen des Artikels', flash[:danger])

    error_fields = css_select('.has-error')
    assert_equal(1, error_fields.count)
  end
end
