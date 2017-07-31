class BookController < ApplicationController
  layout 'standard'
  def list
    # require "redis"
    # redis = Redis.new
    # require "selenium-webdriver"
    #
    # driver = Selenium::WebDriver.for :firefox
    # driver.navigate.to "http://google.com"
    #
    # element = driver.find_element(name: 'q')
    # element.send_keys "Hello WebDriver!"
    # element.submit
    #
    # puts driver.title
    #
    # driver.quit
    @books = Book.all
    render 'book/list'
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @subjects = Subject.all
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to :action => 'list'
    else
      @subjects = Subject.all
      render :action => 'new'
    end

  end

  def book_params
    params.require(:books).permit(:title, :price, :subject_id, :description)
  end

  def edit
    @book = Book.find(params[:id])
    @subjects = Subject.all
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(book_param)
      redirect_to :action => 'show', :id => @book
    else
      @subjects = Subject.all
      render :action => 'edit'
    end

  end

  def book_param
    params.require(:book).permit(:title, :price, :subject_id, :description)
  end

  def delete
    Book.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def show_subjects
    @subject = Subject.find(params[:id])
  end
end
