class PhotosController < ApplicationController
  def index
    @photos = Photo.all

    render({ :template => "photos/index" })
  end

  def show
    id = params[:path_id]
    @photo = Photo.find(id)
    if @photo
      render({ :template => "photos/show" })
    end
  end

  def create
    @photo = Photo.new
    @photo.caption = params.fetch("input_caption")
    @photo.image = params.fetch("input_image")
    @photo.owner_id = params.fetch("input_owner_id")

    if @photo.valid?
      @photo.save
      redirect_to("/photos/#{@photo.id}", { :notice => "photo created successfully." })
    else
      redirect_to("/photos", { :notice => "photo failed to create successfully." })
    end
  end

  def create_comment
    @comment = Comment.new
    @comment.body = params.fetch("input_comment")
    @comment.photo_id = params.fetch("input_photo_id")
    @comment.author_id = params.fetch("input_author_id")

    if @comment.valid?
      @comment.save
      redirect_to("/photos/#{@comment.photo_id}", { :notice => "comment created successfully." })
    end
  end

  def update
    id = params.fetch("path_id")
    @photo = Photo.find(id)

    @photo.caption = params.fetch("input_caption")
    @photo.image = params.fetch("input_image")

    if @photo.valid?
      @photo.save
      redirect_to("/photos/#{@photo.id}", { :notice => "Photo updated successfully."} )
    end
  end

  def destroy
    id = params.fetch("path_id")
    @photo = Photo.find(id)

    @photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )
  end
end
