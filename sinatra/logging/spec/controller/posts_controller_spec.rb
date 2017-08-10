require_relative '../spec_helper'

describe 'Posts' do
  before do
    Post.create(title: 'First post', description: 'text text')
  end

  it 'posts index' do
    visit '/posts'
    expect(page.status_code).to eq(200)
    expect(page).to have_content('First post')
    expect(page).to have_content('text text')
  end

  it 'posts show' do
    visit '/posts/1'
    expect(page.status_code).to eq(200)
    expect(page).to have_content('First post')
    expect(page).to have_content('text text')
  end

  it 'posts new' do
    visit '/posts/new'
    expect(page.status_code).to eq(200)
    expect(page).to have_content('New post')
  end

  it 'posts edit' do
    visit '/posts/1/edit'
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Edit post')
  end

  it 'create post' do
    visit '/posts/new'

    fill_in(:title, with: 'My new post')
    fill_in(:description, with: 'text text')
    click_button 'Create post'

    post = Post.find_by_title('My new post')

    expect(post.title).to eq('My new post')
    expect(post.description).to eq('text text')

    expect(page).to have_content('My new post')
    expect(page).to have_content('text text')
  end

  it 'edit post' do
    visit '/posts/1/edit'

    fill_in(:title, with: 'Update title')
    fill_in(:description, with: 'update description')
    click_button 'Edit post'

    post = Post.find_by_title('Update title')

    expect(post.title).to eq('Update title')
    expect(post.description).to eq('update description')

    expect(page).to have_content('Update title')
    expect(page).to have_content('update description')
  end

  it 'destroy post' do
  	visit '/posts'
    click_button 'Delete'

    post = Post.all

    expect(post.count).to eq(0)
    expect(page.body).not_to include('New post')
  end
end