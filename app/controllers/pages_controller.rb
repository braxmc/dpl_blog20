class PagesController < ApplicationController
  def index
    @pages = Page.all
    # render index.html.erb
  end

# read - show a single page
  def show
    @page = Page.find(params[:id])
      # params and id are my input
    # render show.html.erb
  end

# READ - show the new form, create in memory
  def new
    @page = Page.new
    # render new.html.erb
  end

# Post Create, create the page in the database
  def create
    @page = Page.new(pages_params)
    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

# READ - show the edit form
  def edit
    @page = Page.find(params[:id])
    # render edit.html.erb
  end

# Put update, updates the page in db
  def update
    @page = P.find(params[:id])
    if @page.update(pages_params)
    else
      render :edit
  end

# Delete action - delete the page in db
  def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end

  private
  def pages_params
    params.requre(:page).permit(:title, :author, :body)
  end

end
